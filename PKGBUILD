# Maintainer: Jonas Hvid <mail@johv.dk>
# Contributor: TwoFinger
# Contributor: taij33n <bwbuiz@gmail.com>
pkgname=picolisp
pkgver=25.2.21
pkgrel=1
pkgdesc="Fast and tiny 64-bit Lisp interpreter: OO, dynamic and functional (database, prolog, coroutines)."
url="https://picolisp.com"
arch=(x86_64)
license=(MIT)
depends=(glibc bash openssl libffi readline ncurses)
makedepends=(git clang llvm make)
source=("pil21::git+https://github.com/picolisp/pil21.git#commit=2a7a8e40b843c8ad86cdf79b5b19c2ea05648bc2")
sha256sums=('a7f42017ef4527dd498a9ef0d6f2ecf5ee36e3aa68e59c6f79b231d810c2b74a')

prepare() {
  MAKEFILE="$srcdir/pil21/src/Makefile"
  LDFLAGS=-Wl,-z,relro,-z,now,-z,shstk
  sed -i "s/SHARED =\|MAIN =/& $LDFLAGS/" "$MAKEFILE"
  sed -i "/CC.\+balance\|CC.\+ssl\|CC.\+httpGate/ s/$/ $LDFLAGS/" "$MAKEFILE"
}

build() {
  cd "$srcdir/pil21/src"

  sed -i 's/^.SILENT:$//g' Makefile

  # Always build serially to work around broken dependency structure:
  sed -i "2 s/.*/&\n.NOTPARALLEL:/" Makefile

  # Working around awkward cyclic dependencies:
  touch *.ll
  make ../bin/picolisp

  make -B
}

package() {
  install -d -m755 "${LIBDIR:=$pkgdir/usr/lib/$pkgname}"
  cp -a "$srcdir"/pil21/* "$LIBDIR"

  install -d -m755 "${BINDIR:=$pkgdir/usr/bin}"
  mv "$LIBDIR/bin/picolisp" "$BINDIR"
  mv "$LIBDIR/bin/pil" "$BINDIR"
  mv "$LIBDIR/bin/vip" "$BINDIR"

  install -d -m755 "${MAN1DIR:=$pkgdir/usr/share/man/man1}"
  cp "$LIBDIR"/man/man1/*.1 "$MAN1DIR"
  rm -r "$LIBDIR/man"

  ln -s "../lib/picolisp" -T "$pkgdir/usr/share/$pkgname"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  mv "$LIBDIR/COPYING" "$pkgdir/usr/share/licenses/$pkgname"

  install -d -m755 "${COMPDIR:=$pkgdir/usr/share/bash-completion/completions/}"
  mv "$LIBDIR/lib/bash_completion" "$COMPDIR/$pkgname"
}
