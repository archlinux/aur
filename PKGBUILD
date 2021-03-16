# Maintainer: Fabian Brosda <fabi3141@gmx.de>
#
# The patches are taken from the debian repository of karme
# http://karme.de/debian/pool/main/g/gauche-fastcgi/

pkgname=gauche-fastcgi
_pkgname=Gauche-fastcgi
pkgver=0.1.3
pkgrel=2
pkgdesc='Gauche module for fastcgi'
url='https://osdn.net/projects/gauche/'
arch=('i686' 'x86_64')
depends=('gauche' 'fcgi')
makedepends=('make' 'autoconf')
license=('BSD')

# include any patches you want to have applied here
source=('https://osdn.net/dl/gauche/Gauche-fastcgi-0.1.3.tgz'
        '00_posthook.patch'
        '01_fixstub.patch'
        '02_scm_port_fix.patch')
sha1sums=('3d4a2188e2a57c5b355146dab1897390a41c5d37'
          '81825b5caa63743c6ac68a565e50e3fdd6116467'
          '3aa224bb5593732ec4eedf3c8db68b51e5fd532c'
          'd84f9fb88fe138d289e05b6590face310d81f19a')

prepare() {
    cd "${_pkgname}-${pkgver}"

    for filename in "${source[@]}";
    do
        if [[ "$filename" =~ \.patch$ ]]; then
            patch -p1 -N -i "$srcdir/${filename##*/}"
        fi
    done
}

build() {
    cd "${_pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

check() {
    cd "${_pkgname}-${pkgver}"
    make check
}

package() {
    cd "${_pkgname}-${pkgver}"

    make DESTDIR="$pkgdir" install
}
