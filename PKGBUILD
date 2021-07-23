# Maintainer: Ionut Biru <ibiru@archlinux.org>

_pkgbasename=pcre
pkgname=lib32-$_pkgbasename
pkgver=8.45
pkgrel=1
pkgdesc="A library that implements Perl 5-style regular expressions (32-bit)"
arch=('x86_64')
url="https://www.pcre.org"
license=('custom')
depends=('lib32-gcc-libs' $_pkgbasename)
source=("https://ftp.pcre.org/pub/pcre/$_pkgbasename-$pkgver.tar.bz2"{,.sig})
sha512sums=('91bff52eed4a2dfc3f3bfdc9c672b88e7e2ffcf3c4b121540af8a4ae8c1ce05178430aa6b8000658b9bb7b4252239357250890e20ceb84b79cdfcde05154061a'
            'SKIP')
validpgpkeys=('45F68D54BBE23FB3039B46E59766E084FB0F43D8') # Philip Hazel

prepare() {
  cd "${srcdir}"/${_pkgbasename}-${pkgver}
  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      msg2 "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
  :
}

build() {
  cd "${srcdir}"/${_pkgbasename}-${pkgver}
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --enable-unicode-properties \
    --enable-pcre16 \
    --enable-pcre32 \
    --enable-jit
  make
}

check() {
  cd "${srcdir}"/${_pkgbasename}-${pkgver}

  make -j1 check
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
