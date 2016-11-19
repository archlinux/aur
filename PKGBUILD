# Maintainer graysky <graysky AT archlinux DOT us>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
# Contributor: Zeqadious <zeqadious.at.gmail.dot.com>
# Contributor: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@gmail.com>

pkgbase=kodi-pre-release
pkgname=('kodi-pre-release' 'kodi-eventclients-pre-release')
pkgver=17.0b5
_codename=Krypton
pkgrel=4
arch=('i686' 'x86_64')
url="http://kodi.tv"
license=('GPL2')
makedepends=(
  'afpfs-ng' 'bluez-libs' 'boost' 'cmake' 'curl' 'cwiid' 'doxygen' 'git' 'glew'
  'gperf' 'hicolor-icon-theme' 'jasper' 'java-runtime' 'libaacs' 'libass'
  'libbluray' 'libcdio' 'libcec' 'libgl' 'libmariadbclient' 'libmicrohttpd'
  'libmodplug' 'libmpeg2' 'libnfs' 'libplist' 'libpulse' 'libssh' 'libva'
  'libvdpau' 'libxrandr' 'libxslt' 'lzo' 'mesa' 'nasm' 'nss-mdns'
  'python2-pillow' 'python2-pybluez' 'python2-simplejson' 'rtmpdump' 'sdl2'
  'sdl_image' 'shairplay' 'smbclient' 'swig' 'taglib' 'tinyxml' 'unzip' 'upower'
  'yajl' 'zip' 'mesa' 'dcadec' 'libcrossguid'
)
source=(
  "kodi-$pkgver-$_codename.tar.gz::https://github.com/xbmc/xbmc/archive/$pkgver-$_codename.tar.gz"
)
sha256sums=('e27d31c24de77f5f6b79f32d60c4e34787a2f98dcd7a15339ab6cf290f10a15d')

prepare() {
  cd "$srcdir/xbmc-$pkgver-$_codename"

  find -type f -name *.py -exec sed 's|^#!.*python$|#!/usr/bin/python2|' -i "{}" +
  sed 's|^#!.*python$|#!/usr/bin/python2|' -i tools/depends/native/rpl-native/rpl
  sed 's/python/python2/' -i tools/Linux/kodi.sh.in
  sed 's/shell python/shell python2/' -i tools/EventClients/Makefile.in
  # disable wiiremote due to incompatibility with bluez-5.29
  sed '/WiiRemote/d' -i tools/EventClients/Makefile.in
  sed '/mkdir -p $(DESTDIR)$(bindir)/i \
install:' -i tools/EventClients/Makefile.in

  # patches
}

build() {
  cd "$srcdir/xbmc-$pkgver-$_codename"

  # Bootstrapping
  MAKEFLAGS=-j1 ./bootstrap

  #./configure --help
  #return 1

  # Configuring XBMC
  export PYTHON_VERSION=2  # external python v2
  ./configure --prefix=/usr --exec-prefix=/usr \
    --disable-debug \
    --enable-libbluray \
    --with-lirc-device=/run/lirc/lircd \
    ac_cv_lib_bluetooth_hci_devid=no \
    ac_cv_type__Bool=yes

  # Now (finally) build
  make
}

package_kodi-pre-release() {
  pkgdesc="Beta or RC versions of a media player and entertainment hub for digital media."

  # depends expected for kodi plugins:
  # 'python2-pillow' 'python2-pybluez' 'python2-simplejson'
  # depends expeced in FEH.py
  # 'mesa-demos' 'xorg-xdpyinfo'
  depends=(
    'python2-pillow' 'python2-pybluez' 'python2-simplejson'
    'mesa-demos' 'xorg-xdpyinfo'
    'bluez-libs' 'fribidi' 'glew' 'hicolor-icon-theme' 'libass' 'libcdio'
    'libjpeg-turbo' 'libmariadbclient' 'libmicrohttpd' 'libpulse' 'libssh'
    'libva' 'libxrandr' 'libxslt' 'lzo' 'sdl2' 'smbclient' 'taglib' 'tinyxml'
    'yajl' 'mesa' 'dcadec' 'desktop-file-utils'
    'libvdpau'
  )
  optdepends=(
    'afpfs-ng: Apple shares support'
    'bluez: Blutooth support'
    'libnfs: NFS shares support'
    'libplist: AirPlay support'
    'libcec: Pulse-Eight USB-CEC adapter support'
    'lirc: Remote controller support'
    'pulseaudio: PulseAudio support'
    'shairplay: AirPlay support'
    'udisks: Automount external drives'
    'unrar: Archives support'
    'unzip: Archives support'
    'upower: Display battery level'
    'lsb-release: log distro information in crashlog'
  )
  provides=('xbmc' 'kodi')
  conflicts=('xbmc' 'kodi' 'kodi-devel' 'kodi-git')
  replaces=('xbmc')

  cd "$srcdir/xbmc-$pkgver-$_codename"
  # Running make install
  make DESTDIR="$pkgdir" install

  # We will no longer support the xbmc name
  rm "$pkgdir/usr/share/xsessions/xbmc.desktop"
  rm "$pkgdir/usr/bin/"xbmc{,-standalone}
  # we will leave /usr/{include,lib,share}/xbmc for now

  # Licenses
  install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
  for licensef in LICENSE.GPL copying.txt; do
    mv ${pkgdir}/usr/share/doc/kodi/${licensef} \
      ${pkgdir}/usr/share/licenses/${pkgname}
  done
}

package_kodi-eventclients-pre-release() {
  pkgdesc="Kodi Event Clients"

  depends=('cwiid')

  cd "$srcdir/xbmc-$pkgver-$_codename"

  make DESTDIR="$pkgdir" eventclients WII_EXTRA_OPTS=-DCWIID_OLD
}

