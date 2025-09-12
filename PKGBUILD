# Maintainer: akku <akkun11.open [at] gmail.com>
_pkgbase=us144mkii
pkgname=us144mkii-dkms-git
pkgver=r132.aefc02d715cc
pkgrel=2
pkgdesc="Linux kernel driver for TASCAM US-144MKII (This driver will be merged on Linux 6.18)"
arch=('x86_64')
url="https://github.com/serifpersia/us144mkii"
license=('GPL-2.0-only')
depends=('dkms')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
source=(
	"git+$url"
	'dkms.conf'
	'blacklist-us122l.conf'
)
md5sums=(
	SKIP
	SKIP
	SKIP
)

pkgver() {
	cd "$srcdir/${_pkgbase}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm 644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf	
	install -Dm 644 blacklist-us122l.conf ${pkgdir}/etc/modprobe.d/blacklist-us122l.conf

	cd "$srcdir/${_pkgbase}"
	install -Dm 644 -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver} *.c *.h Makefile

	# Set name and version
	sed -e "s/@_PKGBASE@/${_pkgbase}/" \
	    -e "s/@PKGVER@/${pkgver}/" \
	    -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
