# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: acieroid
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: George Giorgidze <giorgidze@gmail.com>
# Contributor: William J. Bowman <bluephoenix47@gmail.com>
pkgname=coq
pkgver=8.6
pkgrel=1
pkgdesc='Formal proof management system'
arch=('i686' 'x86_64')
url='https://coq.inria.fr/'
license=('GPL')
options=('!emptydirs')
depends=('ocaml' 'camlp4')
makedepends=('ocaml-findlib')
optdepends=('coqide: graphical Coq IDE'
            'coq-doc: offline documentation')
source=("https://coq.inria.fr/distrib/V$pkgver/files/coq-$pkgver.tar.gz"
        "0001-Fix-incorrect-documentation-that-prevents-successful.patch"
        "0002-Avoid-concurrent-runs-when-producing-html-documentat.patch")
sha1sums=('617a6f86d09dde0e409f3fa22268daf7be3f5bba'
          'ec5e9af33f37d2eb154f8de13815cb7f1f2fba6e'
          '201f1db7fd3e7e072ff7c94cfcdabdcc5910ccdd')

prepare() {
  cd "$srcdir/coq-$pkgver"
  patch -p1 < ../0001-Fix-incorrect-documentation-that-prevents-successful.patch
  patch -p1 < ../0002-Avoid-concurrent-runs-when-producing-html-documentat.patch
}

build() {
  cd "$srcdir/coq-$pkgver"

  ./configure \
    -prefix '/usr' \
    -mandir '/usr/share/man' \
    -configdir '/etc/xdg/coq/' \
    -coqide no \
    -with-doc no \
    -usecamlp4

  make world
}

package() {
  cd "$srcdir/coq-$pkgver"

  make COQINSTALLPREFIX="$pkgdir" install-coq
  rm -f "${pkgdir}/usr/share/man/man1/coqide.1"
}
