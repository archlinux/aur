# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Sebastian Lau <lauseb644@gmail.com>

_pkgname=libx264
pkgname=lib32-$_pkgname
_pkgbase=x264
pkgver=148.20160103
_apiver=${pkgver%.*}
pkgrel=4
pkgdesc='Free library for encoding H264/AVC video streams (32 bit)'
arch=('x86_64')
url='http://www.videolan.org/developers/x264.html'
license=('GPL')
makedepends=('git' 'gcc-multilib' 'yasm' 'l-smash')
#depends=("${_pkgname}>=2:${_apiver}" "${_pkgname}<2:$((${_apiver} + 1))"
depends=("${_pkgname}" 'lib32-glibc')
provides=('libx264.so')
conflicts=('lib32-libx264-stable-git')
_commit=5c6570495f8f1c716b294aee1430d8766a4beb9c
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
  # -fstack-check (default in makepkg.conf) triggers a register allocation
  # problem in gcc so when PIC is also enabled we get this error:
  # 'asm' operand has impossible constraints
  # To compensate we don't enable PIC in configure
  # we also keep hardening-wrapper from enabling -fPIE
  #  --enable-pic \
  export CFLAGS="$CFLAGS -fno-PIC"
  ./configure --libdir=/usr/lib32 --host=i686-linux-gnu \
    --prefix=/usr \
    --enable-shared

  make
}

package() {
  cd ${srcdir}/${_pkgbase}
  make DESTDIR="$pkgdir/" install-lib-shared
  rm -rf $pkgdir/usr/include/
}

# vim:set ts=2 sw=2 et:
