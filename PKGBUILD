pkgname=webdav-daemon
pkgver=v1.1.r1.bc88ec6
pkgver() {
	cd "WebDAV-Daemon"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}
pkgrel=2
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
	conf.xml
	webdavd.logrotate
	webdavd.pam
	webdavd.service
	build-fix.patch)
md5sums=('SKIP'
         'a9bfe1e242db185bfd8bc0acbde24610'
         '305484a532e6e9be0e491cec5457c047'
         'cce88995b96d78aebfbaa6cc865eb535'
         'dddf8fd7c52bd3807eb7d9b8daef02db'
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

	install -Dm0644 package-with/conf.xml "$pkgdir/etc/webdavd/conf.xml.documented"
	install -m0644 package-with/share/* "$pkgdir/usr/share/webdavd/"

	install -Dm0644 "$srcdir"/webdavd.logrotate "$pkgdir/etc/logrotate.d/webdavd"
	install -Dm0644 "$srcdir"/webdavd.pam "$pkgdir/etc/pam.d/webdavd"
	install -Dm0644 "$srcdir"/webdavd.service "$pkgdir/usr/lib/systemd/system/webdavd.service"
	install -Dm0644 "$srcdir"/conf.xml "$pkgdir/etc/webdavd/conf.xml"

	install -Dm0755 build/rap "$pkgdir/usr/bin/rap"
	install -Dm0755 build/webdavd "$pkgdir/usr/bin/webdavd"
}
