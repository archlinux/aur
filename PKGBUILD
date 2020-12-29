# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_pkgbasename=libsndfile
pkgname=lib32-$_pkgbasename-git
pkgver=1.0.28
pkgrel=1
pkgdesc="A C library for reading and writing files containing sampled sound (32-bit)"
arch=('x86_64')
url="http://www.mega-nerd.com/libsndfile"
license=('LGPL')
depends=('lib32-alsa-lib' $_pkgbasename)
optdepends=('lib32-libvorbis: vorbis support'
	    'lib32-flac: flac support')
makedepends=('gcc-multilib' 'libtool-multilib')
provides=('libsndfile.so' 'lib32-libsndfile')
conflicts=(lib32-libsndfile)
source=(git+https://github.com/libsndfile/libsndfile)
sha1sums=('SKIP')
#validpgpkeys=('73571E85C19F4281D8C97AA86CA41A7743B8D6C8'
#              '6A91A5CF22C24C99A35E013FCFDCF91FB242ACED')

pkgver() {
  cd libsndfile
  git describe --tags | sed 's/-/+/g'
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_pkgbasename}

  export GETCONF="getconf -v POSIX_V7_ILP32_OFFBIG"
  export GETCONF_DIR="/usr/lib32/getconf"

  ./autogen.sh
  ./configure --prefix=/usr --disable-sqlite --libdir=/usr/lib32 --disable-bow-docs --disable-full-suite
  make
}

#check() {
#  cd ${_pkgbasename}
#  make check
#}

package() {
  cd ${_pkgbasename}
  make DESTDIR="${pkgdir}" install
  make DESTDIR="$pkgdir" install-pkgconfigDATA

  rm -rf "$pkgdir/usr/include"
}
