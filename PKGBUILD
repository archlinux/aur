# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Arthur Borsboom <arthurborsboom@gmail.com>
# Contributor: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: DonVla <donvla@users.sourceforge.net>
# Contributor: Ulf Winkelvos <ulf [at] winkelvos [dot] de>
# Contributor: Ralf Barth <archlinux dot org at haggy dot org>
# Contributor: B & monty - Thanks for your hints :)
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: [vEX] <niechift.vex@gmail.com>
# Contributor: Zeqadious <zeqadious@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: dhead666 <myfoolishgames@gmail.com>
#
# Original credits go to Edgar Hucek <gimli at dark-green dot com>
# for his xbmc-vdpau-vdr PKGBUILD at https://archvdr.svn.sourceforge.net/svnroot/archvdr/trunk/archvdr/xbmc-vdpau-vdr/PKGBUILD

pkgbase=kodi-devel
pkgname=('kodi-devel' 'kodi-devel-eventclients')
pkgver=17.0b7
pkgdesc="Kodi Media Center monthly development releases"
_codename=Krypton
pkgrel=1
arch=('i686' 'x86_64')
url="http://xbmc.org"
license=('GPL' 'LGPL')
groups=('kodi-devel')

makedepends=(
  'afpfs-ng' 'bluez-libs' 'boost' 'cmake' 'curl' 'cwiid' 'doxygen' 'git' 'glew'
  'gperf' 'hicolor-icon-theme' 'jasper' 'java-runtime' 'lame'  'libaacs' 'libass'
  'libbluray' 'libcdio' 'libcrossguid-git' 'libcec' 'libgl' 'libmariadbclient' 'libmicrohttpd'
  'libmodplug' 'libmpeg2' 'libnfs' 'libplist' 'libpulse' 'libsamplerate' 'libssh'
  'libva' 'libvdpau' 'libxrandr' 'libxslt' 'nasm' 'python2-pillow'
  'python2-simplejson' 'rtmpdump' 'sdl2' 'shairplay' 'smbclient' 'swig' 'taglib'
  'tinyxml' 'unzip' 'upower' 'xorg-xdpyinfo' 'yajl' 'zip'
)

source=("https://github.com/xbmc/xbmc/archive/${pkgver}-${_codename}.tar.gz")
sha256sums=('1a96d8226cc4fd91cee997a55fc50bfafad46b40faa5ee1918dd174e05891606')

_prefix='/usr'

prepare() {
  msg "Starting make..."

  cd "${srcdir}/xbmc-${pkgver}-${_codename}"

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
  cd "${srcdir}/xbmc-${pkgver}-${_codename}"

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
  ./configure --prefix=${_prefix} --exec-prefix=${_prefix} \
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
  provides=('xbmc' 'kodi')
  conflicts=('xbmc' 'xbmc-pulse' 'xbmc-svn' 'xbmc-git-xvba' 'xbmc-git' 'kodi' 'kodi-git')
  install="${pkgname}.install"

  depends=(
    'bluez-libs' 'libcrossguid-git' 'curl' 'glew' 'hicolor-icon-theme' 'lame'
    'libaacs' 'libass' 'libbluray' 'libcdio' 'libmariadbclient' 'libmicrohttpd' 'libmodplug'
    'libmpeg2' 'libpulse' 'libsamplerate' 'libssh' 'libva' 'libvdpau'
    'libxrandr' 'libxslt' 'python2-pillow' 'python2-simplejson'
    'rtmpdump' 'sdl2' 'smbclient' 'taglib' 'tinyxml' 'xorg-xdpyinfo' 'yajl'
  )

  optdepends=(
    'gdb: for meaningful backtraces in case of trouble - STRONGLY RECOMMENDED'
    'afpfs-ng: Apple shares support'
    'bluez: Blutooth support'
    'kodi-devel-adsp-basic: Basic ADSP Processor addon for Kodi'
    'kodi-devel-adsp-freesurround: FreeSurround ADSP addon for Kodi'
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
    'kodi-devel-libcec: Pulse-Eight USB-CEC adapter support'
    'kodi-devel-pvr-argustv: ARGUS TV PVR client addon for Kodi'
    'kodi-devel-pvr-demo: Demo PVR addon for Kodi'
    'kodi-devel-pvr-dvblink: DVBLink PVR client addon for Kodi'
    'kodi-devel-pvr-dvbviewer: DVBViewer PVR client addon for Kodi'
    'kodi-devel-pvr-filmon: Filmon client PVR addon for Kodi'
    'kodi-devel-pvr-hdhomerun: HDHomeRun PVR addon for Kodi'
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
    'kodi-devel-screensaver-asteroids: Asteroids screensaver addon for Kodi'
    'kodi-devel-screensaver-biogenesis: BioGenesis screensaver addon for Kodi'
    'kodi-devel-screensaver-greynetic: Greynetic screensaver addon for Kodi'
    'kodi-devel-screensaver-matrixtrails: Matrix trails screensaver addon for Kodi'
    'kodi-devel-screensaver-pingpong: Ping-pong screensaver addon for Kodi'
    'kodi-devel-screensaver-pyro: Pyro screensaver addon for Kodi'
    'kodi-devel-screensavers-rsxs: RSXS screensavers addon for Kodi'
    'kodi-devel-screensaver-stars: Starfield screensaver addon for Kodi'
    'kodi-devel-visualization-fishbmc: Fische visualization addon for Kodi'
    'kodi-devel-visualization-goom: GOOM visualization addon for Kodi'
    'kodi-devel-visualization-projectm: ProjectM visualization addon for Kodi'
    'kodi-devel-visualization-shadertoy: Shadertoy visualization addon for Kodi'
    'kodi-devel-visualization-spectrum: Spectrum visualization addon for Kodi'
    'kodi-devel-visualization-vsxu: VSXu visualization addon for Kodi'
    'kodi-devel-visualization-waveform: Waveform visualization addon for Kodi'
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

  cd "${srcdir}/xbmc-${pkgver}-${_codename}"
  msg2 "Running make install"
  make DESTDIR="${pkgdir}" install

  # Tools
  msg2 "Tools"
  install -Dm755 "${srcdir}/xbmc-${pkgver}-${_codename}/tools/TexturePacker/TexturePacker" \
    "${pkgdir}${_prefix}/lib/kodi/"

  # Licenses
  msg2 "Copy licenses"
  install -dm755 "${pkgdir}${_prefix}/share/licenses/${pkgname}"
  for licensef in LICENSE.GPL copying.txt; do
    mv "${pkgdir}${_prefix}/share/doc/kodi/${licensef}" \
      "${pkgdir}${_prefix}/share/licenses/${pkgname}"
  done
}

package_kodi-devel-eventclients() {
  arch=('any')
  pkgdesc+=" Event Clients"
  depends=('cwiid')
  conflicts=('kodi-eventclients' 'kodi-eventclients-devel')
  replaces=('kodi-eventclients-devel')

  cd "${srcdir}/xbmc-${pkgver}-${_codename}"

  make DESTDIR="${pkgdir}" eventclients WII_EXTRA_OPTS=-DCWIID_OLD
}
