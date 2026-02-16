# Maintainer: David Mazieres (http://www.scs.stanford.edu/~dm/addr/)
pkgname=nvi-git
pkgver=1.81.6.r80.62f62832
pkgrel=1
pkgdesc="4BSD reimplementation of ex/vi (git snapshot)"
arch=('x86_64' 'aarch64')
url='https://repo.or.cz/nvi.git'
license=('custom')
depends=('ncurses')
makedepends=('git' 'autoconf' 'automake' 'libtool' 'perl' 'pkgconf')
provides=('nvi' 'ex-vi-compat')
conflicts=('nvi' 'ex-vi-compat')
source=('nvi::git+https://repo.or.cz/nvi.git' 'nvi-db-ansi.patch')
sha256sums=('SKIP'
            '68d50bf687e2180f567cabe83b8d254dd5bb30f2728bf45ec662af63aab48271')

pkgver() {
  cd "$srcdir/nvi"
  local ver=$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')
  echo "${ver#nvi.}"
}

prepare() {
  cd "$srcdir/nvi"

  local msg='/* Do not edit: automatically built by PKGBUILD. */'
  emit_awk() { printf '%s\n' "$msg"; awk -f "$1" "$2"; }
  emit_awk_pair() { printf '%s\n' "$msg"; awk -f "$1" "$2"; awk -f "$3" "$4"; }
  emit_perl_n() { printf '%s\n' "$msg"; perl -n "$1" "$2"; }
  emit_public() {
      printf '%s\n' "$msg"; sed -n 's/^ \* PUBLIC: \(.*\)/\1/p' "$@";
  }

  printf '#define VI_VERSION "%s (%s)"\n' "$(git describe --always --dirty)" \
	 "$(date +%Y-%m-%d)" > ex/version.h

  emit_awk_pair ipc/ipc.awk ipc/ipc_cmd.c ipc/vipc.awk ip/ip_read.c \
		> ipc/ipc_def.h
  emit_perl_n ip/vipc.pl ip/ip_read.c > ipc/ipc_gen.c
  emit_awk ex/ex.awk ex/ex_cmd.c > ex/ex_def.h
  emit_awk common/options.awk common/options.c > common/options_def.h

  local d
  for d in cl common ex gtk ip ipc motif motif_l tcl_api vi; do
    emit_public "$d"/*.c > "$d/extern.h"
  done

  emit_public perl_api/*.c perl_api/*.xs > perl_api/extern.h

  patch -Np1 -i "$srcdir/nvi-db-ansi.patch"

  make -C docs/vi.man/

  ( cd dist && autoreconf -fi )

  rm -rf "$srcdir/build"
  mkdir -p "$srcdir/build"
  (cd "$srcdir/build" && "$srcdir/nvi/dist/configure" \
    --prefix=/usr \
    --disable-shared \
    --enable-static \
    --with-db-type=bundled)
}

build() {
  make -C "$srcdir/build"
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install

  test -n "$pkgdir" && rm -rf "$pkgdir"/usr/lib/ "$pkgdir"/usr/share/man/cat1

  install -Dm644 "$srcdir/nvi/LICENSE" \
	  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
