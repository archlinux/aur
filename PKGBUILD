# Maintainer: João Miguel <jmcf125 at openmailbox dot org>
pkgname=apparmor-openrc
pkgver=20160204
pkgrel=1
pkgdesc="Apparmor init script for OpenRC (from systemd-free.org - not apg's way)"
arch=('any')
url="http://apparmor.net/"
license=('GPL2')
depends=('apparmor' 'openrc')
install='apparmor.install'
_filename='apparmor-init'
source=("https://gitweb.gentoo.org/repo/gentoo.git/plain/sys-apps/apparmor/files/$_filename")
sha256sums=('a920849a089dfb604dcb260fb66dfe3db70e9eb0b04349aeca6e8ce15d9c13e9')

pkgver() {
   date +%Y%m%d
}

_inst_initd(){
   install -Dm755 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1

   sed -e 's|#!/sbin/runscript|#!/usr/bin/openrc-run|' \
	 -e 's|/var/run|/run|g' \
	 -i "${pkgdir}/etc/init.d/$1"
   # ^^--- should work without this, but actually does not (at boot)
}

package() {
   mv "$_filename" -v apparmor.initd
   _inst_initd 'apparmor'
}
