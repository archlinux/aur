# Maintainer: Masood Behabadi <masood@dentcat.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Henri van de Munt <(firstname) @ gmail.com>
# Contributor: KafCoppelia <k740677208@gmail.com>

# BUILD INSTRUCTIONS:
#
# 1. Go to https://softwaretools.infineon.com/tools/com.ifx.tb.tool.modustoolbox and login with your Infineon account.
# 2. Click on "Download" and download the current version
# 3. Download the .deb package and place it in the same directory as the PKGBUILD
# 4. Build

_pkgname=ModusToolbox
pkgname=modustoolbox
_pkgver=3.6
pkgver=${_pkgver}.0.17979
pkgrel=1
pkgdesc="A set of multi-platform development tools and a comprehensive suite of GitHub-hosted firmware libraries. \
    Together, they enable an immersive development experience for customers creating converged MCU and Wireless systems."
arch=('x86_64')
license=("LicenseRef-${pkgname}")
depends=('diffutils' 'git' 'make' 'coreutils' 'perl' 'python3' 'libxcb' 'python-pygments' 'at-spi2-core' 'freetype2' 'libcups'  \
    'xcb-util-keysyms' 'gtk3' 'libx11' 'libglvnd' 'libxkbcommon' 'libwebp' 'libxkbcommon-x11' 'pango' 'xcb-util-wm' 'glib2'     \
    'cairo' 'openssl-1.1' 'libice' 'wayland' 'fontconfig' 'dbus' 'libsm' 'glibc' 'libdrm' 'xcb-util-wm' 'xcb-util-image'        \
    'xcb-util-cursor' 'xcb-util-renderutil' 'qt6-base' 'gdk-pixbuf2')
conflicts=("modustoolbox-no-gcc")
provides=("modustoolbox")
url="https://softwaretools.infineon.com/tools/com.ifx.tb.tool.modustoolbox"
_source="${pkgname}_${pkgver}_Linux_x64.deb"
source=("file://${_source}")
sha256sums=('f4da74d4aef1852f73f84ebd5a0ae8ad9c58c640494a1b4f89dc4d1ff6134fbb')
options=('!strip')
install="${pkgname}.install"


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

    install -d ${_install_dir}
    cp -ar ${srcdir}/opt/${_pkgname}/* ${_install_dir}
    cp -ar ${srcdir}/usr ${pkgdir}/

    # Install license
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 ${srcdir}/opt/${_pkgname}/CYPRESS\ END\ USER\ LICENSE\ AGREEMENT\ ${_pkgver}.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
