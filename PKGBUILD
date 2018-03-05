# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: goodguy <lists.cinelerra-cv.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=cin-git
_pkgname=cinelerra-gg
pkgver=5.1.20180302
_pkgver=5.1
pkgrel=1
pkgdesc="Cinelerra maintained by Good Guy (git version)"
arch=('x86_64' 'i686')
url="https://cinelerra-cv.org/"
license=('GPL')
depends=('xorg-server' 'libpng' 'libxv' 'libva'
         'libxft' 'freetype2' 'alsa-lib' 'inkscape' 'dvdauthor'
         'libvorbis' 'openexr')
makedepends=('yasm' 'nasm' 'cmake' 'git'
	           'libxml2' 'perl-xml-libxml' 'perl-xml-parser')
source=("${_pkgname}::git+git://git.cinelerra-cv.org/goodguy/cinelerra.git"
        "dep.patch")
md5sums=('SKIP'
         'd232b7c72c5cf94fc352323e5580260c')

pkgver() {
  cd "${srcdir}/${_pkgname}/cinelerra-${_pkgver}"
  echo "${_pkgver}.`grep 'pkgrel=' PKGBUILD | grep -o [0-9]*`"
}

prepare() {
  cd "${srcdir}"

  # Patches
  # 1. do not build libvorbis when libvorbis is installed
  #    building failure when texlive installed
  # 2. fix wrong openexr detection
  patch -Np0 -i dep.patch

  cd "${srcdir}/${_pkgname}/cinelerra-${_pkgver}"

  sed -i 's/\<python\>/python2.7/' ./guicast/Makefile

  ./autogen.sh
}

build() {
  cd "${srcdir}/${_pkgname}/cinelerra-${_pkgver}"

  export FFMPEG_EXTRA_CFG=" --disable-vdpau"
  ./configure --prefix=/usr \
              --disable-static-build \
              --with-exec-name=${_pkgname}
              # optional flags
              #--enable-x264_hidepth \
              #--enable-x265_hidepth \

  make
}

package() {
  cd "${srcdir}/${_pkgname}/cinelerra-${_pkgver}"

  # install failure with more than one job
  make -j1 DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
