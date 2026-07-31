# Maintainer: Jonas Hvid <mail@johv.dk>
# Contributor: TwoFinger
# Contributor: taij33n <bwbuiz@gmail.com>
pkgname=picolisp
pkgver=26.6
pkgrel=2
pkgdesc="Fast and tiny 64-bit Lisp interpreter: OO, dynamic and functional (database, prolog, coroutines)."
url="https://picolisp.com"
arch=(x86_64)
license=(MIT)
depends=(glibc bash openssl libffi readline ncurses)
makedepends=(git clang llvm make)
source=("https://software-lab.de/picoLisp-$pkgver.tgz")
sha256sums=('2642d28908fa7a69d8bf49519396df85f922781d1c41d8eaceca77bb457ab712')

prepare() {
  MAKEFILE="$srcdir/pil21/src/Makefile"
  LDFLAGS=-Wl,-z,relro,-z,now,-z,shstk
  sed -i "s/SHARED =\|MAIN =/& $LDFLAGS/" "$MAKEFILE"
  sed -i "/CC.\+balance\|CC.\+ssl\|CC.\+httpGate/ s/$/ $LDFLAGS/" "$MAKEFILE"
}

build() {
  cd "$srcdir/pil21/src"
  sed -i 's/^.SILENT:$//g' Makefile

  # Always build serially to work around underspecified dependency structure:
  sed -i "2 s/.*/&\n.NOTPARALLEL:/" Makefile

  make
  make so
}

package() {
  install -d -m755 "${LIBDIR:=$pkgdir/usr/lib/$pkgname}"
  cp -a "$srcdir"/pil21/* "$LIBDIR"

  install -d -m755 "${BINDIR:=$pkgdir/usr/bin}"
  mv "$LIBDIR/bin/picolisp" "$BINDIR"
  mv "$LIBDIR/bin/pil" "$BINDIR"
  mv "$LIBDIR/bin/vip" "$BINDIR"

  install "$srcdir/pil21/lib/picolisp.so" -D "$pkgdir/usr/lib/libpicolisp.so"

  install -d -m755 "${MAN1DIR:=$pkgdir/usr/share/man/man1}"
  cp "$LIBDIR"/man/man1/*.1 "$MAN1DIR"
  rm -r "$LIBDIR/man"

  ln -s "../lib/picolisp" -T "$pkgdir/usr/share/$pkgname"

  mkdir -p "$pkgdir/usr/share/doc"
  ln -s "../picolisp/doc" -T "$pkgdir/usr/share/doc/picolisp"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  mv "$LIBDIR/COPYING" "$pkgdir/usr/share/licenses/$pkgname"

  install -d -m755 "${COMPDIR:=$pkgdir/usr/share/bash-completion/completions/}"
  mv "$LIBDIR/lib/bash_completion" "$COMPDIR/$pkgname"
}
