# Maintainer: Janne Heß <jannehess@gmail.com>

# Contributor: JohnTheKipper <roteocktober@hotmail.com>

pkgname=bootchart2-git
pkgver=0.14.8.g4e8c247
pkgrel=2
pkgdesc='Boot Process Performance Visualization'
url='https://github.com/xrmx/bootchart'
license=('GPL')
provides=('bootchart2')
conflicts=('bootchart2' 'bootchart')
depends=('python2' 'busybox' 'pygtk')
backup=('etc/bootchartd2.conf')
source=("git://github.com/xrmx/${pkgname%2-git}")
sha256sums=('SKIP')
arch=('i686' 'x86_64')

pkgver() {
	cd "${srcdir}/${pkgname%2-git}"
	git describe --tags --always | sed 's/-[[:digit:]]*-/./g'
}

build() {
	cd "${srcdir}/${pkgname%2-git}"

	sed -i -e 's:sbin:usr/bin:g' \
		-e 's:/lib/systemd/system:/usr/lib/systemd/system:g' \
		-e 's:bootchartd $(DESTDIR)$(EARLY_PREFIX)/usr/:bootchartd $(DESTDIR)$(EARLY_PREFIX)/:g' \
		-e 's:SYSTEMD_UNIT_DIR = .*:SYSTEMD_UNIT_DIR = /usr/lib/systemd/system:g' \
		-e 's:/usr/share/docs:/usr/share/doc:g' Makefile
	sed -i -e 's:#!/usr/bin/python:#!/usr/bin/python2:g' pybootchartgui.py
	sed -i -e 's:sbin:bin:g' *.service.in 

	make PROGRAM_SUFFIX=2 PYTHON=python2 PY_LIBDIR=/usr/lib/python2.7 EARLY_PREFIX=/usr all
}

package() {
	cd "${srcdir}/${pkgname%2-git}"

	make PROGRAM_SUFFIX=2 DESTDIR="${pkgdir}" PYTHON=python2 PY_LIBDIR=/usr/lib/python2.7 EARLY_PREFIX=/usr install
}

