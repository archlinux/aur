# Maintainer: Cassandra Watergate <cassandrajwatergate@gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

_pkgbase=lzlib
pkgname=lib32-$_pkgbase
pkgver=1.13
pkgrel=4
pkgdesc="A library providing in-memory LZMA compression and decompression functions"
pkgdesc+=" (32-bit)"
arch=('x86_64' 'i686')
url="http://www.nongnu.org/lzip/lzlib.html"
license=('BSD')
depends=('lib32-gcc-libs')
options=('!emptydirs')
source=(https://download.savannah.gnu.org/releases/lzip/$_pkgbase/$_pkgbase-$pkgver.tar.gz{,.sig})
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742') # Antonio Diaz Diaz
sha256sums=('a1ab58f3148ba4b2674e938438166042137a9275bed747306641acfddc9ffb80'
            'SKIP')

build() {
  cd "${srcdir}"/$_pkgbase-$pkgver

  ./configure CFLAGS="${CFLAGS} -m32" \
              CXXFLAGS="${CXXFLAGS} -m32" \
              LDFLAGS="${LDFLAGS} -m32" \
              PKG_CONFIG_PATH='/usr/lib32/pkgconfig' \
              --prefix=/usr \
              --enable-shared \
              --program-suffix="-32" \
              --libdir=/usr/lib32 \
              --build=i686-pc-linux-gnu
  make
}

check() {
	cd "${srcdir}"/$_pkgbase-$pkgver
	make -k check
}

package() {
  cd "${srcdir}"/$_pkgbase-$pkgver

  make DESTDIR="${pkgdir}" install{,-man}

  # remove everything that is provided by lzlib
  rm -rf "$pkgdir"/usr/{include,share,bin}

  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/$pkgname/COPYING
}
