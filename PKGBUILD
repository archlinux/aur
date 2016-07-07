# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=libusrsctp
pkgver='0.9.3.0'
pkgrel=1
pkgdesc="A portable SCTP userland stack"
arch=('i686' 'x86_64')
url="https://github.com/sctplab/usrsctp"
license=('custom')
depends=('glibc')
makedepends=('automake' 'autoconf')
conflicts=('libusrsctp-git')
provides=('libusrsctp-git')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('ef9c6361ad0183f887666883f9fc8911267797c3a7a9f03712249db350b3602eda70b60bbf93eabcf46049dd922e18ffa7ea6f49a69490ef2b815e812dfbbefb')

_EXTRA_FLAGS='-Wno-error=unused-but-set-variable'

build() {
  cd ${pkgname#lib}-${pkgver}
  ./bootstrap

  eval "$(sed -e '/^CFLAGS=/p' -e d /etc/makepkg.conf)"
  eval "$(sed -e '/^CXXFLAGS=/p' -e d /etc/makepkg.conf)"
  eval "$(sed -e '/^LDFLAGS=/p' -e d /etc/makepkg.conf)"

  export CFLAGS="${CFLAGS} ${_EXTRA_FLAGS}"
  export CXXFLAGS="${CXXFLAGS} ${_EXTRA_FLAGS}"
  ./configure --prefix=/usr --disable-debug

  make
}

package() {
  cd ${pkgname#lib}-${pkgver}
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
