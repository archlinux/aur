# Maintainer: 0b100100 <0b100100 at protonmail dot ch>

pkgname=msieve-svn
pkgver=1.54.r1043
pkgrel=3
pkgdesc='Library for factoring large integers'
url='https://sourceforge.net/projects/msieve'
license=('custom')
arch=('x86_64')
depends=('zlib' 'gmp-ecm')
makedepends=('subversion')
provides=('msieve')
conflicts=('msieve')
source=("${pkgname%-svn}::svn+svn://svn.code.sf.net/p/msieve/code/trunk")
sha512sums=('SKIP')

# Find line(s) beginning with "#define $1 " in file $2 and output the remainder
_get_def() {
  local s="[[:space:]]"
  sed -n -E "s/^$s*#$s*define$s+$1$s+//p" "$2"
}

pkgver() {
  cd "${pkgname%-svn}"
  local major_ver="$(_get_def MSIEVE_MAJOR_VERSION include/msieve.h)"
  local minor_ver="$(_get_def MSIEVE_MINOR_VERSION include/msieve.h)"
  # Note: if you modify the checkout, svnversion will append "M"
  local rev="$(svnversion)"
  printf "%s.%s.r%s" "${major_ver}" "${minor_ver}" "${rev//[[:alpha:]]}"
}

build() {
  cd "${pkgname%-svn}"
  CFLAGS+=' -fopenmp'
  # Note: Makefile defines auto-configured OPT_FLAGS
  # and leaves MACHINE_FLAGS for us to tweak CFLAGS.
  # (a) If you do not want to override OPT_FLAGS's -O3 or -march=native:
  # make all ECM=1 MACHINE_FLAGS="\$(filter-out -O% -m%,$CFLAGS)"
  # (b) Better keep our -m overrides, but use OPT_FLAGS's -O3 setting:
  # make all ECM=1 MACHINE_FLAGS="\$(filter-out -O%,$CFLAGS)"
  # (c) Use all CFLAGS from makepkg.conf, including -O* and -m* flags:
  make all ECM=1 MACHINE_FLAGS="$CFLAGS"
}

package() {
  cd "${pkgname%-svn}"
  install -Dm755 msieve -t "$pkgdir/usr/bin/"
  install -Dm644 Readme* Changes -t "$pkgdir/usr/share/doc/$pkgname/"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/doc/$pkgname/Readme "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  ln -sr "$pkgdir/usr/share/doc/$pkgname" "$pkgdir/usr/share/doc/${pkgname%-svn}"
  ln -sr "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/licenses/${pkgname%-svn}"
}

# vim:set ts=2 sw=2 et:
