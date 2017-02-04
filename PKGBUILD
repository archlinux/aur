# Maintainer: Det <nimetonmaili at-gmail a-dot com>
# Contributor: PelPix <kylebloss[at]pelpix[dot]info>
# Contributor: DrZaius <lou[at]fakeoutdoorsman.com>
# Contributor: zhuqin <zhuqin83[at]gmail>
# Contributor: pressh <pressh[at]gmail>
# Based on extra/x264's trunk: https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/x264

# Build 10-bit x264 instead of 8-bit? (Better quality, but slower.)
# For comparison, see, e.g.: https://gist.github.com/l4n9th4n9/4459997

_10bit=0   # "1" to enable. (This will be auto-detected afterwards.)

# To revert, uninstall 'libx264-10bit-git', or use:

_8bit=0

pkgname=('x264-git' 'libx264-git' 'libx264-10bit-git')
_pkgname=x264
pkgver=148.20151011.r2638
pkgrel=1
arch=('i686' 'x86_64')
url='http://www.videolan.org/developers/x264.html'
license=('GPL')
depends=('glibc')
makedepends=('yasm' 'git' 'ffmpeg' 'l-smash')
source=("git://git.videolan.org/x264.git")
sha256sums=('SKIP')

# Use the 10-bit version?
if [[ ${_10bit} = 1 ]] || ([[ ${_8bit} != 1 ]] && pacman -Q libx264-10bit-git &>/dev/null); then
  pkgname=('x264-git' 'libx264-10bit-git')
  _10bit=1
elif [[ ${_8bit} = 1 ]] || pacman -Q libx264-git &>/dev/null; then
  pkgname=('x264-git' 'libx264-git')
fi

pkgver() {
  cd ${_pkgname}
  _ver=$(grep '#define X264_BUILD' x264.h | cut -d' ' -f3)
  _date=$(git log -1 --format="%cd" --date=short | tr -d -)
  _commits=$(git rev-list --count HEAD)

  echo ${_ver}.${_date}.r${_commits}
}

prepare() {
  rm -rf ${_pkgname}-10bit

  cp -r ${_pkgname} ${_pkgname}-10bit
}

build() {
  cd ${_pkgname}

  msg2 "Configuring x264..."
  ./configure \
    --prefix='/usr' \
    --enable-shared \
    --enable-pic

  msg2 "Making x264..."
  make

  cd ../${_pkgname}-10bit

  msg2 "Configuring x264 (10-bit)..."
  ./configure \
    --prefix='/usr' \
    --enable-shared \
    --enable-pic \
    --bit-depth='10'

  msg2 "Making x264 (10-bit)..."
  make
}

package_x264-git() {
  pkgdesc='CLI tools for encoding H264/AVC video streams (Git)'
  depends=('libavcodec.so' 'libavformat.so' 'libavutil.so' 'liblsmash.so'
           'libswscale.so')
  provides=('x264-10bit' 'x264')
  conflicts=('x264-10bit' 'x264')
  replaces=('x264-10bit')

  make -C ${_pkgname} DESTDIR="${pkgdir}" install-cli
  install -m 755 ${pkgbase}-10bit/x264 "${pkgdir}"/usr/bin/x264-10bit
}

package_libx264-git() {
  pkgdesc='Library for encoding H264/AVC video streams (Git)'
  provides=('libx264.so' 'x264-dev' 'libx264')
  conflicts=('x264-dev' 'libx264')
  replaces=('x264-dev')

  install -dm 755 "${pkgdir}"/usr/lib
  make -C ${_pkgname} DESTDIR="${pkgdir}" install-lib-shared
}

package_libx264-10bit-git() {
  pkgdesc='Library for encoding H264/AVC video streams - 10bit-depth (Git)'
  provides=('libx264.so' 'libx264' 'x264-dev' 'libx264-10bit')
  conflicts=('libx264' 'x264-dev' 'libx264-10bit')

  install -dm 755 "${pkgdir}"/usr/lib
  make -C ${_pkgname}-10bit DESTDIR="${pkgdir}" install-lib-shared
}

# vim: ts=2 sw=2 et: