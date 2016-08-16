# Maintainer: Norman Uittenbogaart <normanu@gmail.com>

pkgname=openpht-git
_gitname=OpenPHT
pkgver=25736.9b48bda
pkgrel=1
pkgdesc='OpenPHT is a community driven fork of Plex Home Theater '
arch=('i686' 'x86_64')
url='https://github.com/RasPlex/OpenPHT/'
license=('GPL2')
conflicts=("plex-home-theater" "openpht")
depends=('alsa-lib' 'avahi' 'boost-libs' 'curl' 'expat' 'freetype2' 'fribidi'
         'gcc-libs' 'glew' 'glibc' 'glu' 'libcdio' 'libgl' 'libjpeg' 'libmad'
         'libmicrohttpd' 'libmpeg2' 'libpng' 'libpulse' 'libsamplerate' 'llvm-libs'
         'libssh' 'libtiff' 'libusb-compat' 'libva' 'libvdpau' 'libx11'
         'libxext' 'libxrandr' 'lzo' 'pcre' 'python2' 'sdl' 'sdl_image'
         'sdl_mixer' 'sqlite' 'smbclient' 'taglib' 'tinyxml' 'yajl' 'zlib' 'rtmpdump')
makedepends=('git' 'boost' 'cmake' 'doxygen' 'gcc' 'git' 'java-environment' 'shairplay'
             'openpht-ffmpeg' 'libcec' 'libplist' 'nasm' 'swig' 'unzip' 'zip')
optdepends=('libplist: AirPlay support'
            'libcec: Pulse-Eight USB-CEC adapter support'
            'pulseaudio: PulseAudio support'
             'shairplay: Shairplay Support')
source=('git://github.com/RasPlex/OpenPHT.git'
        'openpht.sh'
	'fribidi.patch'
	'openpht.desktop')
sha256sums=('SKIP'
	    '4a205bea1318ec77f618887ef66f6b0490128476a976044e237031b15bc0c30a'
	    '966edfa84fa09cf9c54281dff2adfd6fad41309b17893511e7cf01dc85def1ea'
	    '73b9d7c40cc1ac5ca2e03a99e9560d4ba153f195dcb1a2086c0e422fa3a5f340')


pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $_gitname
  patch -Np1 <../fribidi.patch
}

build() {
  cd $_gitname

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DUSE_INTERNAL_FFMPEG='OFF'
  make
}

package() {
  cd $_gitname/build

  make DESTDIR="${pkgdir}" install
  install -dm 755 "${pkgdir}"/usr/{lib/openpht,share/{applications,pixmaps}}
  rm -rf "${pkgdir}"/usr/bin/*.so
  install -m 755 "${srcdir}"/openpht.sh "${pkgdir}"/usr/bin/
  install -m 644 "${srcdir}"/openpht.desktop "${pkgdir}"/usr/share/applications/
  install -m 644 ../plex/Resources/plex-icon-256.png "${pkgdir}"/usr/share/pixmaps/openpht.png
}
