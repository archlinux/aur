# Maintainer: Sergey Khorev <sergey.khorev@gmail.com>
pkgname=quantlib-git
pkgver=20130919
pkgrel=1
pkgdesc="A free/open-source library for quantitative finance."
arch=('i686' 'x86_64')
url="http://quantlib.org"
license=('BSD')
groups=('devel')
depends=('boost' 'boost-libs')
makedepends=('git')
provides=('quantlib')
conflicts=('quantlib')

_gitroot=https://github.com/lballabio/quantlib.git
_gitname=quantlib

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/QuantLib"

  ./autogen.sh
  ./configure --prefix=/usr --bindir=/usr/lib/quantlib/bin --enable-benchmark --enable-examples
  make
}

package() {
  cd "$srcdir/$_gitname-build/QuantLib"
  make DESTDIR="$pkgdir/" install
	install -D -m644 LICENSE.TXT $pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT
  mkdir -p $pkgdir/usr/bin
	mv $pkgdir/usr/lib/quantlib/bin/quantlib-config $pkgdir/usr/bin/
	mv $pkgdir/usr/lib/quantlib/bin/quantlib-benchmark $pkgdir/usr/bin/
	mv $pkgdir/usr/lib/quantlib/bin/quantlib-test-suite $pkgdir/usr/bin/
  
  
  
}

# vim:set ts=2 sw=2 et:
