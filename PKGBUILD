# Maintainer: Tom Nguyen <tom81094@gmail.com>
# Contributor: Masanori Ohgita <mp_aur[at]ohgita[dot]info>

pkgbase=rtl8188eu-git
pkgname=(rtl8188eu-git rtl8188eu-dkms-git)
_pkgname=rtl8188eu
_pkgver=1.0
_extramodules=extramodules-4.12-ARCH
pkgver=1.0.c5113ff
pkgrel=1
pkgdesc="Standalone RTL8188EU driver"
url="https://github.com/lwfinger/rtl8188eu"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('linux-headers>=4.12' 'linux-headers<4.13' 'linux>=4.12' 'linux<4.13')
source=("$pkgbase-$pkgver::git+${url}"
	'dkms.conf')
sha256sums=('SKIP'
	    '1201c9d0d52dc4b140f3b20198410ade2ab3e8ed92f90d53ac72a79425126e9b')

pkgver() {
	cd "${pkgbase}-${pkgver}"

	#git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.rc/rc/'
	echo $(echo ${_pkgver}. && git rev-parse --short HEAD) | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.rc/rc/;s/ //g'
}

build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"

	_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
	make all ${MAKEFLAGS} KDIR=/lib/modules/${_kernver}/build
}

package_rtl8188eu-git() {
	depends=('linux>=4.12' 'linux<4.13')
	conflicts=('8188eu' "${_pkgname}")
	provides=('8188eu' "${_pkgname}")
	install=rtl8188eu.install

	cd "${srcdir}/${pkgbase}-${pkgver}"

	install -Dm644 8188eu.ko "${pkgdir}"/usr/lib/modules/${_extramodules}/8188eu.ko
	gzip "${pkgdir}/usr/lib/modules/${_extramodules}/8188eu.ko"
}

package_rtl8188eu-dkms-git() {
	depends=('dkms')
	conflicts=('8188eu' "${_pkgname}")
	provides=('8188eu' "${_pkgname}")

	# dkms build reference and credit to:
	# - Arpan "rpn" Kapoor	<k.arpan26@gmail.com>
	# - Runnytu		<runnytu@gmail.com>

	cd "${srcdir}"

	local install_dir="${pkgdir}/usr/src/${pkgbase}-${pkgver}"

	# Copy dkms.conf
	install -Dm644 dkms.conf "${install_dir}/dkms.conf"

	# Set name and version
	sed -e "s/@_PKGNAME@/${_pkgname}/" \
		-e "s/@PKGVER@/${pkgver}/" \
		-i "${install_dir}/dkms.conf"

	# Copy sources
	cd "${pkgbase}-${pkgver}"

	for d in $(find . -type d); do install -dm755 "${install_dir}/$d"; done
	for f in $(find . -type f); do install -m644 "$f" "${install_dir}/$f"; done
}
