# Maintainer: chuanshanjia <1845776552@qq.com>

pkgname=next-ai-draw-io-bin-autoupdate
_pkgname=next-ai-draw-io
_dist_name="Next AI Draw.io"
pkgver=0.4.13
_pkgver=0.4.13
_electronversion=39
pkgrel=1
pkgdesc="Next AI Powered Draw.io (Desktop version) - Automated Latest Release"
arch=('x86_64' 'aarch64')
url="https://github.com/DayuanJiang/next-ai-draw-io"
license=('Apache-2.0')
depends=("electron${_electronversion}" 'hicolor-icon-theme')
provides=('next-ai-draw-io' 'next-ai-draw-io-bin')
conflicts=('next-ai-draw-io' 'next-ai-draw-io-bin')
makedepends=('asar')
options=('!strip' '!emptydirs')

source_x86_64=("https://github.com/DayuanJiang/next-ai-draw-io/releases/download/v0.4.13/next-ai-draw-io_0.4.13_amd64.deb")
source_aarch64=("https://github.com/DayuanJiang/next-ai-draw-io/releases/download/v0.4.13/next-ai-draw-io_0.4.13_arm64.deb")
source=("${_pkgname}.sh")

sha256sums_x86_64=('b529d6501745ecf63f67cc4801a04a1e04bf9c441450b62d15b03ca0614e8f0d')
sha256sums_aarch64=('616e68d4ccab9ad2af03bc1f44db1c6a9ada40e6c179a0c607835d5fdcd38f91')
sha256sums=('6dec33b7b4169f695f1ff02a9e55a6ce93b421b20177f051b29223911b8d0a8a')

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
