# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Mick Elliot <micke@sfu.ca>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=muscle
pkgver=5.2
pkgrel=1
pkgdesc="Multiple sequence comparison by log-expectation"
arch=('i686' 'x86_64')
url="https://github.com/rcedgar/muscle"
license=('GPL-3.0-or-later')
source=(Makefile $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('d4f9c3230bb6a612e34ac3219993ab8d874ee058e284bb221d1a9d1a40aff529'
            '7aff1473241a36da94a88f37920a343fae91d2b6faae22e15c06591d1d0339b6')

prepare() {
  # Project does not come with a Makefile, but downloads a python script that
  # writes a Makefile. Provide it in sources instead, and create also generated
  # gitver.txt

  cd "$srcdir"/$pkgname-$pkgver
  # -static flag does not find -lgomp (part of gcc-libs)
  sed "/LDFLAGS += -static/s:-static::" ../Makefile > src/Makefile
  echo '"0"' > src/gitver.txt
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make -C src
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -Dm755 bin/muscle "$pkgdir"/usr/bin/muscle
}
