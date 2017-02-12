# vim:set ts=2 sw=2 et:
# $Id$
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: graysky <graysky AT archlinux DOT us>
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

pkgbase=kodi-c2-x11
pkgname=('kodi-c2-x11' 'kodi-c2-x11-eventclients' 'kodi-c2-x11-tools-texturepacker' 'kodi-c2-x11-dev')
pkgver=17.0
_codename=Krypton
pkgrel=1
arch=('i686' 'x86_64' 'aarch64')
url="http://kodi.tv"
license=('GPL2')
makedepends=(
  'afpfs-ng' 'bluez-libs' 'boost' 'cmake' 'curl' 'cwiid' 'doxygen' 'glew'
  'gperf' 'hicolor-icon-theme' 'jasper' 'java-runtime' 'libaacs' 'libass'
  'libbluray' 'libcdio' 'libcec' 'odroid-c2-libgl-x11' 'aml-libs-c2' 'libmariadbclient' 'libmicrohttpd'
  'libmodplug' 'libmpeg2' 'libnfs' 'libplist' 'libpulse' 'libssh' 'libva'
  'libvdpau' 'libxrandr' 'libxslt' 'lzo' 'nasm' 'nss-mdns' 'python2-pillow'
  'python2-pybluez' 'python2-simplejson' 'rtmpdump'
  'shairplay' 'smbclient' 'swig' 'taglib' 'tinyxml' 'unzip' 'upower' 'yajl' 'zip'
  'mesa' 'libcrossguid'
)
source=(
  "$pkgname-$pkgver-$_codename.tar.gz::https://github.com/xbmc/xbmc/archive/$pkgver-$_codename.tar.gz"
  '10-odroid.rules'
  'kodi_permissions.conf'
)
sha512sums=('ca0d812bcbcc58b74542872365244c5b937803c5618d2277e85a8cb805820ddb22886233d1417fa0e7532c9909749e632e276f8da51d86e1f5f060b2d1ad6a12'
            'dcb23c9074a6f646c419957169642bfd565e004f221bd972ae6034bcc4ef6aa6f4f2bbda011c759fef769b682f7a686cc041a02e5326530bd1ad2011366d1529'
            '1ca4d17f73a1421dac7b514b662a81ddb6ec2c25bf388c7a31e2e8ce99fa2413fc7133a1f6775b25f7e8cb2ae257c55a6bb142d07ffd19a8892c9bc1bb24d365')

prepare() {
  [[ -d kodi-build ]] && rm -rf kodi-build
  mkdir kodi-build
}

build() {
  cd kodi-build
  
  CFLAGS="$CFLAGS"
  CXXFLAGS="$CFLAGS"
  LDFLAGS+=" -L/usr/lib/mali-egl -L/usr/lib/aml_libs"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_EVENTCLIENTS=ON \
    -DLIRC_DEVICE=/run/lirc/lircd \
    -DENABLE_AML=ON \
    -DENABLE_VDPAU=OFF \
    -DENABLE_VAAPI=OFF \
    ../"xbmc-$pkgver-$_codename"/project/cmake

  make
  make preinstall
}

# kodi
# components: kodi, kodi-bin

package_kodi-c2-x11() {
  pkgdesc="A software media player and entertainment hub for digital media"
  depends=(
    'python2-pillow' 'python2-pybluez' 'python2-simplejson' 'xorg-xdpyinfo'
    'bluez-libs' 'fribidi' 'freetype2' 'glew' 'hicolor-icon-theme' 'libcdio'
    'libjpeg-turbo' 'libmariadbclient' 'libmicrohttpd' 'libpulse' 'libssh'
    'odroid-c2-libgl-x11' 'aml-libs-c2' 'libxrandr' 'libxslt' 'lzo' 'smbclient' 'taglib' 'tinyxml'
    'yajl' 'mesa' 'desktop-file-utils'
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
  install="kodi.install"
  provides=('kodi-c2-x11')
  conflicts=('xbmc' 'kodi' 'kodi-c2-x11' 'kodi-c2-fb')
  replaces=('kodi-c2-x11')

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

  install -Dm0644 $srcdir/kodi_permissions.conf $pkgdir/etc/tmpfiles.d/kodi_permissions.conf
  install -Dm0644 $srcdir/10-odroid.rules $pkgdir/etc/udev/rules.d/10-odroid.rules
}

# kodi-eventclients
# components: kodi-eventclients-common kodi-eventclients-ps3 kodi-eventclients-wiiremote kodi-eventclients-xbmc-send

package_kodi-c2-x11-eventclients() {
  pkgdesc="Kodi Event Clients"
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

package_kodi-c2-x11-tools-texturepacker() {
  pkgdesc="Kodi Texturepacker tool"
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

package_kodi-c2-x11-dev() {
  pkgdesc="Kodi dev files"
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
