# Contributor: SanskritFritz (gmail)

pkgname=timekpr
pkgver=0.3.2
pkgrel=11
pkgdesc="Control the computer usage of your user accounts. You can limit their daily usage based on a timed access duration and configure periods of day when they can log in."
arch=('i686' 'x86_64')
url=https://launchpad.net/timekpr
license=('GPL')
depends=('python2')
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/${pkgname}_${pkgver}~ppa1~ubuntu2.tar.gz
	timekpr.service
	Initializes_lastNotified_before_it_is_used.patch)
backup=('etc/timekpr.conf')
install='timekpr.install'
md5sums=('0626ee6b6b6d218dfdd6e79331f789a2'
         '9e88ee02b5b8cb6b5e0730e3847c4217'
         '23848ef2578571d7dc4871fbd15f41ed')

build() {
	cd "$srcdir"/stable/gui/client
	# https://bugs.launchpad.net/timekpr/+bug/761647
	patch -p1 < "$srcdir"/Initializes_lastNotified_before_it_is_used.patch
}

package() {
	install -dm755 "$pkgdir"/etc/{rc.d,timekpr,logrotate.d,xdg/autostart}
	install -dm755 "$pkgdir"/usr/{bin,share/{doc/timekpr,timekpr,python-support/timekpr,pixmaps,applications,man/man8}}
	install -dm755 "$pkgdir"/usr/share/locale/{da,de,fr,hu,nb,sv,fi}/LC_MESSAGES
	install -dm755 "$pkgdir"/var/lib/timekpr

	cd "$srcdir"/stable
	install -m644 etc/timekpr.conf "$pkgdir"/etc/
	install -m644 etc/logrotate.d/timekpr "$pkgdir"/etc/logrotate.d/
	sed -i "s/python/python2/" timekpr
	install -m755 timekpr "$pkgdir"/usr/bin/
	sed -i "s/python/python2/" timekpr-gui
	install -m755 timekpr-gui "$pkgdir"/usr/bin/
	sed -i "s/python/python2/" timekpr-client
	install -m755 timekpr-client "$pkgdir"/usr/bin/
	install -m755 timekprpam.py "$pkgdir"/usr/share/python-support/timekpr/
	install -m755 timekpr.py "$pkgdir"/usr/share/python-support/timekpr/
	install -m755 timekpr-gui.py "$pkgdir"/usr/share/python-support/timekpr/
	install -m755 gui/client/timekpr-client.py "$pkgdir"/usr/share/python-support/timekpr/
	install -m755 timekprpam.py "$pkgdir"/usr/share/python-support/timekpr/
	install -m755 timekprcommon.py "$pkgdir"/usr/share/python-support/timekpr/
	install -m644 gui/padlock-green.png "$pkgdir"/usr/share/timekpr/
	install -m644 gui/padlock-red.png "$pkgdir"/usr/share/timekpr/
	install -m644 gui/timekpr.glade "$pkgdir"/usr/share/timekpr/
	install -m644 gui/timekpr100x100.png "$pkgdir"/usr/share/timekpr/
	install -m644 gui/timekpr32x32.png "$pkgdir"/usr/share/timekpr/
	install -m644 gui/timekpr.xpm "$pkgdir"/usr/share/pixmaps/
	install -m644 debian/timekpr.desktop "$pkgdir"/usr/share/applications/
	install -m644 debian/timekpr-client.desktop "$pkgdir"/etc/xdg/autostart
	install -m644 locale/da/LC_MESSAGES/timekpr.mo "$pkgdir"/usr/share/locale/da/LC_MESSAGES/
	install -m644 locale/de/LC_MESSAGES/timekpr.mo "$pkgdir"/usr/share/locale/de/LC_MESSAGES/
	install -m644 locale/fr/LC_MESSAGES/timekpr.mo "$pkgdir"/usr/share/locale/fr/LC_MESSAGES/
	install -m644 locale/hu/LC_MESSAGES/timekpr.mo "$pkgdir"/usr/share/locale/hu/LC_MESSAGES/
	install -m644 locale/nb/LC_MESSAGES/timekpr.mo "$pkgdir"/usr/share/locale/nb/LC_MESSAGES/
	install -m644 locale/sv/LC_MESSAGES/timekpr.mo "$pkgdir"/usr/share/locale/sv/LC_MESSAGES/
	install -m644 locale/fi/LC_MESSAGES/timekpr.mo "$pkgdir"/usr/share/locale/fi/LC_MESSAGES/
	install -m644 TODO.txt "$pkgdir"/usr/share/doc/timekpr
	install -m644 README.txt "$pkgdir"/usr/share/doc/timekpr
	install -m644 COPYRIGHT.txt "$pkgdir"/usr/share/doc/timekpr
	install -m644 CONTRIBUTORS.txt "$pkgdir"/usr/share/doc/timekpr
	install -m644 debian/changelog "$pkgdir"/usr/share/doc/timekpr
	install -m644 doc/timekpr.8 "$pkgdir"/usr/share/man/man8

	install -m755 debian/timekpr.postrm "$pkgdir"/usr/bin/
	install -m755 debian/timekpr.postinst "$pkgdir"/usr/bin/

	install -Dm0644 "$srcdir"/timekpr.service "$pkgdir"/usr/lib/systemd/system/timekpr.service
}
