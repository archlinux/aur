# Maintainer: Ernesto Castellotti <mail@ernestocastellotti.it>
pkgdesc="A crappy lightweight alternative to the Nspire-specific parts of TiLP built with a simple API and with minimal dependancies."
_pkgname=libnspire
pkgname=${_pkgname}-git
pkgver=0.r25.g7649e3c
pkgrel=1
arch=('any')
license=('LGPL-3.0')
url="https://github.com/Vogtinator/${_pkgname}"
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
depends=('libusb')
makedepends=('git' 'pkgconfig')
source=("$pkgname::git://github.com/Vogtinator/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}/

    if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
        printf '%s.r%s.g%s' \
            "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
            "$(git rev-list --count ${GITTAG}..)" \
            "$(git log -1 --format='%h')"
    else
        printf '0.r%s.g%s' \
            "$(git rev-list --count master)" \
            "$(git log -1 --format='%h')"
    fi
}

prepare() {
  cd ${pkgname}
  autoreconf -fi
}

build() {
 cd ${pkgname}
  ./configure --prefix=/usr
  make
}

package() {
  make -C ${pkgname} DESTDIR="${pkgdir}" install
} 
