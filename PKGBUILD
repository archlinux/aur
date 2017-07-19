# Maintainer: João Miguel <jmcf125 at openmailbox dot org>
pkgname=apparmor-openrc
pkgver=20170719
pkgrel=1
pkgdesc="Apparmor init script for OpenRC (from systemd-free.org - not apg's way)"
arch=('any')
url="http://apparmor.net/"
license=('GPL2')
depends=('apparmor' 'openrc')
_filename='apparmor-init'
source=("https://gitweb.gentoo.org/repo/gentoo.git/plain/sys-apps/apparmor/files/$_filename")
sha256sums=('f1c9ef2737012475f7fe7b943533b5d9345df1814a16a5c8d1929d835482f802')

pkgver() {
   date +%Y%m%d
}

_inst_initd(){
   install -Dm755 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1

   #        vv--- should work without this, but actually does not (at boot)
   sed -e 's|#!/sbin/runscript|#!/usr/bin/openrc-run|' \
         -e 's|/var/run|/run|g' \
         -e 's|libexec|lib/apparmor|' \
         -i "${pkgdir}/etc/init.d/$1"
   # /usr/libexec/rc.apparmor.functions is needed: /usr/libexec used to be a
   # link created by some apparmor package, but not anymore (see:
   # https://wiki.archlinux.org/index.php/Arch_packaging_standards#Package_etiquette)
}

package() {
   mv "$_filename" -v apparmor.initd
   _inst_initd 'apparmor'
}
