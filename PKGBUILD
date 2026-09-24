# Maintainer: KafCoppelia <k740677208@gmail.com>

# BUILD INSTRUCTIONS:
#
# 1. Go to https://softwaretools.infineon.com/tools/com.ifx.tb.tool.modustoolboxpackmachinelearning and login with your Infineon account.
# 2. Click on "Download" and download the current version
# 3. Download the .deb package and place it in the same directory as the PKGBUILD
# 4. Build

_pkgname=ModusToolbox
pkgname=modustoolbox-machine-learning-pack
_pkgver=3.3.0
pkgver=${_pkgver}.2864
pkgrel=1
pkgdesc="Enables you to use ModusToolbox Machine Learning tools and assets for all model deployment and validation within the ModusToolbox environment."
arch=('x86_64')
license=("LicenseRef-${pkgname}")
depends=('dbus' 'glib2' 'glibc' 'gtk3' 'krb5' 'libcups' 'libdrm' 'libglvnd' 'libx11' 'libxcb'
        'libxkbcommon' 'libxkbcommon-x11' 'openssl-1.1' 'pango' 'qt6-base' 'wayland' 'xcb-util-cursor'
        'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm' 'zlib' 'zstd'
        'python-setuptools' 'python-tqdm' 'python-colorama' 'python-urllib3' 'python-hypothesis'
        'python-filelock' 'python' 'python-packaging' 'python-pytest' 'python-scipy' 'python-typing_extensions'
        'python-yaml' 'python-numpy' 'python-pillow' 'python-psutil' 'python-importlib-metadata'
        )
_url_package_name="modustoolboxpackmachinelearning"
url="https://softwaretools.infineon.com/tools/com.ifx.tb.tool.${_url_package_name}"
_source="${_url_package_name}_${pkgver}_Linux_x64.deb"
source=("file://${_source}")
sha256sums=('c263b792f1d75a1db174b7371e587152ce817938deb11ba7751eae5a90dd5353')


prepare() {
    cd ${srcdir}
    bsdtar -xf data.tar.gz -C ./
    rm data.tar.gz
    mv ./opt/Tools/${_pkgname} ./opt/${_pkgname}
    # Remove the empty directory
    rm -r ./opt/Tools
    # Some extractions leave a duplicated ModusToolbox root; keep the canonical packs tree only.
    if [[ -d ./opt/${_pkgname}/${_pkgname}/packs && -d ./opt/${_pkgname}/packs ]]; then
        rm -rf ./opt/${_pkgname}/${_pkgname}
    fi
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
    install -Dm644 ${srcdir}/usr/share/doc/${_pkgname}-Machine-Learning-Pack-${pkgver}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
