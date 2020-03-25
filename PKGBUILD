# $Id$
# Maintainer: physkets <physkets // at // tutanota dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Filippo 'JoeyrS' Civiletti <joeyrs@gmail.com>

_pkgname=armagetronad
pkgname=${_pkgname}-git
pkgver='r4128.7392b902f'
pkgrel=6
pkgdesc='A Tron Clone in 3D.'
arch=('x86_64')
url='http://armagetronad.net/'
license=('GPL')
depends=('sdl2_image' 'libxml2' 'sdl2_mixer' 'ftgl' 'boost-libs' 'protobuf')
optdepends=('python: language updater')
makedepends=('boost')
provides=('armagetronad')
conflicts=('armagetronad')
source=("git+https://gitlab.com/armagetronad/armagetronad.git")
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
    cd "${srcdir}/${_pkgname}"
    2to3 -w language/update.py
}

build() {
    cd "${srcdir}/${_pkgname}"
    
    ./bootstrap.sh
    
    ./configure --prefix=/usr \
       --sysconfdir=/etc \
       --mandir=/usr/share/man \
       --disable-games \
       --enable-automakedefaults \
       --disable-uninstall
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
    install -D -m 644 "desktop/${_pkgname}-armagetronad.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-armagetronad.desktop"
    install -d "${pkgdir}/usr/share/pixmaps/"
    ln -s /usr/share/armagetronad/desktop/icons/large/armagetronad.png \
          "${pkgdir}/usr/share/pixmaps/${_pkgname}-armagetronad.png"
    mv "${pkgdir}/usr/bin/armagetronad" "${pkgdir}/usr/bin/armagetronad_bin"
    printf "#!/bin/bash\n/usr/bin/armagetronad_bin --configdir /etc/armagetronad --datadir /usr/share/armagetronad" > "${pkgdir}/usr/bin/armagetronad"
    chmod +x "${pkgdir}/usr/bin/armagetronad"
}
