# Maintainer: Manuel Coenen <manuel dot coenen at gmail dot com>
_pkgbase=c2_gpio
pkgname=c2_gpio-dkms-git
pkgver=r74.f0cb27b
pkgrel=1
pkgdesc="Linux GPIO C2 Bus Master Implementation"
arch=('any')
url="https://github.com/dimhoff/si4010prog"
license=('GPL2')
depends=('dkms')
makedepends=('git'
	'make'
	'gcc')
provides=("${pkgname%-git}" "${_pkgbase}")
conflicts=("${pkgname%-git}" "${_pkgbase}")
install=${pkgname}.install
source=("${pkgname}::git+https://github.com/dimhoff/si4010prog.git"
	'dkms.conf'
	'fix_access_ok.patch'
)
sha256sums=('SKIP'
	'f9d452a074667b0368ec385ef3f1d9e55dc1091738fd339d19c25c8e4c34295a'
	'181899687cef635e136818480271e620bf775e0493b70a056ce9208bef8e65a6')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname}/drivers/c2_gpio"
	patch -p0 <"$srcdir/fix_access_ok.patch"
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
