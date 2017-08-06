# Maintainer: Jason Mooradian <cowmix@gmail.com>
# Contributor: Jeff Keyte <jeff@keyte.me>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Wallace <daniel.wallace@gatech.edu>

pkgname=openpht
pkgver=1.8.0.148
_pkghash=573b6d73
pkgrel=1
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
         'sdl_mixer' 'sqlite' 'smbclient' 'taglib' 'tinyxml' 'yajl' 'zlib' 'rtmpdump')
makedepends=('boost' 'cmake' 'doxygen' 'git' 'java-environment' 'shairplay'
             'libcec<=3.1.0' 'libplist' 'nasm' 'swig' 'unzip' 'zip' 'gcc-libs' 'glibc' 'llvm-libs')
optdepends=('libplist: AirPlay support'
            'libcec: Pulse-Eight USB-CEC adapter support'
            'pulseaudio: PulseAudio support'
             'shairplay: Shairplay Support')
source=("https://github.com/RasPlex/OpenPHT/archive/v${pkgver}-${_pkghash}.tar.gz"
        'plexhometheater.sh'
	'fribidi.patch'
	'plexhometheater.desktop')
sha256sums=('a3e4ab3995634f6b17d8426e8fdadfa2a028ee42e3d17d59321a63f555760171'
            '8a2d9ac55bc4e05520a9dc5893bb19c5e0e28991dbcdd9b4af5feaec20fc4f2d'
	    '966edfa84fa09cf9c54281dff2adfd6fad41309b17893511e7cf01dc85def1ea'
	    '354429ce7dcafaa8b619b000000f4f4f8fc0a1545b9656f6beb9f85ebb8f4e41')
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
    -DUSE_INTERNAL_FFMPEG='ON'

  make
}

package() {
  cd OpenPHT-${pkgver}-${_pkghash}/build

  make DESTDIR="${pkgdir}" install
  install -dm 755 "${pkgdir}"/usr/{lib/plexhometheater,share/{applications,pixmaps}}
  mv "${pkgdir}"/usr/bin/openpht "${pkgdir}"/usr/lib/plexhometheater/
  mv "${pkgdir}"/usr/share/openpht "${pkgdir}"/usr/share/plexhometheater
  rm -rf "${pkgdir}"/usr/bin/*.so
  install -m 755 "${srcdir}"/plexhometheater.sh "${pkgdir}"/usr/bin/
  install -m 644 "${srcdir}"/plexhometheater.desktop "${pkgdir}"/usr/share/applications/
  install -m 644 ../plex/Resources/plex-icon-256.png "${pkgdir}"/usr/share/pixmaps/plexhometheater.png
}
