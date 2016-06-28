# Maintainer: Jeff Keyte <jeff@keyte.me>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Wallace <daniel.wallace@gatech.edu>

pkgname=openpht
pkgver=1.6.1.120
_pkghash=4ab39d17
pkgrel=4
pkgdesc='OpenPHT is a community driven fork of Plex Home Theater '
arch=('i686' 'x86_64')
url='https://github.com/RasPlex/OpenPHT/'
license=('GPL2')
conflicts=("plex-home-theater")
depends=('openpht-ffmpeg' 'alsa-lib' 'avahi' 'boost-libs' 'curl' 'expat' 'freetype2' 'fribidi'
         'gcc-libs' 'glew' 'glibc' 'glu' 'libcdio' 'libgl' 'libjpeg' 'libmad'
         'libmicrohttpd' 'libmpeg2' 'libpng' 'libpulse' 'libsamplerate' 'llvm-libs'
         'libssh' 'libtiff' 'libusb-compat' 'libva' 'libvdpau' 'libx11'
         'libxext' 'libxrandr' 'lzo' 'pcre' 'python2' 'sdl' 'sdl_image'
         'sdl_mixer' 'sqlite' 'smbclient' 'taglib' 'tinyxml' 'yajl' 'zlib')
makedepends=('boost' 'cmake' 'doxygen' 'git' 'java-environment'
             'libcec' 'libplist' 'nasm' 'swig' 'unzip' 'zip' 'gcc-libs<=5.3.0' 'glibc<=2.23-1' 'llvm-libs<=3.7.1')
optdepends=('libplist: AirPlay support'
            'libcec: Pulse-Eight USB-CEC adapter support'
            'pulseaudio: PulseAudio support')
source=("https://github.com/RasPlex/OpenPHT/archive/v${pkgver}-${_pkghash}.tar.gz"
        'plexhometheater.sh'
	'fribidi.patch')
sha256sums=('a537af170dd03a9b4e094cb99b787237ae003f839e267072b3e6e3dbc9335f8a'
            'dc6bd394c07a2ececbb2f8c53cb54afd5d78f7c00a0b34acab3e71217da085fb'
	    '966edfa84fa09cf9c54281dff2adfd6fad41309b17893511e7cf01dc85def1ea')
prepare() {
  cd OpenPHT-${pkgver}-${_pkghash}
  patch -Np1 <../fribidi.patch
}

build() {
  cd OpenPHT-${pkgver}-${_pkghash}

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
  cd OpenPHT-${pkgver}-${_pkghash}/build

  make DESTDIR="${pkgdir}" install
  install -dm 755 "${pkgdir}"/usr/{lib/plexhometheater,share/{applications,pixmaps}}
  mv "${pkgdir}"/usr/bin/{system,xbmc-xrandr} "${pkgdir}"/usr/lib/plexhometheater/
  mv "${pkgdir}"/usr/share/XBMC "${pkgdir}"/usr/share/plexhometheater
  rm -rf "${pkgdir}"/usr/bin/*.so
  install -m 755 "${srcdir}"/plexhometheater.sh "${pkgdir}"/usr/bin/
  install -m 644 ../plex/Resources/plexhometheater.desktop "${pkgdir}"/usr/share/applications/
  install -m 644 ../plex/Resources/plex-icon-256.png "${pkgdir}"/usr/share/pixmaps/plexhometheater.png
}
