# vim:set ts=2 sw=2 et:
# Maintainer graysky <graysky AT archlinux DOT us>
# Contributor: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: DonVla <donvla@users.sourceforge.net>
# Contributor: Ulf Winkelvos <ulf [at] winkelvos [dot] de>
# Contributor: Ralf Barth <archlinux dot org at haggy dot org>
# Contributor: B & monty - Thanks for your hints :)
# Contributor: marzoul
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
# Contributor: Zeqadious <zeqadious.at.gmail.dot.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
#
# Original credits go to Edgar Hucek <gimli at dark-green dot com>
# for his xbmc-vdpau-vdr PKGBUILD at https://archvdr.svn.sourceforge.net/svnroot/archvdr/trunk/archvdr/xbmc-vdpau-vdr/PKGBUILD

pkgbase=kodi-pre-release
pkgname=("kodi-${pkgbase#kodi-*}" "kodi-eventclients-${pkgbase#kodi-*}" "kodi-tools-texturepacker-${pkgbase#kodi-*}" "kodi-dev-${pkgbase#kodi-*}")
pkgver=18.0a2
pkgrel=3
arch=('x86_64')
url="http://kodi.tv"
license=('GPL2')
makedepends=(
  'afpfs-ng' 'bluez-libs' 'cmake' 'curl' 'doxygen' 'glew'
  'gperf' 'hicolor-icon-theme' 'jasper' 'java-runtime' 'libaacs' 'libass'
  'libbluray' 'libcdio' 'libcec' 'libgl' 'libmariadbclient' 'libmicrohttpd'
  'libmodplug' 'libmpeg2' 'libnfs' 'libplist' 'libpulse' 'libssh' 'libva'
  'libvdpau' 'libxrandr' 'libxslt' 'lirc' 'lzo' 'mesa' 'nasm' 'nss-mdns'
  'python2-pillow' 'python2-pybluez' 'python2-simplejson' 'rtmpdump'
  'shairplay' 'smbclient' 'speex' 'swig' 'taglib' 'tinyxml' 'unzip' 'upower'
  'yajl' 'zip' 'git' 'giflib' 'rapidjson'
)
# Found on their respective github release pages. One can check them against
# what is pulled down when not specifying them in the cmake step.
# $CHROOT/build/kodi-pre-release/src/kodi-build/build/download
#
# https://github.com/xbmc/FFmpeg/tags
# https://github.com/xbmc/libdvdcss/tags
# https://github.com/xbmc/libdvdnav/tags
# https://github.com/xbmc/libdvdread/tags
_codename=Leia
_rtype=Alpha
_rver=1
_dver=3
_ffmpeg_version="4.0-$_codename-$_rtype-$_rver"
_libdvdcss_version="1.4.1-$_codename-$_rtype-$_dver"
_libdvdnav_version="6.0.0-$_codename-$_rtype-$_dver"
_libdvdread_version="6.0.0-$_codename-$_rtype-$_dver"
source=(
  "${pkgbase%%-*}-$pkgver-$_codename.tar.gz::https://github.com/xbmc/xbmc/archive/$pkgver-$_codename.tar.gz"
  "libdvdcss-$_libdvdcss_version.tar.gz::https://github.com/xbmc/libdvdcss/archive/1.4.1-$_codename-$_rtype-$_dver.tar.gz"
  "libdvdnav-$_libdvdnav_version.tar.gz::https://github.com/xbmc/libdvdnav/archive/6.0.0-$_codename-$_rtype-$_dver.tar.gz"
  "libdvdread-$_libdvdread_version.tar.gz::https://github.com/xbmc/libdvdread/archive/6.0.0-$_codename-$_rtype-$_dver.tar.gz"
  "ffmpeg-$_ffmpeg_version.tar.gz::https://github.com/xbmc/FFmpeg/archive/$_ffmpeg_version.tar.gz"
  'cheat-sse-build.patch'
  'cpuinfo'
)
noextract=(
  "libdvdcss-$_libdvdcss_version.tar.gz"
  "libdvdnav-$_libdvdnav_version.tar.gz"
  "libdvdread-$_libdvdread_version.tar.gz"
  "ffmpeg-$_ffmpeg_version.tar.gz"
)
sha256sums=('937d755c638324bf388fc9e971c5d8f90fcc0ab9362f0b15bbad5e47f0bc67d6'
            '6af3d4f60e5af2c11ebe402b530c07c8878df1a6cf19372e16c92848d69419a5'
            '071e414e61b795f2ff9015b21a85fc009dde967f27780d23092643916538a57a'
            'a30b6aa0aad0f2c505bc77948af2d5531a80b6e68112addb4c123fca24d5d3bf'
            'b486ab7bb76e0e2e5a30912640a74da2d2a1ce7640b6134507988fdd1eb44ae9'
            '304d4581ef024bdb302ed0f2dcdb9c8dea03f78ba30d2a52f4a0d1c8fc4feecd'
            '27387e49043127f09c5ef0a931fffb864f5730e79629100a6e210b68a1b9f2c1')

prepare() {
  [[ -d kodi-build ]] && rm -rf kodi-build
  mkdir kodi-build

  cd "xbmc-$pkgver-$_codename"
  # detect if building in arch chroot
  if [[ "$srcdir" =~ ^\/build.* ]]; then
    patch -Np1 -i "$srcdir/cheat-sse-build.patch"
  fi
}

