# Maintainer: Yuzuki <lxf74663@gmail.com>
pkgname=napcat-qq
pkgver=4.18.8
pkgrel=2
pkgdesc="现代化的基于 NTQQ 的 Bot 协议端实现"
arch=('x86_64' 'aarch64')
url="https://github.com/NapNeko/NapCatQQ"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'xorg-server-xvfb' 'screen')
makedepends=('unzip' 'clang')
install='napcat-qq.install'
_qqver="3.2.29-49738"

source=("NapCat.Shell-${pkgver}.zip::https://github.com/NapNeko/NapCatQQ/releases/download/v${pkgver}/NapCat.Shell.zip"
        "napcat-qq.sh"
        "napcat-qq.install"
        "launcher.cpp")

sha256sums=('1454c43ba7d8292b4dd4583bfe12dc6fd1b3a96fbaf52d45c8578cf873952258'
            'aeead48bc5d3e00ae7fd67d1b31b98d79ec5283210d21a69b3521537cbcea39c'
            'fecf169a5e052b9b475d9c28594f5f57557c4424391bf1e6190e2d1a33eeb8e2'
            '601b88813a8563dcd71c7961fc34a9b352226671e31aa603faa9f0f4fe54995a')
sha256sums_x86_64=('1e3828079673c94994bc0f4780d5d8528647639920659862d49d1c2f2a198e25')
sha256sums_aarch64=('5bcd8ccda401fbfa1821a7c3c758f84a253c317568f0b9c2d74426a24749e9a6')

source_x86_64=("linuxqq_${_qqver}_amd64.deb::https://qqdl.gtimg.cn/qqfile/QQNT/9.9.31/beta/00e6a3e7/linuxqq_3.2.29-49738_amd64.deb")
source_aarch64=("linuxqq_${_qqver}_arm64.deb::https://qqdl.gtimg.cn/qqfile/QQNT/9.9.31/beta/00e6a3e7/linuxqq_3.2.29-49738_arm64.deb")

build() {
    cd "${srcdir}"
    echo "编译 launcher 动态注入库..."

    clang++ -shared -fPIC \
        -Os \
        -flto \
        -march=native \
        -fno-exceptions \
        -fno-rtti \
        -fvisibility=hidden \
        -Wl,--exclude-libs,ALL \
        launcher.cpp -o libnapcat_launcher.so -ldl
}

package() {
    install -d "${pkgdir}/opt/napcat-qq"

    if [ "$CARCH" = "x86_64" ]; then
        bsdtar -xf "linuxqq_${_qqver}_amd64.deb" -C "${srcdir}" 2>/dev/null || true
    elif [ "$CARCH" = "aarch64" ]; then
        bsdtar -xf "linuxqq_${_qqver}_arm64.deb" -C "${srcdir}" 2>/dev/null || true
    fi

    bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}"
    cp -r "${srcdir}/opt/QQ/"* "${pkgdir}/opt/napcat-qq/"

    # 解压 NapCat 核心文件
    _appdir="${pkgdir}/opt/napcat-qq/resources/app"
    install -d "${_appdir}/app_launcher/napcat-base"
    unzip -q -o "${srcdir}/NapCat.Shell-${pkgver}.zip" -d "${_appdir}/app_launcher/napcat-base/"

    _napcat_mjs="${_appdir}/app_launcher/napcat-base/napcat.mjs"

    # 注入 return null 取消屏蔽第三方插件
    if [ -f "$_napcat_mjs" ]; then
        sed -i -E 's/(getRejectReason\([a-zA-Z0-9, ]*\) *\{)/\1 return null;/g' "$_napcat_mjs"
    fi

    # 清理多余平台文件
    rm -f "${_appdir}/app_launcher/napcat-base/"*.bat \
          "${_appdir}/app_launcher/napcat-base/"*.exe \
          "${_appdir}/app_launcher/napcat-base/"*.dll \
          "${_appdir}/app_launcher/napcat-base/loadNapCat.js"

    _nativedir="${_appdir}/app_launcher/napcat-base/native"
    if [ -d "$_nativedir" ]; then
        find "$_nativedir" -name "*win32*" -exec rm -rf {} + 2>/dev/null || true
        find "$_nativedir" -name "*darwin*" -exec rm -rf {} + 2>/dev/null || true
        rm -rf "$_nativedir/dpapi"

        if [ "$CARCH" = "x86_64" ]; then
            find "$_nativedir" -name "*arm64*" -exec rm -rf {} + 2>/dev/null || true
        elif [ "$CARCH" = "aarch64" ]; then
            find "$_nativedir" -name "*x64*" -exec rm -rf {} + 2>/dev/null || true
        fi
    fi

    cat > "${_appdir}/loadNapCat.js" << 'EOF'
(async () => {
    const os = require('os');
    const path = require('path');
    const target = path.join(os.homedir(), '.config', 'napcat-qq-plugin', 'napcat.mjs');
    await import('file://' + target);
})();
EOF

    install -Dm755 "${srcdir}/libnapcat_launcher.so" "${pkgdir}/opt/napcat-qq/libnapcat_launcher.so"

    # 安装启动脚本
    install -Dm755 "${srcdir}/napcat-qq.sh" "${pkgdir}/usr/bin/napcat-qq"
}
