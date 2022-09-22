# Contributor: Sébastien "Seblu" Luttringer
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=lib32-pcre
_pkgname=pcre
pkgver=8.45
pkgrel=3
pkgdesc='A library that implements Perl 5-style regular expressions (32-bit)'
arch=('x86_64')
url='https://www.pcre.org/'
license=('BSD')
depends=('lib32-gcc-libs' "$_pkgname")
provides=(libpcre{,16,32,posix,cpp}.so)
options=(debug)
source=("https://sourceforge.net/projects/pcre/files/$_pkgname/$pkgver/$_pkgname-$pkgver.tar.bz2"{,.sig})
sha512sums=('91bff52eed4a2dfc3f3bfdc9c672b88e7e2ffcf3c4b121540af8a4ae8c1ce05178430aa6b8000658b9bb7b4252239357250890e20ceb84b79cdfcde05154061a'
            'SKIP')
validpgpkeys=('45F68D54BBE23FB3039B46E59766E084FB0F43D8')  # Philip Hazel <ph10@hermes.cam.ac.uk>

build() {
  cd $_pkgname-$pkgver

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --enable-unicode-properties \
    --enable-pcre16 \
    --enable-pcre32 \
    --enable-jit \
    --disable-pcregrep-libz \
    --disable-pcregrep-libbz2 \
    --disable-pcretest-libreadline
  make
}

check() {
  cd $_pkgname-$pkgver
  make -j1 check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/{bin,share,include}

  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set sw=2 sts=-1 et:
