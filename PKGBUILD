# Maintainer: Yuzuki <lxf74663@gmail.com>
pkgname=napcat-qq
pkgver=4.18.19
pkgrel=1
pkgdesc="现代化的基于 NTQQ 的 Bot 协议端实现"
arch=('x86_64' 'aarch64')
url="https://github.com/NapNeko/NapCatQQ"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'xorg-server-xvfb' 'screen')
makedepends=('unzip' 'clang')
install='napcat-qq.install'
_qqver="3.2.30-50969"

source=("NapCat.Shell-${pkgver}.zip::https://github.com/NapNeko/NapCatQQ/releases/download/v${pkgver}/NapCat.Shell.zip"
        "napcat-qq.sh"
        "napcat-qq.install"
        "launcher.cpp")

sha256sums=('c5b7423d1d5b8c555d62cd9e4059b1908cc0986e7b5c85a0f450f4a8ed170acf'
            '2a60a09b349558bff7e638f7b5c6b0563b62457293b2d9a3d8cb63bb84a932b7'
            'fecf169a5e052b9b475d9c28594f5f57557c4424391bf1e6190e2d1a33eeb8e2'
            '601b88813a8563dcd71c7961fc34a9b352226671e31aa603faa9f0f4fe54995a')
sha256sums_x86_64=('98f0d8cfd0d689e898c36432feada8ada2df9d287dda52a3389cc795978c0c0e')
sha256sums_aarch64=('68d59a60f8bb67b84fffe21cb67d4f1e54628b8383c8eb296e3c632ec43dc392')

source_x86_64=("linuxqq_${_qqver}_amd64.deb::https://qqdl.gtimg.cn/qqfile/QQNT/9.9.32/beta/fd40a3ec/linuxqq_3.2.30-50969_amd64.deb")
source_aarch64=("linuxqq_${_qqver}_arm64.deb::https://qqdl.gtimg.cn/qqfile/QQNT/9.9.32/beta/fd40a3ec/linuxqq_3.2.30-50969_arm64.deb")

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
