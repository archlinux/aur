# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: Francisco Demartino <demartino.francisco@gmail.com>

_pkgname=telegram-purple
pkgname=${_pkgname}-dev-git
pkgver=v1.3.0.r26.gf45ed45
pkgrel=1
pkgdesc="Adds support for Telegram to Pidgin, Adium, Finch and other Libpurple based messengers. (1.4.0 development branch)"
arch=('i686' 'x86_64')
url="https://github.com/majn/telegram-purple"
license=("GPL")
makedepends=("git" "vim")
depends=('glib2' 'libgcrypt' 'libpurple' 'zlib' 'libwebp')
conflict=('telegram-purple' 'telegram-purple-git')

source=("git+https://github.com/majn/telegram-purple#branch=dev-1.4.0")
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
