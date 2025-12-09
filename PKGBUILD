# Maintainer: KafCoppelia <k740677208@gmail.com>

# BUILD INSTRUCTIONS:
#
# 1. Go to https://softwaretools.infineon.com/tools/com.ifx.tb.tool.modustoolboxpackmachinelearning and login with your Infineon account.
# 2. Click on "Download" and download the current version
# 3. Download the .deb package and place it in the same directory as the PKGBUILD
# 4. Build

_pkgname=ModusToolbox
pkgname=modustoolbox-machine-learning-pack
_pkgver=3.0.0
pkgver=${_pkgver}.2416
pkgrel=1
pkgdesc="Enables you to use ModusToolbox Machine Learning tools and assets for all model deployment and validation within the ModusToolbox environment."
arch=('x86_64')
license=("LicenseRef-${pkgname}")
depends=( 'libxcb' 'freetype2' 'libcups' 'xcb-util-keysyms' 'libx11' 'libglvnd' 'libxkbcommon' 'libxkbcommon-x11' 'xcb-util-wm' 'glib2' 'openssl-1.1'   \
    'wayland' 'fontconfig' 'dbus' 'glibc' 'libdrm' 'xcb-util-wm' 'xcb-util-image' 'xcb-util-renderutil' 'qt5-base' 'qt5-svg' 'ncurses5-compat-libs'     \
    'libxcomposite')
_url_package_name="modustoolboxpackmachinelearning"
url="https://softwaretools.infineon.com/tools/com.ifx.tb.tool.${_url_package_name}"
_source="${_url_package_name}_${pkgver}_Linux_x64.deb"
source=("file://${_source}")
sha256sums=('1d1de67afddc15b9603fde8ba74027ec35490a896467a2dbf3c3b24434410b7e')
options=('!strip')


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
    install -Dm644 ${srcdir}/usr/share/doc/ModusToolbox-Machine-Learning-Pack-${pkgver}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
