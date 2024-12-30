# Maintainer: KafCoppelia <k740677208@gmail.com>

_pkgname=ModusToolbox
_pkgname_base=modustoolbox
pkgname=${_pkgname_base}-no-gcc
_pkgver=3.4
pkgver=${_pkgver}.0.17114
pkgrel=1
pkgdesc="A set of multi-platform development tools and a comprehensive suite of GitHub-hosted firmware libraries.   \
    Together, they enable an immersive development experience for customers creating converged MCU and Wireless     \
    systems. Without bundled gcc."
arch=('x86_64')
license=("LicenseRef-${_pkgname_base}")
depends=('diffutils' 'git' 'make' 'coreutils' 'perl' 'python3' 'libxcb' 'python-pygments' 'at-spi2-core' 'freetype2' 'libcups'  \
    'xcb-util-keysyms' 'gtk3' 'libx11' 'libglvnd' 'libxkbcommon' 'libwebp' 'libxkbcommon-x11' 'pango' 'xcb-util-wm' 'glib2'     \
    'cairo' 'openssl-1.1' 'libice' 'wayland' 'fontconfig' 'dbus' 'libsm' 'glibc' 'libdrm' 'xcb-util-wm' 'xcb-util-image'        \
    'xcb-util-cursor' 'xcb-util-renderutil' 'qt6-base' 'gdk-pixbuf2')
conflicts=("modustoolbox")
provides=("modustoolbox")
url="https://softwaretools.infineon.com/tools/com.ifx.tb.tool.modustoolbox"
_source="${_pkgname_base}_${pkgver}_Linux_x64.deb"
source=("file://${_source}")
sha256sums=('e07bfcfba414632171ca5757a83d9ff1e3aca906a045560cc625458944affc4d')
options=('!strip')
install="${_pkgname_base}.install"


prepare() {
    cd ${srcdir}
    bsdtar -xf data.tar.gz -C ./
    rm data.tar.gz
    mv ./opt/Tools/${_pkgname} ./opt/${_pkgname}
    # Remove the empty directory
    rm -r ./opt/Tools
    # Update link in desktop files
    find ./usr/share/applications/ -name "*.desktop" -exec sed -i "s/opt\/Tools/opt/" {} +
}

package() {
    cd ${srcdir}

    _install_dir=${pkgdir}/opt/${_pkgname}

    # Remove bundled ARM GNU Toolchain
    rm -r ${srcdir}/opt/${_pkgname}/tools_${_pkgver}/gcc

    install -d ${_install_dir}
    cp -ar ${srcdir}/opt/${_pkgname}/* ${_install_dir}
    cp -ar ${srcdir}/usr ${pkgdir}/

    # Install license
    install -d ${pkgdir}/usr/share/licenses/${_pkgname_base}
    install -Dm644 ${srcdir}/opt/${_pkgname}/CYPRESS\ END\ USER\ LICENSE\ AGREEMENT\ ${_pkgver}.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