build() {
  cd kodi-build

  ### Optionally uncomment and setup to your liking
  # export CFLAGS+=" -march=native"
  # export CXXFLAGS="${CFLAGS}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_EVENTCLIENTS=ON \
    -Dlibdvdcss_URL="$srcdir/libdvdcss-$_libdvdcss_version.tar.gz" \
    -Dlibdvdnav_URL="$srcdir/libdvdnav-$_libdvdnav_version.tar.gz" \
    -Dlibdvdread_URL="$srcdir/libdvdread-$_libdvdread_version.tar.gz" \
    -DFFMPEG_URL="$srcdir/ffmpeg-$_ffmpeg_version.tar.gz" \
    -DENABLE_INTERNAL_FMT=ON \
    -DENABLE_VERBOSE=ON \
    ../"xbmc-$pkgver-$_codename"
  make
  make preinstall
}

# kodi
# components: kodi, kodi-bin

package_kodi-pre-release() {
  pkgdesc="Alpha, Beta, or RC version of a media player and entertainment hub for digital media."
  depends=(
    'bluez-libs' 'desktop-file-utils' 'freetype2' 'fribidi'
    'hicolor-icon-theme' 'libass' 'libcdio' 'libjpeg-turbo' 'libmariadbclient'
    'libmicrohttpd' 'libpulse' 'libssh' 'libva' 'libvdpau' 'libxrandr' 'libcec'
    'libxslt' 'lirc' 'lzo' 'mesa' 'python2-pillow' 'python2-simplejson' 'smbclient'
    'speex' 'taglib' 'tinyxml' 'xorg-xdpyinfo' 'yajl'
  )
  optdepends=(
    'afpfs-ng: Apple shares support'
    'bluez: Blutooth support'
    'python2-pybluez: Bluetooth support'
    'libnfs: NFS shares support'
    'libplist: AirPlay support'
    'lsb-release: log distro information in crashlog'
    'pulseaudio: PulseAudio support'
    'shairplay: AirPlay support'
    'unrar: Archives support'
    'unzip: Archives support'
    'upower: Display battery level'
  )
  provides=('xbmc' 'kodi')
  conflicts=('xbmc' 'kodi' 'kodi-git' 'kodi-devel')
  replaces=('xbmc')

  _components=(
  'kodi'
  'kodi-bin'
  )

  cd kodi-build
  # install eventclients
  for _cmp in ${_components[@]}; do
  DESTDIR="$pkgdir" /usr/bin/cmake \
    -DCMAKE_INSTALL_COMPONENT="$_cmp" \
     -P cmake_install.cmake
  done

  # Licenses
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  for licensef in LICENSE.GPL copying.txt; do
    mv "$pkgdir/usr/share/doc/kodi/$licensef" \
      "$pkgdir/usr/share/licenses/$pkgname"
  done

  # python2 is being used
  cd "$pkgdir"
  grep -lR '#!.*python' * | while read file; do sed -s 's/\(#!.*python\)/\12/g' -i "$file"; done
}

# kodi-eventclients
# components: kodi-eventclients-common kodi-eventclients-ps3 kodi-eventclients-wiiremote kodi-eventclients-xbmc-send

package_kodi-eventclients-pre-release() {
  pkgdesc="Kodi Event Clients (pre-release versions)"
  conflicts=('kodi-eventclients')
  optdepends=('python2: most eventclients are implemented in python2')

  _components=(
    'kodi-eventclients-common'
    'kodi-eventclients-ps3'
    'kodi-eventclients-xbmc-send'
  )

  cd kodi-build
  # install eventclients
  for _cmp in ${_components[@]}; do
    DESTDIR="$pkgdir" /usr/bin/cmake \
      -DCMAKE_INSTALL_COMPONENT="$_cmp" \
      -P cmake_install.cmake
  done

  # python2 is being used
  cd "$pkgdir"
  grep -lR '#!.*python' * | while read file; do sed -s 's/\(#!.*python\)/\12/g' -i "$file"; done
}

# kodi-tools-texturepacker
# components: kodi-tools-texturepacker

package_kodi-tools-texturepacker-pre-release() {
  pkgdesc="Kodi Texturepacker tool (pre-release versions)"
  depends=('libpng' 'giflib' 'libjpeg-turbo' 'lzo')

  _components=(
    'kodi-tools-texturepacker'
  )

  cd kodi-build
  # install eventclients
  for _cmp in ${_components[@]}; do
    DESTDIR="$pkgdir" /usr/bin/cmake \
      -DCMAKE_INSTALL_COMPONENT="$_cmp" \
      -P cmake_install.cmake
  done
}

# kodi-dev
# components: kodi-addon-dev kodi-audio-dev kodi-eventclients-dev kodi-game-dev kodi-inputstream-dev kodi-peripheral-dev kodi-pvr-dev kodi-screensaver-dev kodi-visualization-dev

package_kodi-dev-pre-release() {
  pkgdesc="Kodi dev files (pre-release versions)"
  depends=('kodi-pre-release')
  provides=('kodi-dev')
  conflicts=('kodi-dev' 'kodi-devel-dev')

  _components=(
    'kodi-addon-dev'
    'kodi-audio-dev'
    'kodi-eventclients-dev'
    'kodi-game-dev'
    'kodi-inputstream-dev'
    'kodi-peripheral-dev'
    'kodi-pvr-dev'
    'kodi-screensaver-dev'
    'kodi-visualization-dev'
  )

  cd kodi-build
  # install eventclients
  for _cmp in ${_components[@]}; do
    DESTDIR="$pkgdir" /usr/bin/cmake \
      -DCMAKE_INSTALL_COMPONENT="$_cmp" \
      -P cmake_install.cmake
  done

  # python2 is being used
  cd "$pkgdir"
  grep -lR '#!.*python' * | while read file; do sed -s 's/\(#!.*python\)/\12/g' -i "$file"; done
}
