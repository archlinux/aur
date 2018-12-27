# Maintainer: João Miguel <jmcf125 at gmail dot com>
pkgname=bluetooth-openrc
pkgver=20181227
pkgrel=1
pkgdesc="Bluetooth init script for OpenRC (from systemd-free.org - not apg's way)"
arch=('any')
url="http://apparmor.net/"
license=('GPL2')
depends=('bluez-utils' 'openrc')
_filename='bluetooth-init.d-r4'
source=("https://gitweb.gentoo.org/repo/gentoo.git/plain/net-wireless/bluez/files/bluetooth-init.d-r4")
sha256sums=('7fef67f1f0965aa08fd65408d2cd8c3fcefaec0ef627a2a0e1f1372c15e011b2')

pkgver() {
   date +%Y%m%d
}

_inst_initd(){
   install -Dm755 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1

   #        vv--- should work without this, but actually does not (at boot)
   sed -e 's|#!/sbin/runscript|#!/usr/bin/openrc-run|' \
         -e 's|/var/run|/run|g' \
         -e 's|libexec|lib|' \
         -i "${pkgdir}/etc/init.d/$1"
   # /usr/libexec/rc.apparmor.functions is needed: /usr/libexec used to be a
   # link created by some apparmor package, but not anymore (see:
   # https://wiki.archlinux.org/index.php/Arch_packaging_standards#Package_etiquette)
}

package() {
   mv "$_filename" -v bluetooth.initd
   _inst_initd 'bluetooth'
}
