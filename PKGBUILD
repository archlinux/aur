# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Stephan Conrad <stephan@conrad.pics>

pkgname=modsecurity
pkgver=2.9.1
pkgrel=1
pkgdesc='A cross platform web application firewall engine for Apache, IIS and Nginx'
arch=('i686' 'x86_64')
url='https://modsecurity.org/'
license=('APACHE')

depends=(
	'apache' 'apr-util' 'pcre'
	'libxml2' 'lua51' 'curl' 'yajl'
)
provides=("${pkgname}=${pkgver}")

source=(
	"https://github.com/SpiderLabs/ModSecurity/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc}
)
validpgpkeys=(
	'190EFACCA1E9FA466A8ECD9CE6DFB08CE8B11277' # Felipe Zimmerle
)
sha256sums=(
	'958cc5a7a7430f93fac0fd6f8b9aa92fc1801efce0cda797d6029d44080a9b24'
	'SKIP' # GPG signature
)

prepare() {
	# Create build directory
	mkdir -p "${srcdir}"/build

	cd "${srcdir}"/build
	cp -a "${srcdir}"/${pkgname}-${pkgver}/* ./
	./autogen.sh
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
