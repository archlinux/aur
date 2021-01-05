# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_name=alsa-lib
pkgname=lib32-alsa-lib-minimal-git
pkgver=1.2.4
pkgrel=1
pkgdesc="An alternative implementation of Linux sound support (32 bit)"
arch=('x86_64')
url="https://www.alsa-project.org"
license=('LGPL2.1')
depends=('lib32-glibc' 'alsa-lib')
provides=('lib32-alsa-lib' 'libasound.so' 'libatopology.so')
conflicts=('lib32-alsa-lib')
source=("git+https://github.com/alsa-project/alsa-lib.git")
sha512sums=('SKIP')
#validpgpkeys=('F04DF50737AC1A884C4B3D718380596DA6E59C91') # ALSA Release Team (Package Signing Key v1) <release@alsa-project.org>

pkgver() {
  cd alsa-lib
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd ${_name}
  autoreconf -vfi
}

build() {
  cd ${_name}

  export CC='gcc -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  ./configure --prefix=/usr \
              --libdir=/usr/lib32 \
              --without-debug \
              --disable-python \
	      --disable-debug \
	      --enable-symbolic-functions \
              --disable-rawmidi \
              --disable-seq
  make
}

#check() {
#  cd ${_name}
#  export LD_LIBRARY_PATH="${PWD}/src/.libs/:${LD_LIBRARY_PATH}"
#  make -k check
#}

package() {
  cd ${_name}
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/{bin,include,share}
}
