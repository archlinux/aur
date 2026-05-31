# Maintainer: Yuzuki <lxf74663@gmail.com>
pkgname=napcat-qq
pkgver=4.18.4
pkgrel=2
pkgdesc="现代化的基于 NTQQ 的 Bot 协议端实现"
arch=('x86_64')
url="https://github.com/NapNeko/NapCatQQ"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'xorg-server-xvfb' 'screen')
makedepends=('unzip' 'jq')
install='napcat-qq.install'
_qqvercode="94704804"
_qqver="3.2.23-44343"

source_x86_64=("linuxqq_${_qqver}_amd64.deb::https://dldir1.qq.com/qqfile/qq/QQNT/${_qqvercode}/linuxqq_${_qqver}_amd64.deb")
sha256sums_x86_64=('a4252719c1beb8adce0da09ebfc310ce50c79ea548f5cce429505765d0bfba84')

source=("NapCat.Shell.zip::https://github.com/NapNeko/NapCatQQ/releases/download/v${pkgver}/NapCat.Shell.zip"
        "napcat-qq.sh"
        "napcat-qq.install")

sha256sums=('b275faf64fdbf3af2d4ae705c70450e219853ab9505c29f62ccd8e09b0b13871'
            'd5c0a1e4e7df95c96971fd5447c9011e5d5327d142a1e53a772b035670056e44'
            'fecf169a5e052b9b475d9c28594f5f57557c4424391bf1e6190e2d1a33eeb8e2')

package() {
    install -d "${pkgdir}/opt/napcat-qq"
    if [ "$CARCH" = "x86_64" ]; then
        bsdtar -xf "linuxqq_${_qqver}_amd64.deb" -C "${srcdir}"
    fi
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}"
    cp -r "${srcdir}/opt/QQ/"* "${pkgdir}/opt/napcat-qq/"

    # 解压 NapCat 注入文件
    _appdir="${pkgdir}/opt/napcat-qq/resources/app"
    install -d "${_appdir}/app_launcher/napcat-base"
    unzip -q -o "${srcdir}/NapCat.Shell.zip" -d "${_appdir}/app_launcher/napcat-base/"

    # 清理 Windows 平台专用文件及多余的加载器
    rm -f "${_appdir}/app_launcher/napcat-base/"*.bat \
      "${_appdir}/app_launcher/napcat-base/"*.exe \
      "${_appdir}/app_launcher/napcat-base/"*.dll \
      "${_appdir}/app_launcher/napcat-base/loadNapCat.js"
    # 删除所有 arm64 相关原生模块
    find "${_appdir}/app_launcher/napcat-base/native" -name "*arm64*" -exec rm -rf {} +

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
