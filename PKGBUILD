# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com
# Contributor: Loren Copeland <thisisquitealongname at gm--l> 

_name=jack2
pkgname=jack2-git
pkgdesc="C++ version of the JACK low-latency audio server for multi-processor machines"
pkgver=1.9.12.r178.g77de2e33
pkgrel=1
epoch=1
arch=('x86_64')
url="http://jackaudio.org/"
license=('GPL2' 'LGPL2.1')
groups=('pro-audio')
depends=('celt' 'opus' 'libsamplerate')
makedepends=('git' 'libffado' 'portaudio' 'waf')
optdepends=('a2jmidid: Expose legacy ALSA sequencer applications in JACK MIDI'
            'libffado: Firewire support'
            'portaudio: Portaudio support'
            'python-dbus: For jack_control'
            'realtime-privileges: Acquire realtime privileges')
provides=('jack' 'libjack.so' 'libjacknet.so' 'libjackserver.so')
conflicts=('jack' 'jack2')
replaces=('jack2-dbus-git')
source=("${pkgname}::git+https://github.com/jackaudio/${_name}")
md5sums=('SKIP')

prepare() {
  cd "${pkgname}"
  # copying relevant custom waf scripts and loading them specifically using
  # wscript
  (
    touch __init__.py
    mkdir -vp tools
    cp -v waflib/extras/xcode*.py tools
    mv -v autooptions/__init__.py tools/autooptions.py
    rm -rv waflib
    sed -e "s/load('xcode'/load('xcode', tooldir='tools'/g" \
        -e "s/load('xcode6'/load('xcode6', tooldir='tools'/g" \
        -e "s/load('autooptions'/load('autooptions', tooldir='tools'/g" \
        -i wscript

  )
}

pkgver() {
  cd "${pkgname}"
  # get commits since last unannotated tag
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g;'
}

build() {
  cd "${pkgname}"
  waf configure --prefix=/usr \
                --htmldir="/usr/share/doc/${pkgbase}/" \
                --classic \
                --dbus
  waf build
}

package() {
  cd "${pkgname}"
  waf install --destdir="$pkgdir"
}

# vim:set ts=2 sw=2 et:
