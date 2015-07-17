# Contributor: Isak Karlsson <isak.karlsson@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=rust-nightly
pkgver=1.3.0_2015.07.18
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A safe, concurrent, practical language'
url='http://www.rust-lang.org/'
license=('MIT' 'Apache')
depends=('shared-mime-info')
makedepends=('libffi' 'perl' 'python2' 'curl' 'clang')
source=("http://static.rust-lang.org/dist/rustc-nightly-src.tar.gz")
sha256sums=('SKIP')
install=rust.install
options=('!makeflags' 'staticlibs' '!strip' '!emptydirs')
conflicts=('rust')
provides=('rust')

build() {
  cd rustc-nightly

  ./configure --prefix=/usr --enable-docs --disable-rpath 

  # avoid python makedepend (force fallback to python2)
  sed -i 's/^PYTHONVERSION.*/PYTHONVERSION := 3/' src/llvm/Makefile.rules
  make
 }

package() {
  cd rustc-nightly
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  cd "$pkgdir/usr/lib"
  ln -sf rustlib/$CARCH-unknown-linux-gnu/lib/* .
}
