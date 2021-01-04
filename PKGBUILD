# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_pkgbasename=flac
pkgname=lib32-$_pkgbasename-git
pkgver=1.3.3
pkgrel=1
pkgdesc='Free Lossless Audio Codec (32-bit)'
url='https://xiph.org/flac/'
arch=('x86_64')
license=('BSD' 'GPL')
depends=('lib32-gcc-libs' 'lib32-libogg' $_pkgbasename)
makedepends=('nasm')
source=("git://github.com/xiph/flac.git")
sha256sums=('SKIP')

pkgver() {
  cd flac
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd ${_pkgbasename}

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib32 --disable-thorough-tests --disable-doxygen-docs --enable-asm-optimizations --enable-sse --enable-altivec --enable-vsx --enable-avx --disable-valgrind-testing --disable-xmms-plugin
  make
}

#check() {
#  cd ${_pkgbasename}
#  make check
#}

package() {
  provides=('lib32-flac' 'libFLAC.so' 'libFLAC++.so')
  conflicts=('lib32-flac')

  cd ${_pkgbasename}
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
