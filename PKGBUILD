# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: goodguy < lists dot cinelerra-cv dot org >
# Contributor: Ray Rashif < schiv at archlinux dot org >
# Contributor: Daniel J Griffiths < ghost1227 at archlinux dot us >
# Contributor: Jaroslaw Swierczynski < swiergot at aur dot archlinux dot org >
# Contributor: Alexander Rødseth < rodseth at gmail dot com >

_pkgname=cinelerra-gg
_pkgver=5.1

pkgname=cin-git
pkgver=5.1.20190430
pkgrel=1
pkgdesc="Cinelerra maintained by Good Guy (git version)"
arch=('x86_64')
url="https://www.cinelerra-gg.org"
license=('GPL')
depends=('alsa-lib'
         'dvdauthor'
         'fftw'
         'flac'
         'fribidi'
         'gdk-pixbuf2'
         'glib2'
         'glu'
         'gtk2'
         'harfbuzz'
         'inkscape'
         'libavc1394'
         'libdatrie'
         'libdv'
         'libffi'
         'libglvnd'
         'libiec61883'
         'libjpeg-turbo'
         'libogg'
         'libpng'
         'libraw1394'
         'libsndfile'
         'libthai'
         'libtheora'
         'libtiff'
         'libva'
         'libvdpau'
         'libvorbis'
         'libvpx'
         'libx11'
         'libxv'
         'numactl'
         'openexr'
         'opus'
         'ttf-dejavu'
         'udftools'
         'xorg-server'
         'xorg-fonts-misc')
makedepends=('yasm'
             'nasm'
             'cmake'
             'git'
             'ctags'
             'libxml2'
             'perl-xml-libxml'
             'perl-xml-parser')
source=("${_pkgname}::git+git://git.cinelerra-gg.org/goodguy/cinelerra.git"
        "dep.patch")
sha256sums=('SKIP'
            'ef8e25d0bee3b495c4dda3add81090731932d35ab60eca4f744a2e885ad1ce37')

pkgver() {
  cd "${srcdir}/${_pkgname}/cinelerra-${_pkgver}/blds"
  echo "${_pkgver}.`grep 'pkgrel=' PKGBUILD | grep -o [0-9]*`"
}

prepare() {
  cd "${srcdir}"
  # Patches
  # 1. do not build libvorbis when libvorbis is installed
  # 2. fix wrong openexr detection
  # 3. fix wrong pkg-config definition
  patch -Np0 -i dep.patch

  cd "${srcdir}/${_pkgname}/cinelerra-${_pkgver}"
  sed -i 's/\<python\>/python2.7/' ./guicast/Makefile
  ./autogen.sh
}

build() {
  cd "${srcdir}/${_pkgname}/cinelerra-${_pkgver}"
  export FFMPEG_EXTRA_CFG=" --disable-vdpau"
  ./configure \
    --prefix=/usr \
    --disable-static-build \
    --with-exec-name=${_pkgname}
    # optional flags
    #--enable-x264_hidepth \
    #--enable-x265_hidepth \
  make -j1
}

package() {
  cd "${srcdir}/${_pkgname}/cinelerra-${_pkgver}"
  # install failure with more than one job
  make -j1 DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
