# Maintainer: Michael Serpieri <mickybart@pygoscelis.org>
# Contributor: Lenovsky <lenovsky@protonmail.ch>
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

pkgbase=kodi-gb-git
pkgname=('kodi-gb-git' 'kodi-gb-eventclients-git' 'kodi-gb-tools-texturepacker-git' 'kodi-gb-dev-git')
_gitname='xbmc'
pkgver=18.0.r48337.dcdf336207
pkgrel=1
arch=('x86_64')
url="http://kodi.tv"
license=('GPL2')
makedepends=('afpfs-ng' 'bluez-libs' 'boost' 'cmake' 'curl' 'cwiid' 'doxygen' 'git' 'ffmpeg' 'glew'
             'gperf' 'hicolor-icon-theme' 'jasper' 'java-runtime' 'libaacs' 'libass' 'libbluray'
             'libcdio' 'libcec' 'fmt' 'libgl' 'libmariadbclient' 'libmicrohttpd' 'libmodplug'
             'libmpeg2' 'libnfs' 'libplist' 'libxrandr' 'libxslt' 'lzo' 'mesa' 'nasm' 'nss-mdns'
             'python2-pillow' 'python2-pybluez' 'python2-simplejson' 'rapidjson' 'rtmpdump'
             'shairplay' 'smbclient' 'swig' 'taglib' 'tinyxml' 'upower')
source=("$_gitname::git+https://github.com/garbear/xbmc.git#branch=retroplayer-18alpha1")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  _major=$(grep 'VERSION_MAJOR' version.txt | sed 's/VERSION_MAJOR //')
  _minor=$(grep 'VERSION_MINOR' version.txt | sed 's/VERSION_MINOR //')
  _revision=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  echo "$_major.$_minor.$_revision" 
}

prepare() {
  [[ -d kodi-build ]] && rm -rf kodi-build
  mkdir kodi-build
}

build() {
  # main
  cd kodi-build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_EVENTCLIENTS=ON \
    -DLIRC_DEVICE=/run/lirc/lircd \
    -DENABLE_INTERNAL_FFMPEG="no" \
    -DWITH_FFMPEG="yes" \
    "../$_gitname"
  make
  make preinstall
}

package_kodi-gb-git() {
  pkgdesc="A software media player and entertainment hub for digital media (retroplayer / garbear)"
  depends=('bluez-libs' 'desktop-file-utils' 'ffmpeg' 'glew' 'hicolor-icon-theme' 'libcdio'
           'libmariadbclient' 'libmicrohttpd' 'libxrandr' 'libxslt' 'lzo' 'mesa' 'python2-pillow'
           'python2-simplejson' 'smbclient' 'taglib' 'tinyxml' 'xorg-xdpyinfo')
  optdepends=('gdb: for meaningful backtraces in case of trouble - STRONGLY RECOMMENDED'
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
              'upower: Display battery level')
  provides=('xbmc' 'kodi' 'kodi-gb')
  conflicts=('xbmc' 'kodi' 'kodi-git' 'arm-mem-git' 'shairplay-git')
  replaces=('xbmc-rbp-git')
  
  _components=('kodi' 'kodi-bin')

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

package_kodi-gb-eventclients-git() {
  pkgdesc="Kodi event clients (retroplayer / garbear)"
  provides=('kodi-eventclients')
  conflicts=('kodi-eventclients' 'kodi-eventclients-git')
  depends=('cwiid')

  _components=('kodi-eventclients-common' 'kodi-eventclients-ps3' 'kodi-eventclients-wiiremote'
               'kodi-eventclients-xbmc-send')

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

package_kodi-gb-tools-texturepacker-git() {
  pkgdesc="Kodi texturepacker tool (retroplayer / garbear)"
  conflicts=('kodi-tools-texturepacker' 'kodi-tools-texturepacker-git')
  depends=('giflib' 'libjpeg-turbo' 'libpng' 'lzo')

  _components=('kodi-tools-texturepacker')

  cd kodi-build
  # install eventclients
  for _cmp in ${_components[@]}; do
    DESTDIR="$pkgdir" /usr/bin/cmake \
      -DCMAKE_INSTALL_COMPONENT="$_cmp" \
      -P cmake_install.cmake
  done
}

package_kodi-gb-dev-git() {
  pkgdesc="Kodi dev files (retroplayer / garbear)"
  conflicts=('kodi-dev' 'kodi-dev-git')
  depends=('kodi')
  provides=('kodi-dev' 'kodi-gb-dev')

  _components=('kodi-addon-dev' 'kodi-audio-dev' 'kodi-eventclients-dev' 'kodi-game-dev'
               'kodi-inputstream-dev' 'kodi-peripheral-dev' 'kodi-pvr-dev' 'kodi-screensaver-dev'
               'kodi-visualization-dev')

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
