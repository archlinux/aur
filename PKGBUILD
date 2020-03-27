# Maintainer: Aun-Ali Zaidi <admin@kodeit.net>

_pkgbase=('apple-bce')
pkgname=(${_pkgbase}-git ${_pkgbase}-dkms-git)
pkgdesc="Apple BCE (Buffer Copy Engine) driver for T2-based devices."
pkgver=r183.c884d9c
pkgrel=10

arch=('x86_64')
url="https://github.com/MCMrARM/mbp2018-bridge-drv"
license=('GPL2')

depends=('linux')
makedepends=('git' 'linux-headers')
options=(!strip)

source=("apple-bce::git+https://github.com/aunali1/mbp2018-bridge-drv.git#branch=aur"
	"dkms.conf.in")

sha256sums=('SKIP'
            '06c389cbfb9e771397c962a782e7217a56be85ac4eee652d927e1e0f63a78ed6')

pkgver() {
	cd "$_pkgbase"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	# Set name and version
	sed -e "s/@PKGVER@/$pkgver/" \
	    -e "s/@_PKGBASE@/$_pkgbase/" dkms.conf.in > dkms.conf
}

build() {
	cd "$_pkgbase"
	_kernver=$(</usr/src/linux-mbp/version)
	make KVERSION=${_kernver}
}

package_apple-bce-git() {
	depends=('linux-mbp' 'linux-mbp-headers')

	_kernver=$(</usr/src/linux-mbp/version)
	_extramodules="/usr/lib/modules/${_kernver}/extramodules"

	cd "$_pkgbase"
	install -Dt "${pkgdir}${_extramodules}" -m644 *.ko
	find "${pkgdir}" -name '*.ko' -exec xz {} +
}

package_apple-bce-dkms-git() {
	depends=('dkms')
	conflicts=("${_pkgbase}")
	provides=("${_pkgbase}")

	install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

	cd "$_pkgbase"

	# XXX: Find a better solution...
	make KVERSION=$(</usr/src/linux-mbp/version) clean

	cp -dr --no-preserve='ownership' ./* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
