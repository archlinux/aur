# Maintainer: Det <nimetonmaili at-gmail a-dot com>
# Contributor: PelPix <kylebloss[at]pelpix[dot]info>
# Contributor: DrZaius <lou[at]fakeoutdoorsman.com>
# Contributor: zhuqin <zhuqin83[at]gmail>
# Contributor: pressh <pressh[at]gmail>
# Based on extra/x264's trunk: https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/x264

# Build 8bit or 10bit x264? (10bit = Better quality, but slower)
# For comparison, see, e.g.: https://gist.github.com/l4n9th4n9/4459997
_build=0   # 0 = Conflict after 1st build (default)
           # 1 = 8bit
           # 2 = 10bit
           # (Auto-detected later based on installed version)

pkgname=('x264-git' 'libx264-git' 'libx264-10bit-git' 'libx264-all-git')
_pkgname=x264
pkgver=152.20170626.r2851
pkgrel=1
arch=('i686' 'x86_64')
url='https://www.videolan.org/developers/x264.html'
license=('GPL')
depends=('glibc')
makedepends=('nasm' 'git' 'ffmpeg' 'l-smash')
source=("git+https://git.videolan.org/git/x264.git")
sha256sums=('SKIP')

# 8bit or 10bit?
if [[ ${_build} = 1 ]] || pacman -Q libx264-git &>/dev/null; then
  pkgname=('x264-git' 'libx264-git' 'libx264-all-git')
elif [[ ${_build} = 2 ]] || pacman -Q libx264-10bit-git &>/dev/null; then
  pkgname=('x264-git' 'libx264-10bit-git' 'libx264-all-git')
fi

pkgver() {
  cd ${_pkgname}

  _ver=$(grep '#define X264_BUILD' x264.h | cut -d' ' -f3)
  _date=$(git log -1 --format="%cd" --date=short | tr -d -)
  _commits=$(git rev-list --count HEAD)

  echo ${_ver}.${_date}.r${_commits}
}

prepare() {
  rm -rf build-{8,10}bit
  mkdir build-{8,10}bit
}

build() {
  for _b in 8 10; do (
    cd build-${_b}bit

    msg2 "Configuring (${_b}bit)..."
    ../${_pkgname}/configure \
      --prefix='/usr' \
      --enable-shared \
      --enable-pic \
      --enable-lto \
      --bit-depth="${_b}"

    msg2 "Making (${_b}bit)..."
    make
  ) done
}

package_x264-git() {
  pkgdesc='CLI tools for encoding H264/AVC video streams (Git)'
  depends=('libavcodec.so' 'libavformat.so' 'libavutil.so' 'liblsmash.so'
           'libswscale.so')
  provides=('x264')
  conflicts=('x264')

  for _b in {8,10}bit; do
    provides+=("x264-${_b}")

    msg2 "Make-installing (${_b}bit)..."
    make -C build-${_b} DESTDIR="${pkgdir}" install-cli
    mv "${pkgdir}"/usr/bin/x264{,-${_b}}
  done

  ln -s x264-8bit "${pkgdir}"/usr/bin/x264
}

package_libx264-git() {
  pkgdesc='Library for encoding H264/AVC video streams (8bit depth) (Git)'
  provides=('libx264-8bit' 'libx264.so' 'libx264')
  conflicts=('libx264')

  msg2 "Make-installing..."
  make -C build-8bit DESTDIR=${pkgdir} install-lib-shared
}

package_libx264-10bit-git() {
  pkgdesc='Library for encoding H264/AVC video streams (10bit depth) (Git)'
  provides=('libx264' 'libx264.so' 'libx264-10bit')
  conflicts=('libx264' 'libx264-10bit')

  msg2 "Make-installing..."
  make -C build-10bit DESTDIR=${pkgdir} install-lib-shared
}

package_libx264-all-git() {
  pkgdesc="Library for encoding H264/AVC video streams (all depths) (Git)"
  provides=('libx264-all')
  conflicts=('libx264-all')

  install -d "${pkgdir}"/usr/lib/x264

  for _b in {8,10}bit; do
    provides+=("libx264-${_b}.so")

    msg2 "Make-installing (${_b}bit)..."
    make -C build-${_b} DESTDIR="${pkgdir}" install-lib-shared

    mv "${pkgdir}"/usr/lib/libx264.so.${_ver} "${pkgdir}"/usr/lib/x264/libx264-${_b}.so.${_ver}
    rm -r "${pkgdir}"/usr/{include,lib/libx264.so,lib/pkgconfig}

    ln -sr "${pkgdir}"/usr/lib/x264/libx264-${_b}.so{.${_ver},}
  done
}

# vim: ts=2 sw=2 et: