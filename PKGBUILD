# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor David Runge <dvzrv@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=alsa-lib-a52pcm
pkgver=1.2.3
pkgrel=1
pkgdesc="An alternative implementation of Linux sound support (with workaround for a52 digital surround PCM)"
arch=('x86_64')
url="https://git.harting.dev/IdleGandalf/alsa-lib/commit/646bc80a63b0220300678a38e0c26a9a13af6fc0"
license=('LGPL2.1')
depends=('glibc' 'alsa-topology-conf' 'alsa-ucm-conf' 'libavresample')
provides=('libasound.so' 'libatopology.so' 'alsa-lib')
conflicts=('alsa-lib')
source=("https://www.alsa-project.org/files/pub/lib/${pkgname%-a52pcm}-$pkgver.tar.bz2"
        "pcm-config-parsing-workaround.patch")
sha512sums=('d21adb3ff998918c7d1820f9ce2aaf4202dd45ccb87cb092d49da8b2402b6ddaad06325be0fd59f17393a5d9958e3743bfccb4b14bdb947a42e7d791d73c7033'
            '2de27b4059c3acae13550e9cd2499f51edff48b73a57876d3521619693f343bee817e3d8e29be209c4286131a51164c80ab9823cb2a3fdf1412a2809c94ad7ce')

prepare() {
  cd "${pkgname%-a52pcm}-$pkgver"
  patch -Np1 < ../pcm-config-parsing-workaround.patch
  autoreconf -vfi
}

build() {
  cd "${pkgname%-a52pcm}-$pkgver"
  ./configure --prefix=/usr \
              --without-debug
  make
}

check() {
  cd "${pkgname%-a52pcm}-$pkgver"
  export LD_LIBRARY_PATH="${PWD}/src/.libs/:${LD_LIBRARY_PATH}"
  make -k check
}

package() {
  cd "${pkgname%-a52pcm}-$pkgver"
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install -C doc
  install -vDm 644 {MEMORY-LEAK,TODO,NOTES,ChangeLog,doc/asoundrc.txt} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
