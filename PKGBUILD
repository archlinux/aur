# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: René Wagner <rwa at clttr dot info>
# Contributor: Juan Simón <play4pro at protonmail dot com>
# Contributor: alium
# Contributor: angelsl
# Contributor: hayao <hayao@fascode.net>

_pkgbase=r8168
pkgname=${_pkgbase}-dkms
pkgver=8.051.02
pkgrel=4
pkgdesc="A kernel module for Realtek 8168 network cards (DKMS version)"
url="https://github.com/mtorromeo/r8168"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'dkms')
makedepends=('git')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("r8168-dkms::git+https://github.com/mtorromeo/r8168.git#tag=${pkgver}"
        "${pkgname}-v6.1.patch::https://github.com/mtorromeo/r8168/pull/47.patch"
        'dkms.conf'
        "${pkgname}-v6.4.patch")
sha256sums=('SKIP'
            'b7ef09e7496715b7576b7a3bff5a96e0e07c0bb02cd5bb5805415be20b883f60'
            'd37b8acbd4fe06f81538581712a04751a96fc37bad3a4bd3ae8329f8744c49b3'
            '69fd10d72e9a90b7527d1de3c9df44df92927d708dd74828d61598ef6837bde7')

prepare() {
	cd "${pkgname}"
	patch -p1 -i "$srcdir/${pkgname}-v6.1.patch"
	patch -p1 -i "$srcdir/${pkgname}-v6.4.patch"
}

package() {
	install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	sed -e "s/@PKGNAME@/${_pkgbase}/g" \
	    -e "s/@PKGVER@/${pkgver}/g" \
	    -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	cd "${pkgname}"
	cp -dr --no-preserve='ownership' src "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"

	echo "blacklist r8169" | \
		install -Dm644 /dev/stdin "$pkgdir/usr/lib/modprobe.d/$pkgname.conf"
}
