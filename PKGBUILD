# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: René Wagner <rwa at clttr dot info>
# Contributor: Juan Simón <play4pro at protonmail dot com>
# Contributor: alium
# Contributor: angelsl
# Contributor: hayao <hayao@fascode.net>

_pkgbase=r8168
pkgname=${_pkgbase}-dkms
pkgver=8.055.00
pkgrel=1
pkgdesc="A kernel module for Realtek 8168 network cards (DKMS version)"
url="https://github.com/mtorromeo/$_pkgbase"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'dkms')
makedepends=('git')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("r8168-dkms::git+${url}.git#tag=${pkgver}"
        'dkms.conf')
sha256sums=('eaaa94ec29f7378fb83f68cc940e7a47e3a7d218fb3bcfce53f88ff95ed38c6d'
            'd37b8acbd4fe06f81538581712a04751a96fc37bad3a4bd3ae8329f8744c49b3')

package() {
	install -Dm644 'dkms.conf' "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	sed -e "s/@PKGNAME@/${_pkgbase}/g" \
	    -e "s/@PKGVER@/${pkgver}/g" \
	    -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	cd "${pkgname}"
	cp -dr --no-preserve='ownership' src "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"

	echo "blacklist r8169" | \
		install -Dm644 '/dev/stdin' "$pkgdir/usr/lib/modprobe.d/$pkgname.conf"
}
