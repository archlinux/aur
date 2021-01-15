# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=libusrsctp
pkgver=0.9.5.0
pkgrel=1
pkgdesc="A portable SCTP userland stack"
arch=(i686 x86_64)
url=https://github.com/sctplab/usrsctp
license=(custom)
depends=(glibc)
makedepends=(automake autoconf)
conflicts=(libusrsctp-git)
provides=(libusrsctp-git)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('7b28706449f9365ba9750fd39925e7171516a1e3145d123ec69a12486637ae2393ad4c587b056403298dc13c149f0b01a262cbe4852abca42e425d7680c77ee3')

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
