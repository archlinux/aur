# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Stephan Conrad <stephan@conrad.pics>

pkgname=modsecurity
pkgver=3.0.10
pkgrel=1
pkgdesc='A cross platform web application firewall engine for Apache, IIS and Nginx'
arch=('i686' 'x86_64')
url='https://github.com/SpiderLabs/ModSecurity'
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
	'F126692E9BA86B3958E73ED2F2FC4E45883BCBA4' # Martin Vierula (GitHub key)
)
sha256sums=('d5d459f7c2e57a69a405f3222d8e285de419a594b0ea8829058709962227ead0'
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
