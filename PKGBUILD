# Maintainer: Janne Heß <jannehess@gmail.com>

# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=bootchart2
pkgver=0.14.9
pkgrel=1
pkgdesc='Boot Process Performance Visualization'
url='https://github.com/xrmx/bootchart'
license=('GPL')
conflicts=('bootchart')
depends=('python' 'busybox')
backup=('etc/bootchartd2.conf')
source=("https://github.com/xrmx/${pkgname%2}/archive/${pkgver}.tar.gz")
sha512sums=('7ee1220b0add027fc39f710cc01119d7aaa22fe11736497b089c26955216cef10552216ed29ca55bf08aa848f92bb11d74deeb3aa69769dfecf3a55aa988e58b')
arch=('i686' 'x86_64')

build() {
	cd "${srcdir}/${pkgname%2}-${pkgver}"

	sed -i -e 's:sbin:usr/bin:g' \
		-e 's:/lib/systemd/system:/usr/lib/systemd/system:g' \
		-e 's:bootchartd $(DESTDIR)$(EARLY_PREFIX)/usr/:bootchartd $(DESTDIR)$(EARLY_PREFIX)/:g' \
		-e 's:SYSTEMD_UNIT_DIR = .*:SYSTEMD_UNIT_DIR = /usr/lib/systemd/system:g' \
		-e 's:/usr/share/docs:/usr/share/doc:g' Makefile
	sed -i -e 's:sbin:bin:g' *.service.in 

	make PROGRAM_SUFFIX=2 EARLY_PREFIX=/usr all
}

package() {
	cd "${srcdir}/${pkgname%2}-${pkgver}"

	make PROGRAM_SUFFIX=2 DESTDIR="${pkgdir}" EARLY_PREFIX=/usr install
}

