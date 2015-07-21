# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Sebastian Lau <lauseb644@gmail.com>

_pkgname=libx264
pkgname=lib32-$_pkgname
_pkgbase=x264
pkgver=148.20150717
_apiver=${pkgver%.*}
pkgrel=3
pkgdesc='Free library for encoding H264/AVC video streams (32 bit)'
arch=('x86_64')
url='http://www.videolan.org/developers/x264.html'
license=('GPL')
makedepends=('git' 'gcc-multilib' 'yasm' 'l-smash')
#depends=("${_pkgname}>=2:${_apiver}" "${_pkgname}<2:$((${_apiver} + 1))"
depends=("${_pkgname}" 'lib32-glibc')
provides=('libx264.so')
conflicts=('lib32-libx264-stable-git')
source=(x264::git://git.videolan.org/x264/x264-sandbox.git#commit=e6d2a36bb)
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgbase}
  local _ver=$(grep '#define X264_BUILD' x264.h | cut -d' ' -f3)
  local _date=$(git log -1 --format="%cd" --date=short | tr -d -)

  echo ${_ver}.${_date}
}

build() {
    cd ${srcdir}/${_pkgbase}
    ./configure --prefix=/usr --libdir=/usr/lib32 --host=i686-linux-gnu \
	--enable-shared \
	--enable-pic

    make
}

package() {
    cd ${srcdir}/${_pkgbase}
    make DESTDIR="$pkgdir/" install-lib-shared
    rm -rf $pkgdir/usr/include/
}
