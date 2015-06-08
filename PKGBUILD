# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: [vEX] <niechift.vex@gmail.com>
# Contributor: Zeqadious <zeqadious@gmail.com>
# Contributor: BlackIkeEagle <ike.devolder@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=kodi-devel
pkgver=14.0b1
pkgrel=1
pkgdesc='kodi Entertainment Center'
arch=('i686' 'x86_64')
url='http://xbmc.org'
license=('GPL2')
depends=('bluez-libs' 'curl' 'glew' 'hicolor-icon-theme' 'lame' 'libass'
         'libbluray' 'libcdio' 'libmad' 'libmariadbclient' 'libmicrohttpd'
         'libmodplug' 'libmpeg2' 'libpulse' 'libsamplerate' 'libssh' 'libva'
         'libvdpau' 'libxrandr' 'libxslt' 'lzo' 'mesa' 'python2-pillow'
         'rtmpdump' 'sdl_image' 'smbclient' 'taglib' 'tinyxml' 'xorg-xdpyinfo'
         'yajl')
makedepends=('afpfs-ng' 'boost' 'cmake' 'doxygen' 'git' 'gperf' 'jasper'
             'java-runtime' 'libcec' 'libnfs' 'libplist' 'nasm' 'shairplay'
             'swig' 'unzip' 'upower' 'zip')
optdepends=('afpfs-ng: Apple shares support'
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
            'xorg-xinit: kodi standalone')
replaces=('xbmc-devel')
provides=('xbmc')
conflicts=('xbmc')
install='kodi.install'
source=("kodi-$pkgver.tar.gz::https://github.com/xbmc/xbmc/archive/${pkgver}-Helix.tar.gz")
sha256sums=('49cc3a91fba54d2c06cc877dad51e3c1cada772c6cc129a558045ef281d6b3f2')

prepare() {
  cd xbmc-${pkgver}-Helix

  find -type f -name *.py -exec sed 's|^#!.*python$|#!/usr/bin/python2|' -i "{}" +
  sed 's|^#!.*python$|#!/usr/bin/python2|' -i tools/depends/native/rpl-native/rpl
  sed 's/python/python2/' -i tools/Linux/kodi.sh.in
}

build() {
  cd xbmc-${pkgver}-Helix

  export PYTHON_VERSION='2'

  ./bootstrap
  ./configure \
    --prefix='/usr' \
    --exec-prefix='/usr' \
    --disable-non-free \
    --disable-debug \
    --disable-static
  make
}

package() {
  cd xbmc-${pkgver}-Helix

  make DESTDIR="${pkgdir}" install
  install -m 755 tools/TexturePacker/TexturePacker "${pkgdir}"/usr/lib/xbmc/
}

# vim: ts=2 sw=2 et:
