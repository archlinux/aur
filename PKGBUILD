# vim:set ts=2 sw=2 et:
# $Id$
# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
# Original Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Original Maintainer: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
# Contributor: Zeqadious <zeqadious.at.gmail.dot.com>
# Contributor: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@gmail.com>

pkgbase=kodi-c2-x11
pkgname=('kodi-c2-x11' 'kodi-c2-x11-eventclients')
pkgver=16.1
_codename=Jarvis
pkgrel=4
arch=('i686' 'x86_64' 'aarch64')
url="http://kodi.tv"
license=('GPL2')
conflicts=('kodi' 'kodi-c2-fb')

makedepends=(
  'afpfs-ng' 'bluez-libs' 'boost' 'cmake' 'curl' 'cwiid' 'doxygen' 'git' 'glew'
  'gperf' 'hicolor-icon-theme' 'jasper' 'java-runtime' 'libaacs' 'libass'
  'libbluray' 'libcdio' 'libcec' 'odroid-c2-libgl-x11' 'aml-libs-c2'  'libmariadbclient' 'libmicrohttpd'
  'libmodplug' 'libmpeg2' 'libnfs' 'libplist' 'libpulse' 'libssh' 'libva'
  'libvdpau' 'libxrandr' 'libxslt' 'lzo' 'mesa' 'nasm' 'nss-mdns'
  'python2-pillow' 'python2-pybluez' 'python2-simplejson' 'rtmpdump' 'sdl2'
  'sdl_image' 'shairplay' 'smbclient' 'swig' 'taglib' 'tinyxml' 'unzip' 'upower'
  'yajl' 'zip' 'mesa' 'dcadec' 'libcrossguid'
)
source=(
  "$pkgname-$pkgver-$_codename.tar.gz::https://github.com/xbmc/xbmc/archive/$pkgver-$_codename.tar.gz"
  '9703.patch'
  '10160.patch'
  'aarch64.patch'
  '10-odroid.rules'
  'kodi_permissions.conf'
)
sha256sums=(
  '7d82c8aff2715c83deecdf10c566e26105bec0473af530a1356d4c747ebdfd10'
  'b0fe75d10b2678894d1dec48f3258c0bec2a4a170f33d76a9a8334bb1969b18f'
  '870037ddedc09f161db16df8550e1b0eaaa67a8bdfe47e7151bc9ee25c9bfead'
  '85f8ec893cc8a4c01a2ea5eb0ecd36a282ad92c41240c82fafbd35bf55a66387'
  '5ddf80329c9f5d054525b45f788b3405d199bfc6cf5b08c543ad29766ec27f6e'
  '2d168cb204e2a44d2f7be750f952e4d36446b3b492194c8f0e4d289aad1ba47c'
)

prepare() {
  cd "$srcdir/xbmc-$pkgver-$_codename"

  # patches
  patch -p1 -i "$srcdir/9703.patch"
  patch -p1 -i "$srcdir/10160.patch"
  patch -p1 -i "$srcdir/aarch64.patch"

  find -type f -name *.py -exec sed 's|^#!.*python$|#!/usr/bin/python2|' -i "{}" +
  sed 's|^#!.*python$|#!/usr/bin/python2|' -i tools/depends/native/rpl-native/rpl
	sed 's/python/python2/' -i tools/Linux/kodi.sh.in
  sed 's/shell python/shell python2/' -i tools/EventClients/Makefile.in
}

build() {
  cd "$srcdir/xbmc-$pkgver-$_codename"
  CFLAGS="$CFLAGS"
  CXXFLAGS="$CFLAGS"
  LDFLAGS+=" -L/usr/lib/mali-egl -L/usr/lib/aml_libs"

  # Bootstrapping
  MAKEFLAGS=-j4 ./bootstrap

  #./configure --help
  #return 1

  # Configuring XBMC
  export PYTHON_VERSION=2  # external python v2
  ./configure --prefix=/usr --exec-prefix=/usr \
    --disable-debug \
    --enable-optimizations \
    --enable-libbluray \
    --enable-shared-libraries \
    --with-lirc-device=/run/lirc/lircd \
    --enable-codec=amcodec \
    --disable-texturepacker \
    --disable-vaapi \
    --disable-vdpau \
    ac_cv_type__Bool=yes

  # Now (finally) build
  make
}

package_kodi-c2-x11() {
  pkgdesc="A software media player and entertainment hub for digital media"

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
    'yajl' 'mesa' 'dcadec' 'desktop-file-utils' 'odroid-c2-libgl-x11' 'aml-libs-c2'
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
  provides=('xbmc' "kodi")
  conflicts=('xbmc' "kodi" "kodi-c2-fb")
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

  install -Dm0644 $srcdir/kodi_permissions.conf $pkgdir/etc/tmpfiles.d/kodi_permissions.conf
  install -Dm0644 $srcdir/10-odroid.rules $pkgdir/etc/udev/rules.d/10-odroid.rules
}

package_kodi-c2-x11-eventclients() {
  pkgdesc="Kodi Event Clients"
  provides=("kodi-eventclients")
  depends=('cwiid')

  cd "$srcdir/xbmc-$pkgver-$_codename"

  make DESTDIR="$pkgdir" eventclients WII_EXTRA_OPTS=-DCWIID_OLD
}

