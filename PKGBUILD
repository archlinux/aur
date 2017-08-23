# Maintainer: Tom Nguyen <tom81094@gmail.com>
# Contributor: Masanori Ohgita <mp_aur[at]ohgita[dot]info>

pkgbase=rtl8188eu-git
pkgname=(rtl8188eu-git rtl8188eu-dkms-git)
_pkgname=rtl8188eu
_pkgver=1.0
_extramodules=extramodules-4.12-ARCH
pkgver=1.0.c5113ff
pkgrel=2
pkgdesc="Standalone RTL8188EU driver"
url="https://github.com/lwfinger/rtl8188eu"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('linux-headers>=4.12' 'linux-headers<4.13' 'linux>=4.12' 'linux<4.13')
source=("$pkgbase-$pkgver::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgbase}-${pkgver}"

	#git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.rc/rc/'
	echo $(echo ${_pkgver}. && git rev-parse --short HEAD) | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.rc/rc/;s/ //g'
}

prepare() {
	cd "${pkgbase}-${pkgver}"

	# Set name and version for dkms.conf
	sed -e "s/PACKAGE_NAME=\"8188eu\"/PACKAGE_NAME=${_pkgname}/" \
		-e "s/PACKAGE_VERSION=\"1.0\"/PACKAGE_VERSION=${pkgver}/" \
		-i dkms.conf
}

build() {
	cd "${pkgbase}-${pkgver}"

	_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
	make all ${MAKEFLAGS} KSRC=/lib/modules/${_kernver}/build
}

package_rtl8188eu-git() {
	depends=('linux>=4.12' 'linux<4.13')
	conflicts=('8188eu' "${_pkgname}")
	provides=('8188eu' "${_pkgname}")
	install=rtl8188eu.install

	cd "${pkgbase}-${pkgver}"

	install -Dm644 8188eu.ko "${pkgdir}/usr/lib/modules/${_extramodules}/8188eu.ko"
	gzip "${pkgdir}/usr/lib/modules/${_extramodules}/8188eu.ko"
}

package_rtl8188eu-dkms-git() {
	depends=('dkms')
	conflicts=('8188eu' "${_pkgname}")
	provides=('8188eu' "${_pkgname}")

	# dkms build reference and credit to:
	# - Arpan "rpn" Kapoor	<k.arpan26@gmail.com>
	# - Runnytu		<runnytu@gmail.com>

	local install_dir="${pkgdir}/usr/src/${pkgbase}-${pkgver}"

	# Copy dkms.conf
	install -Dm644 "${pkgbase}-${pkgver}/dkms.conf" "${install_dir}/dkms.conf"

	# Copy sources
	cd "${pkgbase}-${pkgver}"

	for d in $(find . -type d); do install -dm755 "${install_dir}/$d"; done
	for f in $(find . -type f); do install -m644 "$f" "${install_dir}/$f"; done
}
