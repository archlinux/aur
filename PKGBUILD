# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com
# Contributor: Loren Copeland <thisisquitealongname at gm--l>

_name=jack2
pkgbase=jack2-git
pkgname=('jack2-git' 'jack2-dbus-git')
pkgdesc="The JACK low-latency audio server"
pkgver=1.9.17.r1.ge984aeb2
pkgrel=1
epoch=1
arch=('x86_64')
url="http://jackaudio.org/"
license=('GPL2' 'LGPL2.1')
groups=('pro-audio')
makedepends=('alsa-lib' 'celt' 'dbus' 'expat' 'git' 'libffado' 'libsamplerate'
'libsndfile' 'readline' 'systemd' 'waf')
depends=('db' 'expat' 'opus')
source=("${pkgbase}::git+https://github.com/jackaudio/${_name}#branch=master")
md5sums=('SKIP')

prepare() {
  cd "${pkgbase}"
  # copying relevant custom waf scripts and loading them specifically using
  # wscript
  (
    touch __init__.py
    mkdir -vp tools
    cp -v waflib/extras/xcode*.py tools
    rm -rv waflib
    sed -e "s/load('xcode'/load('xcode', tooldir='tools'/g" \
        -e "s/load('xcode6'/load('xcode6', tooldir='tools'/g" \
        -i wscript
  )
}

pkgver() {
  cd "${pkgbase}"
  # get commits since last unannotated tag
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g;'
}

build() {
  cd "${pkgbase}"
  export PYTHONPATH="${PWD}:${PYTHONPATH}"
  waf configure --prefix=/usr \
                --htmldir="/usr/share/doc/${pkgbase}/" \
                --systemd-unit \
                --classic \
                --dbus
  waf build
}

package_jack2-git() {
  depends=('db' 'gcc-libs' 'glibc' 'opus' 'libasound.so' 'libcelt0.so'
  'libdbus-1.so' 'libreadline.so' 'libsamplerate.so' 'libsndfile.so'
  'libsystemd.so')
  optdepends=('a2jmidid: for ALSA MIDI to JACK MIDI bridging'
              'libffado: for firewire support using FFADO'
              'jack2-dbus: for dbus integration'
              'realtime-privileges: for realtime privileges'
              'zita-ajbridge: for using multiple ALSA devices')
  provides=('jack' "${_name}" 'libjack.so' 'libjacknet.so' 'libjackserver.so')
  conflicts=('jack' "${_name}")
  provides=('jack' "${_name}" 'libjack.so' 'libjacknet.so' 'libjackserver.so')

  cd "${pkgbase}"
  export PYTHONPATH="${PWD}:${PYTHONPATH}"
  waf install --destdir="${pkgdir}"
  rm -rfv "${pkgdir}/usr/bin/jack"{dbus,_control} "${pkgdir}/usr/share/dbus-1/"
}

package_jack2-dbus-git() {
  local _names=( 'alias' 'bufsize' 'connect' 'cpu' 'cpu_load' 'disconnect'
  'evmon' 'freewheel' 'iodelay' 'latent_client' 'load' 'lsp' 'metro'
  'midi_dump' 'midi_latency_test' 'midiseq' 'midisine' 'monitor_client'
  'multiple_metro' 'net_master' 'net_slave' 'netsource' 'property' 'rec'
  'samplerate' 'server_control' 'session_notify' 'showtime' 'simdtests'
  'simple_client' 'simple_session_client' 'test' 'thru' 'transport' 'unload'
  'wait' 'zombie')

  pkgdesc+=" (dbus integration)"
  depends=('gcc-libs' 'glibc' 'jack2' 'libdbus-1.so' 'libexpat.so'
  'libjackserver.so' 'python-dbus')
  conflicts=('jack2-dbus')
  provides=('jack2-dbus')

  cd "${pkgbase}"
  export PYTHONPATH="${PWD}:${PYTHONPATH}"
  waf install --destdir="${pkgdir}"
  rm -rfv "${pkgdir}/etc/" "${pkgdir}/usr/include/" "${pkgdir}/usr/lib/" \
    "${pkgdir}/usr/share/man/" "${pkgdir}/usr/bin/alsa"* "${pkgdir}/usr/bin/jackd"
  for _name in "${_names[@]}"; do
    rm -v "${pkgdir}/usr/bin/jack_${_name}"
  done
}
# vim:set ts=2 sw=2 et:
