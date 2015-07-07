# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# Contributor: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: DonVla <donvla@users.sourceforge.net>
# Contributor: Ulf Winkelvos <ulf [at] winkelvos [dot] de>
# Contributor: Ralf Barth <archlinux dot org at haggy dot org>
# Contributor: B & monty - Thanks for your hints :)
#
# Original credits go to Edgar Hucek <gimli at dark-green dot com>
# for his xbmc-vdpau-vdr PKGBUILD at https://archvdr.svn.sourceforge.net/svnroot/archvdr/trunk/archvdr/xbmc-vdpau-vdr/PKGBUILD
#
# The PKGBUILD includes easy ways to:
#   1) build from specific commit (without having to clone the whole repository)
#   2) test new features by adding a list of Github's PR numbers

pkgbase=kodi-devel
pkgname=('kodi-devel' 'kodi-devel-eventclients')
_gitname=xbmc

# when building specific commit: 1) pkgver=commit_sha   2) _gitver=$pkgver
pkgver=15.0rc1
#_gitver=$pkgver
_gitver=$pkgver-Isengard

_pkgsrcname=$_gitname-$_gitver
pkgrel=1
arch=('i686' 'x86_64')
url="http://xbmc.org"
license=('GPL' 'LGPL')
groups=('kodi-devel')

makedepends=(
  'afpfs-ng' 'bluez-libs' 'boost' 'cmake' 'curl' 'cwiid' 'doxygen' 'git' 'glew'
  'gperf' 'hicolor-icon-theme' 'jasper' 'java-runtime' 'lame'  'libaacs' 'libass'
  'libbluray' 'libcdio' 'libcec' 'libgl' 'libmariadbclient' 'libmicrohttpd'
  'libmodplug' 'libmpeg2' 'libnfs' 'libplist' 'libpulse' 'libsamplerate' 'libssh'
  'libva' 'libvdpau' 'libvorbis' 'libxrandr' 'libxslt' 'lzo' 'mesa' 'nasm' 'python2-pillow'
  'python2-simplejson' 'rtmpdump' 'sdl2' 'shairplay' 'smbclient' 'swig' 'taglib'
  'tinyxml' 'unzip' 'upower' 'xorg-xdpyinfo' 'yajl' 'zip'
)

source=("https://github.com/xbmc/xbmc/archive/$_gitver.tar.gz")
sha256sums=(
  '8dc56816a7722d84a2ca13a47f599a8232f69d7c69f80da905a158598e1614a6')

_prefix='/usr'

prepare() {
  msg "Starting make..."

  cd "${srcdir}/$_pkgsrcname"

  # test new features by adding Github PR numbers, e.g. prlist=('6615')
  prlist=('')
  if [[ $prlist != '' ]]; then
    msg "Adding new features to test..."
   for pr in $prlist; do
      curl -o $srcdir/$pr.patch https://github.com/xbmc/xbmc/pull/$pr.patch
      patch -p1 -i $srcdir/$pr.patch
    done
  fi

  find -type f -name *.py -exec sed 's|^#!.*python$|#!/usr/bin/python2|' -i "{}" +
  sed 's|^#!.*python$|#!/usr/bin/python2|' -i tools/depends/native/rpl-native/rpl
  sed 's/python/python2/' -i tools/Linux/kodi.sh.in
  sed 's/shell python/shell python2/' -i tools/EventClients/Makefile.in
  # texturepacker cannot build statically
  sed '/--enable-static/d' -i tools/depends/native/TexturePacker/Makefile

  # disable wiiremote due to incompatibility with bluez-5.29
  sed '/WiiRemote/d' -i tools/EventClients/Makefile.in
  sed '/mkdir -p $(DESTDIR)$(bindir)/i \
install:' -i tools/EventClients/Makefile.in
}

build() {
  cd "${srcdir}/$_pkgsrcname"

  msg "Starting make..."

  # Configure Kodi
  #
  # Note on external-libs:
  #   - We cannot use external python because Arch's python was built with
  #     UCS2 unicode support, whereas kodi expects UCS4 support
  #   - According to an kodi dev using external/system ffmpeg with kodi is "pure stupid" :D

  msg2 "Bootstrapping Kodi"
  ./bootstrap

  #./configure --help
  #return 1

  msg2 "Configuring Kodi"
  export PYTHON_VERSION=2  # external python v2
  ./configure --prefix=$_prefix --exec-prefix=$_prefix \
    --disable-optimizations \
    --enable-avahi \
    --enable-libbluray \
    --with-lirc-device=/run/lirc/lircd \
    ac_cv_lib_bluetooth_hci_devid=no \
    ac_cv_type__Bool=yes

  # Now (finally) build
  make
}

