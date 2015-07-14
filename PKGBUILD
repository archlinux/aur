# Contributor: Mantas Mikulėnas <grawity@gmail.com>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
pkgname=knc
pkgver=1.10.r231.geffa13c
pkgrel=1
pkgdesc="kerberised netcat, provides mutually authenticated tunnel"
arch=('i686' 'x86_64')
url="http://oskt.secure-endpoints.com/knc.html"
license=('MIT')
depends=('krb5')
source=('git+https://github.com/elric1/knc.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/knc"

  #git tag -f 1.10 effa13c08b9aa6e4c10336a3cf118eea289ca14d
  #git tag -f 1.8 712fc0fb1fc3b9de0200dee9bcdd7f8a1fc1aa78
  #git describe --tags | sed "s/-/.r/; s/-/./"

  local ver=$({ echo 'changequote([,])dnl'
              echo 'define(AC_INIT,$2)dnl'
              grep '^AC_INIT(.*)' configure.ac; } | m4)
  local rev=$(git rev-list --count HEAD)
  local git=$(git rev-parse --short HEAD)
  echo "$ver.r$rev.g$git"
}

build() {
  cd "$srcdir/knc"

  autoreconf -f -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/knc"

  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
