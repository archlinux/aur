pkgname=webdav-daemon
pkgver=v1.1.r1.bc88ec6
pkgver() {
	cd "WebDAV-Daemon"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}
pkgrel=1
pkgdesc="WebDAV server designed to be a replace for SMBA providing access to a system's files without taking ownership of them"
arch=(x86_64)
url="https://github.com/couling/WebDAV-Daemon"
license=('MIT')
depends=()
makedepends=('git')
backup=('etc/webdavd/conf.xml'
	'etc/logrotate.d/webdavd'
	'etc/pam.d/webdavd')
source=("git+https://github.com/couling/WebDAV-Daemon.git"
	build-fix.patch)
md5sums=('SKIP'
         'a2ef51c60c732ed1a152606e1157568a')

prepare() {
	cd "WebDAV-Daemon"
	patch -p1 -i "$srcdir/build-fix.patch"
}

build() {
	cd "WebDAV-Daemon"
	make
}

package() {
	cd "WebDAV-Daemon"
	install -dm0755 "$pkgdir/usr/share/webdavd"

	install -Dm0644 package-with/conf.xml "$pkgdir/etc/webdavd/conf.xml"
	install -Dm0644 package-with/logrotate.conf "$pkgdir/etc/logrotate.d/webdavd"
	install -Dm0644 package-with/pam.conf "$pkgdir/etc/pam.d/webdavd"
	install -Dm0644 package-with/systemd.service "$pkgdir/usr/lib/systemd/system/webdavd.service"
	install -m0644 package-with/share/* "$pkgdir/usr/share/webdavd/"

	install -Dm0644 useful/conf.xml "$pkgdir/etc/webdavd/conf.xml.example"

	install -Dm0755 build/rap "$pkgdir/usr/bin/rap"
	install -Dm0755 build/webdavd "$pkgdir/usr/bin/webdavd"
}
