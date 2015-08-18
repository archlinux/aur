# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Sebastian Lau <lauseb644@gmail.com>

_pkgname=libx264
pkgname=lib32-$_pkgname
_pkgbase=x264
pkgver=148.20150725
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
_commit=73ae2d11d472d0eb3b7c218dc1659db32f649b14
source=(git://git.videolan.org/x264.git#commit=${_commit})
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgbase}
  local _ver=$(grep '#define X264_BUILD' x264.h | cut -d' ' -f3)
  local _date=$(git log -1 --format="%cd" --date=short | tr -d -)

  echo ${_ver}.${_date}
}

build() {
  cd ${srcdir}/${_pkgbase}
  if [ -n "`pacman -Q hardening-wrapper 2> /dev/null`" ]; then
    # hardening-wrapper adds -fstack-check (by default)
    # this effectively reduces the number of available registers
    # leading to: 'asm' operand has impossible constraints
    # to compensate we disable PIC and also don't let the wrapper add -fPIE
    export CFLAGS="$CFLAGS -fno-PIC"
    ./configure --prefix=/usr --libdir=/usr/lib32 --host=i686-linux-gnu \
      --enable-shared
  else
    # without hardening PIC can safely be enabled
    export CFLAGS="$CFLAGS -fno-PIC"
    ./configure --prefix=/usr --libdir=/usr/lib32 --host=i686-linux-gnu \
      --enable-pic \
      --enable-shared
  fi

  make
}

package() {
  cd ${srcdir}/${_pkgbase}
  make DESTDIR="$pkgdir/" install-lib-shared
  rm -rf $pkgdir/usr/include/
}

# vim:set ts=2 sw=2 et:
