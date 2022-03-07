# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: lucke <lucke at o2 dot pl>
# Contributor:  dacoit <dacoit at tuta.io>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Dmitry Korzhevin <dkorzhevin AT gmail DOT com>
# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>
# Contributor: tigrmesh <tigrmesh at aol dot com>
# Contributor: Tim Zebulla <amon at faumrahrer dot de>

pkgname=weechat-git
pkgver=3.4.r93.gf81a0dc4d
pkgrel=1
pkgdesc='Fast, light and extensible IRC client (curses UI). Development version.'
arch=(i686 x86_64 armv7h aarch64)
url=https://weechat.org
license=(GPL)
depends=(gnutls curl libgcrypt)
makedepends=(asciidoctor cmake aspell guile lua perl python ruby tcl git)
optdepends=('aspell: spellchecker support'
	        'guile: support for guile scripts'
	        'lua: support for lua scripts'
	        'perl: support for perl scripts'
	        'python: support for python scripts'
	        'ruby: support for ruby scripts'
	        'tcl: support for tcl scripts')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")

source=("git+https://github.com/${pkgname%-git}/${pkgname%-git}.git")
sha512sums=('SKIP')

pkgver() {
	git -C ${pkgname%-git} describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-rc/rc/g;s/-/./g'
}

# cmake does not correctly handle CPPFLAGS, so kludge it in anyway:
# https://gitlab.kitware.com/cmake/cmake/-/issues/12928
CFLAGS+=" ${CPPFLAGS}"

build() {
	cmake -B build -S "${pkgname%-git}" -Wno-dev \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DENABLE_MAN=ON \
		-DENABLE_DOC=ON \
		-DENABLE_JAVASCRIPT=OFF \
		-DENABLE_PHP=OFF
	make -C build
}

package() {
	make -C build DESTDIR="${pkgdir}" install
}
