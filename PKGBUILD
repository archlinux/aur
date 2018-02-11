pkgname=aopsf-git
pkgver=r26.08672d5
pkgrel=1
pkgdesc="Audio Overload's PSF core, now in a proper library"
arch=(x86_64)
url='https://gitlab.kode54.net/kode54/aopsf'
license=(BSD)
makedepends=(git)
source=(${pkgname}::git+https://gitlab.kode54.net/kode54/aopsf.git makefile.patch decl.patch LICENSE.BSD)
sha256sums=('SKIP'
            '4855f2d7969a595e1dae79a3cb600ae0cd73e5a7f2b1c838f3014c6211abf1c0'
            'b807bf78052965584faff4d3767c2ed9974c74c61fa469727b309bf263b6777f'
            '3fb3258f12e481be1326b6931269b55866bb3ed5c0e769ecad83f9e71c3cdfca')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$pkgname"
  test -e Makefile || patch -p0 < "$srcdir"/makefile.patch
  patch -p0 < "$srcdir"/decl.patch
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m644 -t "$pkgdir/usr/lib" libaopsf.so
  install -D -m644 -t "$pkgdir/usr/include/aopsf" psx_external.h ao.h
  install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir"/LICENSE.BSD
}

# vim:set sw=2 et:
