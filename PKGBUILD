# Contributor: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Bartłomiej Piotrowski <spam@bpiotrowski.pl>
# Contributor: Nikolay Amiantov <nikoamia@gmail.com>

pkgname=ocaml-lablgl
pkgver=1.05
pkgrel=4
pkgdesc='OCaml interface to OpenGL'
url="https://forge.ocamlcore.org/projects/lablgl/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('glu' 'glut' 'libxi' 'libxmu' 'libgl' 'ocaml>=4.02')
makedepends=('camlp4')
options=('!strip' '!makeflags' 'staticlibs')
source=("https://forge.ocamlcore.org/frs/download.php/1254/lablgl-$pkgver.tar.gz")
sha256sums=('d8ff03e35b970d2b23a942f9e6ed65da5a6c123986bd0ecf5424a6205af34b61')

prepare() {
  cd "lablgl-$pkgver"
  sed 17d Makefile.config.linux.mdk > Makefile.config
}

build() {
  cd "lablgl-$pkgver"
  make lib
  make libopt
}

package() {
  cd "lablgl-$pkgver"

  make install BINDIR="$pkgdir/usr/bin/" \
    LIBDIR="$pkgdir/usr/lib/ocaml/" \
    DDLDIR="$pkgdir/usr/lib/ocaml/stublibs/" \
    INSTALLDIR="$pkgdir/usr/lib/ocaml/lablGL/"

  install -Dm644 src/lablgl.cmxa "$pkgdir"/usr/lib/ocaml/lablgl.cmxa
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Hack for wrongly placed stublibs library
  mv "$pkgdir/usr/lib/ocaml/stublibs" /tmp/temp.so
  mkdir -p "$pkgdir/usr/lib/ocaml/stublibs"
  mv /tmp/temp.so "$pkgdir/usr/lib/ocaml/stublibs/dlllablgl.so"
}
