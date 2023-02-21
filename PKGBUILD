# Maintainer: M4rQu1Nh0S

_pkgbase=r8168
pkgname=${_pkgbase}-8136
pkgver=8.051.02
pkgrel=2
pkgdesc="A kernel module for Realtek 8168 network cards (DKMS version) for Device ID 0x8136."
url="https://github.com/mtorromeo/r8168"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'dkms' 'linux-headers')
makedepends=('git')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("r8168-8136::git+https://github.com/mtorromeo/r8168.git"
        "dkms.conf"
        "8136.patch"
        "kernel61.patch")
sha256sums=('SKIP'
            'd37b8acbd4fe06f81538581712a04751a96fc37bad3a4bd3ae8329f8744c49b3'
            'f203ed455d17f03c964b8bb91d9d7da6c33d8494c0b47ecf3096bde16e95b310'
            'd102d0827758a300806362e840943ea6df54013c9f2bf43d08c0d2a780c64539')
install=r8168-dkms.install

prepare() {
	cd "$pkgname"
	patch -Np1 -i '../8136.patch'
	patch -Np1 -i '../kernel61.patch'

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
