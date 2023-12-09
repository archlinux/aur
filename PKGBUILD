# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Stephan Conrad <stephan@conrad.pics>

# Also based on libmodsecurity Extra PKGBUILD by
#   Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=libmodsecurity-git
_name=modsecurity
pkgver=v3.0.11.r2.g3e7227b
pkgrel=1
pkgdesc='A cross platform web application firewall engine for Apache, IIS and Nginx, git HEAD'
arch=('i686' 'x86_64')
url='https://github.com/SpiderLabs/ModSecurity'
license=('APACHE')
depends=(
	'yajl'
	'curl'
	'lmdb'
	'libxml2'
	'pcre2'
	'geoip'
	'libmaxminddb'
	'ssdeep'
	'luajit'
	'glibc'
	'gcc-libs'
)
makedepends=('git')
provides=("libmodsecurity")
conflicts=("libmodsecurity")
source=("${_name}::git+$url"
        libxml-includes.patch)
sha256sums=('SKIP'
            '7ee0adbe5b164ca512c49e51e30ffd41e29244156a695e619dcf1d0387e69aef')

pkgver() {
	cd "${srcdir}/${_name}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_name}"
	git submodule init
	git submodule update
	sed -e 's/luajit-2.0/luajit-2.1/g' \
			-e 's/LUA_POSSIBLE_LIB_NAMES="/LUA_POSSIBLE_LIB_NAMES="luajit /g' \
			-i build/lua.m4
	patch -p1 -i ../libxml-includes.patch
}


build() {
	cd "${srcdir}/${_name}"
	./build.sh
	./configure \
		--prefix=/usr \
		--with-lmdb \
		--with-libxml \
		--with-lua \
		--with-pcre2 \
		--with-ssdeep \
		--disable-examples
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
}

package() {
	cd "${srcdir}/${_name}"
	make DESTDIR="$pkgdir" install
}
