# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>
# Contributor: Valentin Huélamo <vhuelamo(at)gmail(dot)com>
#
pkgname="memaker"
pkgver="1.5"
pkgrel="10"
pkgdesc="An application to create avatars from themed packages"
arch=('i686' 'x86_64')
url="http://memaker.org/"
license=('GPL')
depends=('python2-notify' 'python2-xdg' 'python2-rsvg' 'python2-numpy' 'gnome-python-desktop')
optdepends=('python2-pillow: for better thumbnails'
            'python2-launchpadlib: Allow Memaker to use a launchpad account')
source=("http://launchpad.net/memaker/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.ui.diff")
sha256sums=('9a95f165d2f6a6df8a7b1849b161cfd74946dc80c03c11be0e10c5e3a8d1284c'
            '9ea9baf37241534a2172c4e4b388aacad3712ce3f7951d90216423377154b55b'
            'c539f094a70452d6c836eba8c600105496687b2ce3347267d93cdcc9429ad456')

_sitepackages=`python2 -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"`

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ### apply UI patch from https://bugs.launchpad.net/memaker/+bug/423492/comments/8
    patch -Np0 -i ../${pkgname}.ui.diff

    ### Python2-pillow (PIL) Fix ###
    sed -i "s|import Image|from PIL import Image|g" ./MeMaker/image_loader.py
    sed -i "s|import Image|from PIL import Image|g" ./MeMaker/MeMakerGui.py
    sed -i "s|python-imaging|python2-pillow|g" ./MeMaker/MeMakerGui.py
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ### Copy source files
    mkdir -p ${pkgdir}${_sitepackages}/${pkgname}
    cp -r . ${pkgdir}${_sitepackages}/${pkgname}

    ### Create shell script
    mkdir ${pkgdir}/usr/bin
    echo "#!/bin/sh
    python2 "${_sitepackages}"/"${pkgname}/${pkgname} > ${pkgdir}/usr/bin/${pkgname}
    chmod a+x ${pkgdir}/usr/bin/${pkgname}

    ### Desktop file and icon
    install -D -m644 ${srcdir}/${pkgname}-${pkgver}/data/logo.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
    install -D -m644 ${startdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
