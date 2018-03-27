# $Id$
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

_target=aarch64-linux-gnu
_pkgname=pcre
pkgname=${_target}-pcre
pkgver=8.41
pkgrel=1
pkgdesc='A library that implements Perl 5-style regular expressions'
arch=('any')
url='http://www.pcre.org/'
license=('BSD')
depends=(
#'gcc-libs' 'readline' 
'zlib-aarch64'
#'bzip2'
'bash')
validpgpkeys=('45F68D54BBE23FB3039B46E59766E084FB0F43D8') # Philip Hazel
source=("https://ftp.pcre.org/pub/pcre/$_pkgname-$pkgver.tar.bz2"{,.sig})
md5sums=('c160d22723b1670447341b08c58981c1'
         'SKIP')

prepare() {
  cd $_pkgname-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      msg2 "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
  # avoid compiler default flags
  sed -i "s,/usr/\(include\|lib\),/usr/${_target:?}/\1," pcre-config.in
  :
}

build() {
  unset CFLAGS CXXLAGS
  cd $_pkgname-$pkgver
if true; then
  ./configure \
    --host=${_target} \
    --prefix=/usr/${_target} \
    --enable-unicode-properties \
    --enable-pcre16 \
    --enable-pcre32 \
    --enable-jit \
    --enable-pcregrep-libz \
    --disable-cpp \
#    --enable-pcregrep-libbz2 \
#    --enable-pcretest-libreadline
fi
  make
}

check() {
  local s readelfarch
  readelfarch='AArch64'
  cd $_pkgname-$pkgver

  s=$(find . -type f "(" -name "*.so*" -o -name "*.a" ")" -print0 | \
    2>/dev/null LC_ALL=C xargs -0 readelf -h | \
    sed -n -e '/File:/h;/Machine:/{/'"$readelfarch"'/!{H;x;p}}' | head -10)

  if [ -n "$s" ]; then
    >&2 echo "some binaries have wrong architecture:"
    >&2 echo "$s"
    return 1
  fi
}

strip() {
  ${_target}-strip "$@"
}

objcopy() {
  ${_target}-objcopy "$@"
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENCE "$pkgdir/usr/${_target}/share/licenses/$_pkgname/LICENSE"

  mkdir -p "$pkgdir/usr/bin"

  # delete everything but the script
  mv "$pkgdir/usr/${_target}/bin/pcre-config" "$pkgdir/usr/bin/${_target}-pcre-config"
  rm -f "$pkgdir/usr/${_target}/bin"/*

  # restore the script
  install -Dm755 "$pkgdir/usr/bin/${_target}-pcre-config" "$pkgdir/usr/${_target}/bin/pcre-config"
}

# vim:set ts=2 sw=2 et:
