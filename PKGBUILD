#! /bin/bash

# Maintainer:
# - Alberto Salvia Novella (tinyurl.com/contact-alberto)

# Contributors:
# - Bruno Pagani <archange@archlinux.org>
# - Cedric Girard <girard.cedric@gmail.com>
# - foxbunny <bg.branko@gmail.com>
# - Timothy Redaelli <timothy.redaelli@gmail.com>


pkgname="displaycal-git"
provides=("displaycal")
conflicts=("displaycal")

pkgdesc="Calibrates display color"
url="https://github.com/eoyilmaz/displaycal-py3"
license=("GPL-3.0-or-later")

pkgver=nightly.r174.gcc17894
pkgrel=1
arch=("x86_64")


makedepends=(
	git
	libxrandr
	libxxf86vm
	python-setuptools
)


depends=(
	argyllcms
	dbus
	dbus-python
	glib2
	python-certifi
	python-distro
	python-numpy
	python-pillow
	python-send2trash
	python-wxpython
	python-zeroconf
)


source=(
	"git+${url}.git"
)


sha256sums=(
	SKIP
)


pkgver () {
	cd "${srcdir}/displaycal-py3"
	
	git describe --long --tags --abbrev=7 |
	sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build () {
	cd "${srcdir}/displaycal-py3"
	python setup.py build
}


package () {
	PackageApp
	RemoveBuildFiles
}


PackageApp () {
	cd "${srcdir}/displaycal-py3"
	XDG_CONFIG_DIRS=/etc/xdg python setup.py install --root="${pkgdir}" --optimize=1
}


RemoveBuildFiles () {
	local SitePackages; SitePackages="$(SitePackages)"
	rm --recursive "${pkgdir}${SitePackages}/build"
}


SitePackages () {
	python -c "import site; print(site.getsitepackages()[0])"
}
