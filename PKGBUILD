# Maintainer: Patrick Oppenlander <patrick.oppenlander@gmail.com>

# Download the cppcheck premium tarball from https://www.cppchecksolutions.com/
# and place it in the same directory as this file.
#
# TODO: missing man pages
#

pkgname=cppcheck-premium
pkgver=22.4.1
pkgrel=1
pkgdesc='Premium (nonfree) version of cppcheck'
conflicts=('cppcheck')
arch=('x86_64')
url='https://www.cppchecksolutions.com/'
license=('custom' 'GPL')
depends=('python-pygments')
source=("file:///cppcheckpremium-${pkgver}.tar.xz"
	'https://raw.githubusercontent.com/danmar/cppcheck/2.8/htmlreport/cppcheck-htmlreport'
	'cppcheck')
sha1sums=('02f1dc4f959dfd5da99aa3f6d79bc5c22fb6546b'
          'd21de261ba3dfa58ad732877b65635ec38d40dd7'
          'a1c60e8820d66096961c7666faeeefe6a04fc44b')

prepare() {
	# add shebang to register.py
	sed -i '1s%^%#!/usr/bin/env python3\n%' "${srcdir}"/cppcheckpremium-"${pkgver}"/register.py
}

package() {
	# cppcheck premium doesn't search /usr/{lib,share}/cppcheck for files
	# so we need to install to /opt maintaining directory layout. It also
	# fails to find its configuration files if it's called via symlink so
	# we need to put a small script in /usr/bin/ to help it out.
	mkdir -p "${pkgdir}"/opt/cppcheck-premium/
	cp -r "${srcdir}"/cppcheckpremium-"${pkgver}"/* "${pkgdir}"/opt/cppcheck-premium/
	install -Dt "${pkgdir}"/usr/bin/ "${srcdir}"/cppcheck "${srcdir}"/cppcheck-htmlreport
}
