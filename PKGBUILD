
# Maintainer: lisuke <1657787678@qq.com>
pkgname=miredo-debian
pkgver=1.2.6
pkgrel=2

pkgdesc="miredo, miredo.deb, only support armv7h"
arch=('armv7h')
conflicts=('miredo')
url="https://packages.debian.org/jessie/miredo"
license=('unknown')
options=('!strip')
depends=('libjudydebian1' 'iproute2' 'libcap')
makedepends=('tar')
checkdepends=('supervisor')

source=(
	"http://ftp.cn.debian.org/debian/pool/main/m/miredo/miredo_${pkgver}-2_armhf.deb"
	"miredo.service"
	"50-miredo.conf"
	"restart_miredo"
	"miredo.ini"
		)
noextract=()
md5sums=(
	'4680e1bf2fa322d442be326f94490114'
	"eccff5befe0e71875c3429e71b81bcda"
	"44fad4f428c85b64a9c46c93ec76079f"
	"213905764b73be9203724d19a78792cf"
	"59717fe16bde9cb80669bf477d7aa0c3"
		)
validpgpkeys=()

package() {
	cd ${srcdir}
	ar vx miredo_${pkgver}-2_armhf.deb || return 1
    
    tar fx data.tar.xz || return 1
	
#/etc
	install -D -m644 etc/miredo.conf ${pkgdir}/etc/miredo.conf || return 1
	install -D -m644 etc/default/miredo ${pkgdir}/etc/default/miredo || return 1
	install -D -m755 etc/init.d/miredo ${pkgdir}/etc/init.d/miredo || return 1
	install -D -m755 etc/miredo/client-hook ${pkgdir}/etc/miredo/client-hook || return 1
	install -D -m644 etc/miredo/miredo.conf ${pkgdir}/etc/miredo/miredo.conf || return 1
	install -D -m755 etc/network/if-up.d/miredo ${pkgdir}/etc/network/if-up.d/miredo || return 1
	install -D -m644 50-miredo.conf ${pkgdir}/etc/sysctl.d/50-miredo.conf || return 1
	install -D -m644 miredo.ini ${pkgdir}/etc/supervisor.d/miredo.ini || return 1
	install -D -m755 restart_miredo ${pkgdir}/etc/miredo/restart_miredo || return 1
	
#/usr
	##lib
	install -D -m644 lib/systemd/system/miredo.service ${pkgdir}/usr/lib/systemd/system/miredo.service || return 1
	
	##bin
	install -D -m755 usr/bin/teredo-mire ${pkgdir}/usr/bin/teredo-mire || return 1
	install -D -m755 usr/lib/arm-linux-gnueabihf/miredo/miredo-privproc ${pkgdir}/usr/lib/arm-linux-gnueabihf/miredo/miredo-privproc || return 1
	install -D -m755 usr/sbin/miredo ${pkgdir}/usr/bin/miredo || return 1
	install -D -m755 usr/sbin/miredo-checkconf ${pkgdir}/usr/bin/miredo-checkconf || return 1

	##systemd
	install -D -m644 miredo.service ${pkgdir}/usr/lib/systemd/system/miredo.service || return 1
	
	##doc
	install -D -m644 usr/share/doc/miredo/AUTHORS ${pkgdir}/usr/share/doc/miredo/AUTHORS || return 1
	install -D -m644 usr/share/doc/miredo/changelog.Debian.gz ${pkgdir}/usr/share/doc/miredo/changelog.Debian.gz || return 1
	install -D -m644 usr/share/doc/miredo/changelog.gz ${pkgdir}/usr/share/doc/miredo/changelog.gz || return 1
	install -D -m644 usr/share/doc/miredo/copyright ${pkgdir}/usr/share/doc/miredo/copyright || return 1
	install -D -m644 usr/share/doc/miredo/NEWS.gz ${pkgdir}/usr/share/doc/miredo/NEWS.gz || return 1
	install -D -m644 usr/share/doc/miredo/README.gz ${pkgdir}/usr/share/doc/miredo/README.gz || return 1
	install -D -m644 usr/share/doc/miredo/THANKS ${pkgdir}/usr/share/doc/miredo/THANKS || return 1
	install -D -m644 usr/share/doc/miredo/TODO ${pkgdir}/usr/share/doc/miredo/TODO || return 1
	install -D -m644 usr/share/doc/miredo/examples/miredo.conf ${pkgdir}/usr/share/doc/miredo/examples/miredo.conf || return 1
	
	##i18n
	install -D -m644 usr/share/locale/en/LC_MESSAGES/miredo.mo ${pkgdir}/usr/share/locale/en/LC_MESSAGES/miredo.mo || return 1
	install -D -m644 usr/share/locale/en_GB/LC_MESSAGES/miredo.mo ${pkgdir}/usr/share/locale/en_GB/LC_MESSAGES/miredo.mo || return 1
	install -D -m644 usr/share/locale/fr/LC_MESSAGES/miredo.mo ${pkgdir}/usr/share/locale/fr/LC_MESSAGES/miredo.mo || return 1
	install -D -m644 usr/share/locale/zh_CN/LC_MESSAGES/miredo.mo ${pkgdir}/usr/share/locale/zh_CN/LC_MESSAGES/miredo.mo || return 1

	##supervisor log
	touch empty_file || return 1
	install -D -m644 empty_file ${pkgdir}/var/log/supervisor/miredo_stdout.log || return 1
	
}
