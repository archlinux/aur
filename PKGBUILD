# Maintainer: Jonas Hvid <mail@johv.dk>
# Contributor: TwoFinger
# Contributor: taij33n <bwbuiz@gmail.com>
pkgname=picolisp
pkgver=24.9.7
pkgrel=1
pkgdesc="Fast and tiny 64-bit Lisp interpreter: OO, dynamic and functional (database, prolog, coroutines)."
url="https://picolisp.com"
arch=(x86_64)
license=(MIT)
depends=(openssl libffi readline ncurses)
makedepends=(git clang llvm)
source=("pil21::git+https://github.com/picolisp/pil21.git#commit=88c5c68b684e3a65f832bed4c2e4d88f45999098")
sha256sums=("bc8213403bcf4b6b8d2520068d11ef5ad65c8578d5d78722e62cf03d80faf06d")

build() {
  cd "$srcdir/pil21/src" && make -W base.ll
}

package() {
  install -d -m755 "${LIBDIR:=$pkgdir/usr/lib/$pkgname}"
  cp -a "$srcdir"/pil21/* "$LIBDIR"

  install -d -m755 "${BINDIR:=$pkgdir/usr/bin}"
  mv "$LIBDIR/bin/picolisp" "$BINDIR"
  mv "$LIBDIR/bin/pil" "$BINDIR"
  mv "$LIBDIR/bin/vip" "$BINDIR"

  install -d -m755 "${MAN1DIR:=$pkgdir/usr/share/man/man1}"
  mv "$LIBDIR"/man/man1/*.1 "$MAN1DIR"

  ln -s "../lib/picolisp" -T "$pkgdir/usr/share/$pkgname"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  mv "$LIBDIR/COPYING" "$pkgdir/usr/share/licenses/$pkgname"

  install -d -m755 "${COMPDIR:=$pkgdir/usr/share/bash-completion/completions/}"
  mv "$LIBDIR/lib/bash_completion" "$COMPDIR/$pkgname"
}
