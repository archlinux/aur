# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com
# Contributor: Loren Copeland <thisisquitealongname at gm--l>

_name=jack2
pkgbase=jack2-git
pkgname=(jack2-git jack2-dbus-git)
pkgdesc="The JACK low-latency audio server"
pkgver=1.9.17.r85.g0daa887b
pkgrel=1
epoch=2
arch=(x86_64)
url="http://jackaudio.org/"
license=(GPL2 LGPL2.1)
groups=(pro-audio)
makedepends=(alsa-lib dbus expat git libffado libsamplerate opus systemd waf)
source=("${pkgbase}::git+https://github.com/jackaudio/${_name}#branch=develop")
md5sums=('SKIP')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

prepare() {
  cd "${pkgbase}"
  # remove custom waflib, as we are using system provided waf
  (
    touch __init__.py
    rm -rv waflib
  )
}

pkgver() {
  cd "${pkgbase}"
  # get commits since last unannotated tag
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g;'
}

build() {
  cd "${pkgbase}"
  export LINKFLAGS="$LDFLAGS"
  export PYTHONPATH="${PWD}:${PYTHONPATH}"
  waf configure --prefix=/usr \
                --autostart=none \
                --htmldir="/usr/share/doc/${pkgbase}/" \
                --systemd-unit \
                --classic \
                --example-tools=no \
                --dbus
  waf build
}

package_jack2-git() {
  depends=(db gcc-libs glibc opus libasound.so libdbus-1.so libsamplerate.so
  libsystemd.so)
  optdepends=('a2jmidid: for ALSA MIDI to JACK MIDI bridging'
              'libffado: for firewire support using FFADO'
              'jack-example-tools: for official JACK example-clients and tools'
              'jack2-dbus: for dbus integration'
              'realtime-privileges: for realtime privileges'
              'zita-alsa-pcmi: for using multiple ALSA devices'
              'zita-resampler: for using multiple ALSA devices')
  conflicts=(jack "${_name}")
  provides=(jack "${_name}" libjack.so libjacknet.so libjackserver.so
            "${_name}=${pkgver//.r*/}")

  cd "${pkgbase}"
  export PYTHONPATH="${PWD}:${PYTHONPATH}"
  waf install --destdir="${pkgdir}"

  (
    cd "$pkgdir"
    _pick jack2-dbus usr/bin/jack{dbus,_control}
    _pick jack2-dbus usr/share/dbus-1/
  )
}

package_jack2-dbus-git() {
  pkgdesc+=" (dbus integration)"
  depends=(dbus-python gcc-libs glibc jack2-git libdbus-1.so libexpat.so
  libjackserver.so)
  conflicts=(jack2-dbus)
  provides=(jack2-dbus)

  mv -v jack2-dbus/* "$pkgdir"
}
# vim:set ts=2 sw=2 et:
