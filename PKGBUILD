# Mantainer: 3ED <krzysztof1987 at gmail>
# Contributor: adlerweb <get on aur>

# 2017-04-30 facts:
# - plugins works only with 1.16 version
# - python plugins works only with gtk2 version
# more info:
# https://github.com/yselkowitz/pluma-plugins/issues/6

_pkgname=pluma-plugins
pkgname=${_pkgname}
pkgver=1.16.0
_cygrel=1
epoch=1
pkgrel=1
pkgdesc="extra plugins for pluma text editor"
arch=('i686' 'x86_64')
url="http://mate-desktop.org/"
license=('GPL')
depends=('pluma-1.16<=1.16.9999' 'mate-common')
conflicts=("${_pkgname}-gtk2")
source=("http://cygwin.cathedral-networks.org/x86/release/${_pkgname}/${_pkgname}-${pkgver}-${_cygrel}-src.tar.xz")
noextract=("${_pkgname}-${pkgver}-${_cygrel}-src.tar.xz")
sha256sums=('e4ae4684c074cae81b9f05cc2ea034195e3a1dadff64f2efcb7c362d780a8a1d')

# gtk2 uncomment:
#pkgname=${_pkgname}-gtk2
#depends=('pluma-gtk2<=1.16.9999' 'mate-common')
#conflicts=("${_pkgname}")

prepare() {
	msg2 'Extracting archive...'
	bsdtar \
		--extract \
		--xz \
		--file "${_pkgname}-${pkgver}-${_cygrel}-src.tar.xz" \
		--include '^pluma-plugins-*.src/pluma-plugins-*.tar.gz$' \
		--to-stdout \
	| bsdtar \
		--extract \
		--gzip \
		--file -

	msg2 'Autogen the configuration tool...'
	cd "${_pkgname}-${pkgver}"
	PYTHON=/usr/bin/python2 ./autogen.sh \
		--prefix="/usr" \
		--sbindir="/usr/bin" \
		--libexecdir="/usr/lib/${_pkgname}" \
		--with-plugins=all \
		--enable-python
}

build() {
	cd "${_pkgname}-${pkgver}"
	make
}

package() {
	cd "${_pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
