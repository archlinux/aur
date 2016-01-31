# Maintainer: Francisco Demartino <demartino.francisco@gmail.com>

_pkgname=telegram-purple
pkgname=${_pkgname}-git
pkgver=v1.2.5.r0.gdf29bbc
pkgrel=1
pkgdesc="Adds support for Telegram to Pidgin, Adium, Finch and other Libpurple based messengers."
arch=('i686' 'x86_64')
url="https://github.com/majn/telegram-purple"
license=("GPL")
makedepends=("git")
depends=('glib2' 'libgcrypt' 'libpurple' 'zlib' 'libwebp')
conflict=('telegram-purple')

source=("git+https://github.com/majn/telegram-purple")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	git submodule update --init --recursive
}

build() {
	cd "${srcdir}/${_pkgname}"

	./configure

	# keep this part synced with the Makefile
	PLUGIN_DIR_PURPLE=$(pkg-config --variable=plugindir purple)
	DATA_ROOT_DIR_PURPLE=$(pkg-config --variable=datarootdir purple)
	PIDGIN_PROTOCOLS_PIXMAPS_DIR=${DESTDIR}${DATA_ROOT_DIR_PURPLE}/pixmaps/pidgin/protocols
	mkdir -p ${DESTDIR}${PLUGIN_DIR_PURPLE}
	mkdir -p ${PIDGIN_PROTOCOLS_PIXMAPS_DIR}
	mkdir -p ${PIDGIN_PROTOCOLS_PIXMAPS_DIR}/{16,22,48}

	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="$pkgdir/" install
}
