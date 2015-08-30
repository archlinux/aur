# Maintainer: Dan Schaper ( dschaper at ganymeade dot com)
# Contributor: ajs124 < aur AT ajs124 DOT de >

pkgname=rpimonitor-dev-git
_pkgbase=rpimonitor
pkgdesc="A self monitoring application designed to run on Raspberry Pi. Development 
branch."
arch=('armv6h' 'armv7h')
license=('GPL')
pkgver=2.10.r52.ga5e9f8a
pkgrel=1
depends=(rrdtool perl-http-daemon perl-json perl-ipc-sharelite perl-file-which)
makedepends=('git')
url=(https://github.com/XavierBerger/RPi-Monitor)
source=($pkgname::git://github.com/XavierBerger/RPi-Monitor.git#branch=devel)
sha512sums=('SKIP')
backup=(etc/${_pkgbase}/{data,daemon}.conf)
conflicts=('rpimonitor')
provides=('rpimonitor')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"/${_pkgbase}
  ln -sf ./template/arch.conf data.conf
  cat daemon.conf data.conf > rpimonitord.cf
  ../tools/conf2man.pl ./rpimonitord.cf ${pkgver} > rpimonitord.conf.5
  ../tools/help2man.pl ./rpimonitord ${pkgver} > rpimonitord.1
}

package() {
  cd ${pkgname}/${_pkgbase}
  install -Dm755 -t ${pkgdir}/usr/bin/ ${_pkgbase}d
  install -Dm644 -t ${pkgdir}/etc/$_pkgbase/ *.conf
  install -Dm644 -t ${pkgdir}/etc/$_pkgbase/template ./template/*
  install -Dm644 -t ${pkgdir}/usr/lib/systemd/system/ ../tools/systemd/*
  install -Dm644 -t ${pkgdir}/var/lib/rpimonitor/ updatestatus.txt
  install -Dm755 -t ${pkgdir}/usr/share/${_pkgbase}/scripts ../scripts/*.pl
  cp -a web ${pkgdir}/usr/share/${_pkgbase}/
  install -Dm644 -t ${pkgdir}/usr/share/man/man1 ${_pkgbase}d.1
  install -Dm644 -t ${pkgdir}/usr/share/man/man5 ${_pkgbase}d.conf.5

  # add files to backup array (Thanks to progandy for the tip)
  cd ${pkgdir}
  local __dir="etc/$_pkgbase/template"
  # prepend noop to hide it from mksrcinfo and prevent running in wrong context
  : && backup+=( "$__dir"/*.conf)
}

