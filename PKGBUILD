# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ocp-indent
pkgver=1.5.1
pkgrel=1
pkgdesc="Indentation tool for OCaml, to be used from editors like Emacs and Vim"
arch=('i686' 'x86_64')
depends=('ocaml-cmdliner')
makedepends=('make' 'ocaml' 'ocp-build' 'opam')
url="https://github.com/OCamlPro/ocp-indent"
license=('custom:LGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/OCamlPro/ocp-indent/tar.gz/$pkgver)
sha256sums=('55a13482b02d87ef12adfc8d5223efa00868bfc429e7d3199877e2a703299250')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  ./configure \
    --prefix=$pkgdir/usr \
    --sbindir=$pkgdir/usr/bin \
    --libexecdir=$pkgdir/usr/lib/ocp-indent \
    --sysconfdir=$pkgdir/etc \
    --sharedstatedir=$pkgdir/usr/share/ocp-indent \
    --localstatedir=$pkgdir/var/lib/ocp-indent
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/ocp-indent/LICENSE"

  msg2 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/ocp-indent/README.md"
  install -Dm 644 CHANGELOG "$pkgdir/usr/share/doc/ocp-indent/CHANGELOG"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
  opam-installer \
    --prefix=$pkgdir/usr \
    --docdir=$pkgdir/usr/share/doc \
    --mandir=$pkgdir/usr/share/man \
    ocp-indent

  msg2 'Fixing install dir locations...'
  mkdir -p "$pkgdir/usr/lib/ocaml"
  mv "$pkgdir/usr/lib/ocp-indent" "$pkgdir/usr/lib/ocaml"
}
