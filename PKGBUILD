# Maintainer: David Herrmann <dh.herrmann@gmail.com>

pkgbase=kdbus
pkgname=('kdbus')
pkgver=4.2

_major=`expr $pkgver : '\([0-9]\+\)\.[0-9]\+'`
_minor=`expr $pkgver : '[0-9]\+\.\([0-9]\+\)'`
_nxver="${_major}.$((${_minor} + 1))"
_extramodules="extramodules-$pkgver-ARCH"

pkgrel=1
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/systemd/kdbus"
makedepends=('xmlto' 'docbook-xsl' 'libxslt' 'kmod' 'inetutils' 'bc' 'git'
             "linux-headers>=$pkgver" "linux-headers<$_nxver")
options=('debug' '!strip')
install=$pkgname.install
source=("git://github.com/systemd/kdbus.git#branch=v$pkgver"
        "$pkgname.install")
md5sums=('SKIP'
         '4d17737ff07a19d38c4fb5c07afb0d5d')

pkgver() {
  cd "$pkgname"

  #
  # You *MUST* set $pkgver to the kernel version you want to build kdbus for.
  # Upstream provides branches for all kernels since v4.0.
  #
  # As default, we set the version of the current stable arch kernel. However,
  # you can easily adjust this line here to your running kernel version.
  # You can also uncomment the small script to automatically adapt to your
  # *currently* running kernel.
  #
  # Please be aware that if you change the version, you *HAVE* to run:
  #     $ makepkg --nodeps --nobuild
  # ..to update $pkgver of the PKGBUILD correctly. If you don't do this, you
  # will get a dependency warning on 'linux-headers' as pkgver() is called
  # *after* checking $makedepends.
  #

  # fixed version:
  echo 4.2

  # current kernel:
  #echo `expr $(uname -r) : '\([0-9]\+\.[0-9]\+\)'`
}

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