package_kodi-devel() {
  pkgdesc="Kodi Media Center monthly development releases"
  provides=('xbmc' 'kodi')
  conflicts=('xbmc' 'xbmc-pulse' 'xbmc-svn' 'xbmc-git-xvba' 'xbmc-git' 'kodi' 'kodi-git')

  depends=(
    'bluez-libs' 'curl' 'glew' 'hicolor-icon-theme' 'lame' 'libaacs'
    'libass' 'libbluray' 'libcdio' 'libmariadbclient' 'libmicrohttpd' 'libmodplug'
    'libmpeg2' 'libpulse' 'libsamplerate' 'libssh' 'libva' 'libvdpau' 'libvorbis'
    'libxrandr' 'libxslt' 'lzo' 'mesa' 'python2-pillow' 'python2-simplejson'
    'rtmpdump' 'sdl2' 'smbclient' 'taglib' 'tinyxml' 'xorg-xdpyinfo' 'yajl'
  )

  optdepends=(
    'gdb: for meaningful backtraces in case of trouble - STRONGLY RECOMMENDED'
    'afpfs-ng: Apple shares support'
    'bluez: Blutooth support'
    'kodi-devel-audiodecoder-modplug: Modplug decoder addon for Kodi'
    'kodi-devel-audiodecoder-nosefart: Nosefart decoder addon for Kodi'
    'kodi-devel-audiodecoder-snesapu: SPC decoder addon for Kodi'
    'kodi-devel-audiodecoder-stsound: YM decoder addon for Kodi'
    'kodi-devel-audiodecoder-timidity: Timidity decoder addon for Kodi'
    'kodi-devel-audiodecoder-vgmstream: VGM decoder addon for Kodi'
    'kodi-devel-audioencoder-flac: Flac encoder addon for Kodi'
    'kodi-devel-audioencoder-lame: Lame MP3 encoder addon for Kodi'
    'kodi-devel-audioencoder-vorbis: Vorbis encoder addon for Kodi'
    'kodi-devel-audioencoder-wav: Wav encoder addon for Kodi'
    'kodi-devel-pvr-argustv: ARGUS TV PVR client addon for Kodi'
    'kodi-devel-pvr-demo: Demo PVR addon for Kodi'
    'kodi-devel-pvr-dvblink: DVBLink PVR client addon for Kodi'
    'kodi-devel-pvr-dvbviewer: DVBViewer PVR client addon for Kodi'
    'kodi-devel-pvr-filmon: Filmon client PVR addon for Kodi'
    'kodi-devel-pvr-hts: Tvheadend HTSP PVR client addon for Kodi'
    'kodi-devel-pvr-iptvsimple: IPTV Simple PVR client addon for Kodi'
    'kodi-devel-pvr-mediaportal-tvserver: MediaPortal PVR client addon for Kodi'
    'kodi-devel-pvr-mythtv: MythTV PVR client addon for Kodi'
    'kodi-devel-pvr-nextpvr: NextPVR PVR client addon for Kodi'
    'kodi-devel-pvr-njoy: Njoy N7 PVR client addon for Kodi'
    'kodi-devel-pvr-pctv: PCTV PVR client addon for Kodi'
    'kodi-devel-pvr-stalker: Stalker Middleware PVR client addon for Kodi'
    'kodi-devel-pvr-vbox: VBox TV Gateway PVR client addon for Kodi'
    'kodi-devel-pvr-vdr-vnsi: VDR VNSI PVR client addon for Kodi'
    'kodi-devel-pvr-vuplus: VuPlus PVR client addon for Kodi'
    'kodi-devel-pvr-wmc: Windows Media Center client PVR addon for Kodi'
    'libcec: Pulse-Eight USB-CEC adapter support'
    'libnfs: NFS shares support'
    'libplist: AirPlay support'
    'lirc: Remote controller support'
    'lsb-release: log distro information in crashlog'
    'pulseaudio: PulseAudio support'
    'shairplay: AirPlay support'
    'udisks: Automount external drives'
    'unrar: Archives support'
    'unzip: Archives support'
    'upower: Display battery level'
  )
  install="$pkgname.install"

  cd $_pkgsrcname
  msg2 "Running make install" 
  make DESTDIR="$pkgdir" install

  # Tools
  msg2 "Tools"
  install -Dm755 $srcdir/$_pkgsrcname/tools/TexturePacker/TexturePacker \
    ${pkgdir}${_prefix}/lib/kodi/

  # Licenses
  msg2 "Copy licenses"
  install -dm755 ${pkgdir}${_prefix}/share/licenses/${pkgname}
  for licensef in LICENSE.GPL copying.txt; do
    mv ${pkgdir}${_prefix}/share/doc/kodi/${licensef} \
      ${pkgdir}${_prefix}/share/licenses/${pkgname}
  done
}

package_kodi-devel-eventclients() {
  pkgdesc="Kodi Event Clients"
  depends=('cwiid')
  conflicts=('kodi-eventclients' 'kodi-eventclients-devel')
  replaces=('kodi-eventclients-devel')

  cd "$srcdir/$_pkgsrcname"

  make DESTDIR="$pkgdir" eventclients WII_EXTRA_OPTS=-DCWIID_OLD
}
