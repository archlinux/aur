# Maintainer: Yuzuki <lxf74663@gmail.com>
pkgname=napcat-qq
pkgver=4.18.7
pkgrel=1
pkgdesc="现代化的基于 NTQQ 的 Bot 协议端实现"
arch=('x86_64' 'aarch64')
url="https://github.com/NapNeko/NapCatQQ"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'xorg-server-xvfb' 'screen')
makedepends=('unzip' 'jq')
install='napcat-qq.install'
_qqvercode="94704804"
_qqver="3.2.23-44343"

source=("NapCat.Shell-${pkgver}.zip::https://github.com/NapNeko/NapCatQQ/releases/download/v${pkgver}/NapCat.Shell.zip"
        "napcat-qq.sh"
        "napcat-qq.install")
sha256sums=('628621ac6333b7c016c1ef213495af39c31ce9c4ce2b8b041ec47b0d8557a3e1'
            '73976443f5bafacab29f1595afcf4f173623a3a6209dbc15d3945485fa72eaef'
            'fecf169a5e052b9b475d9c28594f5f57557c4424391bf1e6190e2d1a33eeb8e2')
sha256sums_x86_64=('a4252719c1beb8adce0da09ebfc310ce50c79ea548f5cce429505765d0bfba84')
sha256sums_aarch64=('870ed3c0e417e9bb3a021c1d56518bc2fbba82d1c3e1871384f64ab7e21923f7')

source_x86_64=("linuxqq_${_qqver}_amd64.deb::https://dldir1.qq.com/qqfile/qq/QQNT/${_qqvercode}/linuxqq_${_qqver}_amd64.deb")

source_aarch64=("linuxqq_${_qqver}_arm64.deb::https://dldir1.qq.com/qqfile/qq/QQNT/${_qqvercode}/linuxqq_${_qqver}_arm64.deb")

package() {
    install -d "${pkgdir}/opt/napcat-qq"

    if [ "$CARCH" = "x86_64" ]; then
        bsdtar -xf "linuxqq_${_qqver}_amd64.deb" -C "${srcdir}" 2>/dev/null || true
    elif [ "$CARCH" = "aarch64" ]; then
        bsdtar -xf "linuxqq_${_qqver}_arm64.deb" -C "${srcdir}" 2>/dev/null || true
    fi

    bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}"
    cp -r "${srcdir}/opt/QQ/"* "${pkgdir}/opt/napcat-qq/"

    # 解压 NapCat 注入文件
    _appdir="${pkgdir}/opt/napcat-qq/resources/app"
    install -d "${_appdir}/app_launcher/napcat-base"
    unzip -q -o "${srcdir}/NapCat.Shell-${pkgver}.zip" -d "${_appdir}/app_launcher/napcat-base/"

    _napcat_mjs="${_appdir}/app_launcher/napcat-base/napcat.mjs"

    # 注入 return null取消屏蔽第三方插件;
    if [ -f "$_napcat_mjs" ]; then
        sed -i -E 's/(getRejectReason\([a-zA-Z0-9, ]*\) *\{)/\1 return null;/g' "$_napcat_mjs"
    fi

    #  清理基础目录下的 Windows 平台专用文件及多余的加载器
    rm -f "${_appdir}/app_launcher/napcat-base/"*.bat \
          "${_appdir}/app_launcher/napcat-base/"*.exe \
          "${_appdir}/app_launcher/napcat-base/"*.dll \
          "${_appdir}/app_launcher/napcat-base/loadNapCat.js"

    #  清理 native 目录下的多余架构和平台 Node 扩展文件
    _nativedir="${_appdir}/app_launcher/napcat-base/native"
    if [ -d "$_nativedir" ]; then
        # 移除 Windows 和 macOS 专属扩展
        find "$_nativedir" -name "*win32*" -exec rm -rf {} + 2>/dev/null || true
        find "$_nativedir" -name "*darwin*" -exec rm -rf {} + 2>/dev/null || true
        rm -rf "$_nativedir/dpapi" # dpapi 是纯 Windows 的接口

        # 移除不属于当前架构的文件
        if [ "$CARCH" = "x86_64" ]; then
            # 构建 amd64 时，删除 arm64 扩展
            find "$_nativedir" -name "*arm64*" -exec rm -rf {} + 2>/dev/null || true
        elif [ "$CARCH" = "aarch64" ]; then
            # 构建 aarch64时，删除 x64 扩展
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

    jq '.main = "./loadNapCat.js"' "${_appdir}/package.json" > "${srcdir}/package.json.tmp"
    mv "${srcdir}/package.json.tmp" "${_appdir}/package.json"

    install -Dm755 "${srcdir}/napcat-qq.sh" "${pkgdir}/usr/bin/napcat-qq"
}
