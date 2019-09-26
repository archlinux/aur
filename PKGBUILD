# Maintainer: Janne Heß <jannehess@gmail.com>

# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=bootchart2
pkgver=0.14.8
pkgrel=3
pkgdesc='Boot Process Performance Visualization'
url='https://github.com/xrmx/bootchart'
license=('GPL')
provides=('bootchart2')
conflicts=('bootchart2-git' 'bootchart')
depends=('python2' 'busybox' 'pygtk')
backup=('etc/bootchartd2.conf')
source=("https://github.com/xrmx/${pkgname%2}/archive/${pkgver}.tar.gz"
        "0001-include-sys-sysmacros.h-for-major-minor-makedev.patch")
sha512sums=('58303db91d22ccc44c0dc765e7a6672fb277840555fd87ce64b8987cba85250cfe3db17f3ec7e0e1e726ad59166a5d3d01a7a262c07b5690c595877b46c66bd0'
            '3fd04183634f4406aab6fff5e77aaeb339f0705aeba2d193ad55fa297dbd9739e872f26c6feb225ff0b2cf953370e08bc82fa3bae69fac3832feaa4671cc406c')
arch=('i686' 'x86_64')

prepare() {
	cd "${srcdir}/${pkgname%2}-${pkgver}"

	patch -Np1 < ../0001-include-sys-sysmacros.h-for-major-minor-makedev.patch
}

build() {
	cd "${srcdir}/${pkgname%2}-${pkgver}"

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
	cd "${srcdir}/${pkgname%2}-${pkgver}"

	make PROGRAM_SUFFIX=2 DESTDIR="${pkgdir}" PYTHON=python2 PY_LIBDIR=/usr/lib/python2.7 EARLY_PREFIX=/usr install
}

