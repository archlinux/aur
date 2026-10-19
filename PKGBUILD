# Maintainer: chuanshanjia <1845776552@qq.com>

pkgname=next-ai-draw-io-bin
_pkgname=next-ai-draw-io
_dist_name="Next AI Draw.io"
pkgver=0.5.0
_pkgver=0.5.0
_electronversion=39
pkgrel=1
pkgdesc="Next AI Powered Draw.io (Desktop version). Built for system-wide electron."
arch=('x86_64' 'aarch64')
url="https://github.com/DayuanJiang/next-ai-draw-io"
license=('Apache-2.0')
depends=("electron${_electronversion}" 'hicolor-icon-theme')
provides=('next-ai-draw-io' 'next-ai-draw-io-bin')
conflicts=('next-ai-draw-io' 'next-ai-draw-io-bin-autoupdate')
makedepends=('asar')
options=('!strip' '!emptydirs')

source_x86_64=("${url}/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_amd64.deb")
source_aarch64=("${url}/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_arm64.deb")
source=("${_pkgname}.sh")

sha256sums=('6dec33b7b4169f695f1ff02a9e55a6ce93b421b20177f051b29223911b8d0a8a')
sha256sums_x86_64=('d205d744efa68f584fb60c3e63dbd6289cdd37c6875e7abc03d05ccd9703314e')
sha256sums_aarch64=('d1422a593ced7e0d81d8b7f1cb601365900e012a3e3371bc2be24b0e68deffd9')

prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${_pkgname}/g
        s/@runname@/app.asar/g
        s/@options@//g
    " "${srcdir}/${_pkgname}.sh"
    
    # Extract the data archive
    if [ -f "${srcdir}/data.tar.xz" ]; then
        bsdtar -xf "${srcdir}/data.tar.xz"
    elif [ -f "${srcdir}/data.tar.zst" ]; then
        bsdtar -xf "${srcdir}/data.tar.zst"
    fi

    # Patch the app.asar to use correct resource path
    # The app looks for 'standalone/server.js' in process.resourcesPath
    # When using system electron, process.resourcesPath points to /usr/lib/electron/resources
    # We need to point it to /usr/lib/next-ai-draw-io
    asar e "${srcdir}/opt/${_dist_name}/resources/app.asar" "${srcdir}/app-patched"
    find "${srcdir}/app-patched" -type f -name "*.js" -exec sed -i "s|process.resourcesPath|\"/usr/lib/${_pkgname}\"|g" {} +
    asar p "${srcdir}/app-patched" "${srcdir}/app.asar"

    # Fix the .desktop file
    sed -i "s|Exec=.*|Exec=${_pkgname} %U|" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}

package() {
    # Install launcher script
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    
    # Install application resources
    local _lib_dir="${pkgdir}/usr/lib/${_pkgname}"
    install -d "${_lib_dir}"
    
    # Use the patched app.asar
    install -Dm644 "${srcdir}/app.asar" "${_lib_dir}/app.asar"
    
    # Copy other resources (standalone server, etc.)
    cp -r "${srcdir}/opt/${_dist_name}/resources/standalone" "${_lib_dir}/"
    cp -r "${srcdir}/opt/${_dist_name}/resources/icon.png" "${_lib_dir}/"
    
    # Install license
    install -Dm644 "${srcdir}/opt/${_dist_name}/resources/standalone/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install icons and desktop entry
    cp -r "${srcdir}/usr/share/"* "${pkgdir}/usr/share/"
    
    # Fix directory permissions
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}
