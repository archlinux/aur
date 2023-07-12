# $Id$
# Maintainer: notvidya <transient.sepia // at // gmail dot com>
# Contributor: physkets <physkets // at // tutanota dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Filippo 'JoeyrS' Civiletti <joeyrs@gmail.com>

_pkgname=armagetronad
pkgname=${_pkgname}-git
pkgver=r5415.f775378e
pkgrel=1
pkgdesc='A Tron Clone in 3D.'
arch=('x86_64')
url='http://armagetronad.net/'
license=('GPL')
depends=('sdl2_image' 'libxml2' 'sdl2_mixer' 'ftgl' 'boost-libs' 'protobuf' 'hicolor-icon-theme')
optdepends=('python: language updater' 'glew: Graphics on X11' 'glew-wayland: Graphics on Wayland')
makedepends=('boost')
provides=('armagetronad')
conflicts=('armagetronad')
source=("git+https://gitlab.com/armagetronad/armagetronad.git"
        "${pkgname}.patch.2023")
sha1sums=('SKIP'
          '93ec913320e7b48889088634883d72a02e7b4a20')

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

    cd "${srcdir}"
    patch -Np1 -i "armagetronad-git.patch.2023"

    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
    install -D -m 644 "desktop/${_pkgname}-armagetronad.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-armagetronad.desktop"
    for directory in 16x16 32x32 48x48; do
       ln -s /usr/share/armagetronad/desktop/icons/${directory}/armagetronad.png "$pkgdir/usr/share/icons/hicolor/${directory}/apps/armagetronad.png"
    done
    mv "${pkgdir}/usr/bin/armagetronad" "${pkgdir}/usr/bin/armagetronad_bin"
    printf "#!/bin/bash\n/usr/bin/armagetronad_bin --configdir /etc/armagetronad --datadir /usr/share/armagetronad" > "${pkgdir}/usr/bin/armagetronad"
    chmod +x "${pkgdir}/usr/bin/armagetronad"
}
