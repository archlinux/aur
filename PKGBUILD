# Maintainer: David Herrmann <dh.herrmann@gmail.com>

pkgbase=kdbus
pkgname=('kdbus')
pkgver=4.1
_nxver=4.2
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/systemd/kdbus"
makedepends=('xmlto' 'docbook-xsl' 'libxslt' 'kmod' 'inetutils' 'bc' 'git'
             "linux-headers>=$pkgver" "linux-headers<$_nxver")
options=('debug' '!strip')
install=$pkgname.install
source=("git://github.com/systemd/kdbus.git#branch=v$pkgver")
md5sums=('SKIP')

_extramodules="extramodules-$pkgver-ARCH"

prepare() {
  cd "$pkgname"

  # nothing to do?
}

build() {
  cd "$pkgname"

  make ${MAKEFLAGS} KERNELVER="$(cat /usr/lib/modules/$_extramodules/version)"
}

package_kdbus() {
  pkgdesc="kdbus ipc kernel module"
  license=('GPL2')
  depends=("linux>=$pkgver" "linux<$_nxver")

  cd "$pkgname"

  install -Dm644 "ipc/kdbus/kdbus.ko" "${pkgdir}/usr/lib/modules/${_extramodules}/kdbus.ko"

  cd $startdir
  cp -f $install ${install}.pkg
  true && install=${install}.pkg
  sed -i "s/EXTRAMODULES=.*/EXTRAMODULES=$_extramodules/" $install
}

# vim: ft=sh syn=sh et
