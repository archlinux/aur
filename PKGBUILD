# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Stephan Conrad <stephan@conrad.pics>

pkgname=modsecurity
pkgver=3.0.7
pkgrel=1
pkgdesc='A cross platform web application firewall engine for Apache, IIS and Nginx'
arch=('i686' 'x86_64')
url='https://modsecurity.org/'
license=('APACHE')

depends=(
	'apache' 'apr-util' 'pcre'
	'libxml2' 'lua' 'curl' 'yajl'
)
provides=("${pkgname}=${pkgver}")

source=(
	"https://github.com/SpiderLabs/ModSecurity/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"{,.asc}
)
validpgpkeys=(
	'190EFACCA1E9FA466A8ECD9CE6DFB08CE8B11277' # Felipe Zimmerle
)
sha256sums=('b4231177dd80b4e076b228e57d498670113b69d445bab86db25f65346c24db22'
            'SKIP')

prepare() {
	# Create build directory
	mkdir -p "${srcdir}"/build

	cd "${srcdir}"/build
	cp -a "${srcdir}"/${pkgname}-v${pkgver}/* ./

	./build.sh
}

build() {
	# Build package
	cd "${srcdir}"/build

	./configure \
		--prefix=/usr \
		--enable-standalone-module \
		--enable-htaccess-config

	# Remove RPATH
	# https://tracker.debian.org/media/packages/m/modsecurity-apache/rules-2.9.1-2
	sed -ri 's|(hardcode_into_libs)=.*|\1=no|' libtool

	make
}

package() {
	# Install package
	cd "${srcdir}"/build
	make DESTDIR="${pkgdir}" install
}
