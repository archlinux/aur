# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=alsa-lib-git
pkgver=1.2.4
pkgrel=1
pkgdesc="An alternative implementation of Linux sound support"
arch=('x86_64')
url="https://www.alsa-project.org"
license=('LGPL2.1')
depends=('glibc' 'alsa-topology-conf' 'alsa-ucm-conf')
provides=('alsa-lib' 'libasound.so' 'libatopology.so')
conflicts=(alsa-lib)
source=("git+https://github.com/alsa-project/alsa-lib.git")
sha512sums=('SKIP')
#validpgpkeys=('F04DF50737AC1A884C4B3D718380596DA6E59C91') # ALSA Release Team (Package Signing Key v1) <release@alsa-project.org>

prepare() {
  cd alsa-lib
  autoreconf -vfi
}

build() {
  cd alsa-lib
  ./configure --prefix=/usr \
              --without-debug \
	      --disable-debug \
	      --without-versioned \
	      --enable-symbolic-functions
  make
}

#check() {
#  cd alsa-lib
#  export LD_LIBRARY_PATH="${PWD}/src/.libs/:${LD_LIBRARY_PATH}"
#  make -k check
#}

package() {
  cd alsa-lib
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install -C doc
  install -vDm 644 {MEMORY-LEAK,TODO,NOTES,ChangeLog,doc/asoundrc.txt} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
