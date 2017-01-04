# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=libxpresent
pkgver=1.0.0+2+gdd6771c
pkgrel=1
pkgdesc="Xlib-compatible API for the Present extension"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/xorg/lib/libXpresent/"
license=('custom')
depends=('presentproto' 'libxfixes' 'libxrandr')
makedepends=('git' 'xorg-util-macros')
_commit=dd6771cdf6f04cde37eb14891573c0e55be83241
source=("git+https://anongit.freedesktop.org/git/xorg/lib/libXpresent.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "libXpresent"
  git describe --long | sed 's/libXpresent-//;s/-/+/g'
}

build() {
  cd "libXpresent"

  ./autogen.sh --prefix=/usr --disable-dependency-tracking
  # -Wl,--as-needed should come before all libraries
  sed -i -e '/\$CC/s/-shared/\0 -Wl,--as-needed/' libtool
  make
}

package() {
  cd "libXpresent"

  make DESTDIR="${pkgdir}" install

  install -D -m 0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
