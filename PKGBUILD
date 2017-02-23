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
_suffix=pre-release
pkgname=("kodi-$_suffix" "kodi-eventclients-$_suffix" "kodi-tools-texturepacker-$_suffix" "kodi-dev-$_suffix")
pkgver=17.1rc1
_codename=Krypton
pkgrel=1
arch=('i686' 'x86_64')
url="http://kodi.tv"
license=('GPL2')
makedepends=(
  'afpfs-ng' 'bluez-libs' 'boost' 'cmake' 'curl' 'cwiid' 'doxygen' 'glew'
  'gperf' 'hicolor-icon-theme' 'jasper' 'java-runtime' 'libaacs' 'libass'
  'libbluray' 'libcdio' 'libcec' 'libgl' 'libmariadbclient' 'libmicrohttpd'
  'libmodplug' 'libmpeg2' 'libnfs' 'libplist' 'libpulse' 'libssh' 'libva'
  'libvdpau' 'libxrandr' 'libxslt' 'lzo' 'nasm' 'nss-mdns' 'python2-pillow'
  'python2-pybluez' 'python2-simplejson' 'rtmpdump'
  'shairplay' 'smbclient' 'swig' 'taglib' 'tinyxml' 'unzip' 'upower' 'yajl' 'zip'
  'mesa' 'libcrossguid'
)
source=(
  "kodi-$pkgver-$_codename.tar.gz::https://github.com/xbmc/xbmc/archive/$pkgver-$_codename.tar.gz"
)
sha256sums=('a614128c065d561fccd4167f25eddbad3875328f1e81f627ffe3d0b17958aa07')

prepare() {
  [[ -d kodi-build ]] && rm -rf kodi-build
  mkdir kodi-build
}

build() {
  cd "kodi-build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_EVENTCLIENTS=ON \
    -DLIRC_DEVICE=/run/lirc/lircd \
    ../"xbmc-$pkgver-$_codename"/project/cmake
  make
  make preinstall
}

# kodi
# components: kodi, kodi-bin

package_kodi-pre-release() {
  pkgdesc="Beta or RC versions of a media player and entertainment hub for digital media."
  depends=(
    'python2-pillow' 'python2-simplejson' 'xorg-xdpyinfo' 'bluez-libs' 'fribidi'
    'freetype2' 'glew' 'hicolor-icon-theme' 'libcdio' 'libjpeg-turbo' 'libmariadbclient'
    'libmicrohttpd' 'libpulse' 'libssh' 'libva' 'libvdpau' 'libxrandr' 'libxslt' 'lzo'
    'smbclient' 'taglib' 'tinyxml' 'yajl' 'mesa' 'desktop-file-utils'
  )
  optdepends=(
    'afpfs-ng: Apple shares support'
    'bluez: Blutooth support'
    'python2-pybluez: Bluetooth support'
    'libnfs: NFS shares support'
    'libplist: AirPlay support'
    'libcec: Pulse-Eight USB-CEC adapter support'
    'lirc: Remote controller support'
    'lsb-release: log distro information in crashlog'
    'pulseaudio: PulseAudio support'
    'shairplay: AirPlay support'
    'unrar: Archives support'
    'unzip: Archives support'
    'upower: Display battery level'
  )
  provides=('xbmc' 'kodi')
  conflicts=('xbmc' 'kodi' 'kodi-devel' 'kodi-git')
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
  install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
  for licensef in LICENSE.GPL copying.txt; do
    mv ${pkgdir}/usr/share/doc/kodi/${licensef} \
      ${pkgdir}/usr/share/licenses/${pkgname}
  done

  # python2 is being used
  cd "$pkgdir"
  grep -lR '#!.*python' * | while read file; do sed -s 's/\(#!.*python\)/\12/g' -i "$file"; done
}

# kodi-eventclients
# components: kodi-eventclients-common kodi-eventclients-ps3 kodi-eventclients-wiiremote kodi-eventclients-xbmc-send

package_kodi-eventclients-pre-release() {
  pkgdesc="Kodi Event Clients (master branch)"
  conflicts=('kodi-eventclients')

  depends=('cwiid')

  _components=(
    'kodi-eventclients-common'
    'kodi-eventclients-ps3'
    'kodi-eventclients-wiiremote'
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
  pkgdesc="Kodi Texturepacker tool (master branch)"
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
  pkgdesc="Kodi dev files (master branch)"
  depends=('kodi')

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
