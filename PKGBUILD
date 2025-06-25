# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ubports-installer-bin
pkgver=0.11.1
_electronversion=33
pkgrel=1
pkgdesc="A simple tool to install Ubuntu Touch on UBports devices.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/ubports/ubports-installer"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'libusb'
    'android-sdk-platform-tools'
    '7zip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('372b22fded4264f184bc1388ccc1436e7e0298e67d1c99a2f9e2aeff51d30020'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}.bin" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i "s/\/opt\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    rm -rf "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/7zip-bin/"{mac,linux/{arm*,ia32}}
    ln -sf "/usr/bin/7za" "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/7zip-bin/linux/x64/7za"
    _file_list=(adb etc1tool fastboot make_f2fs make_f2fs_casefold mke2fs mke2fs.conf sqlite3)
    for _files in "${_file_list[@]}";do
		ln -sf "/opt/android-sdk/platform-tools/${_files}" \
            "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/android-tools-bin/dist/linux/x86/${_files}"
	done
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}