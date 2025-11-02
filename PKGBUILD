# Maintainer: Senge Rinchen <sengerinchen@outlook.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Contributor: Suat SARIALP <muhendis.suat@gmail.com>

pkgname=dev86
pkgver=0.16.21
pkgrel=9
pkgdesc="Simple C compiler to generate 8086 code"
arch=('x86_64')
url='https://v3.sk/~lkundrak/dev86/'
license=(GPL)
makedepends=('bin86')
options=('!strip' '!makeflags' 'staticlibs')
source=(#"https://v3.sk/~lkundrak/dev86/Dev86src-${pkgver}.tar.gz"
        "https://sources.archlinux.org/other/packages/dev86/Dev86src-${pkgver}.tar.gz"
	'0001-mandir.patch'
  'dev86-noelks.patch'
  'dev86-long.patch')
sha256sums=('234b110e6df9b7f6843e2ee53473127c2211243a16748f229fc0127845f68d94'
            'f1cc9e3779c435a39c0a3b773b6fc220c6bd7909ec4bb1b8ee781cf4f89d4827'
            '3846e55cec22149e99e25540f84ac2e2ff640881fe6f21b6558766522181354d'
            '2ace7ce7165f2e0f9588ce4928f7ecbdbe7c2c03fc28103275f9b2634f5803e8')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver

  patch -p1 <"$srcdir"/0001-mandir.patch

  # Patches from Fedora
  patch -p1 <"$srcdir"/dev86-noelks.patch
  patch -p1 <"$srcdir"/dev86-long.patch
}

build() {
  cd "$srcdir"/$pkgname-$pkgver

  export COMPILE_FLAGS="-O2 -ffat-lto-objects -Wno-implicit-function-declaration -Wno-implicit-int -Wno-return-mismatch -std=gnu99"
  make bcc86 unproto copt as86 ld86 DIST="$pkgdir" PREFIX="/usr" CFLAGS="$COMPILE_FLAGS"
  make -C cpp DIST="$pkgdir" PREFIX="/usr" CFLAGS="$COMPILE_FLAGS"
  make -C ar DIST="$pkgdir" PREFIX="/usr" CFLAGS="$COMPILE_FLAGS"
  make -C ld DIST="$pkgdir" PREFIX="/usr" CFLAGS="$COMPILE_FLAGS"

  # bcc doesn't support optimization flags
  make PREFIX=/usr DIST="$pkgdir"
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  mkdir -p "$pkgdir"/usr/share/man/man1
  make install install-man DIST="$pkgdir"

  # remove all the stuff supplied by bin86
  rm "$pkgdir"/usr/bin/{as,ld,nm,objdump,size}86
  rm "$pkgdir"/usr/share/man/man1/{as,ld}86.1
}
