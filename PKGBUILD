# Maintainer: Manuel Coenen <manuel dot coenen at gmail dot com>
_pkgbase=c2_gpio
pkgname=c2_gpio-dkms-git
pkgver=r62.2bc8b52
pkgrel=1
pkgdesc="Linux GPIO C2 Bus Master Implementation"
arch=('any')
url="https://github.com/dimhoff/si4010prog"
license=('GPL2')
depends=('dkms')
makedepends=('git'
'make'
'gcc')
provides=("${pkgname%-git}")
conflicts=("${_pkgbase}")
install=${pkgname}.install
source=("${pkgname}::git+git://github.com/dimhoff/si4010prog.git"
'dkms.conf'
)
md5sums=('SKIP'
         '76a06cf15c98143494aefa819533f959')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}/drivers/c2_gpio"
	make
}

package() {

	# Copy dkms.conf
	install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

	# Set name and version
	sed -e "s/@_PKGBASE@/${_pkgbase}/" \
		-e "s/@PKGVER@/${pkgver}/" \
		-i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

	# Copy sources (including Makefile)
	cd "$srcdir/${pkgname}/drivers/c2_gpio"
	cp -r * "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

	install -Dm644 99-c2_bus.rules "${pkgdir}"/usr/lib/udev/rules.d/99-c2_bus.rules
}
