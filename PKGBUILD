_pkgbase=r8168
pkgname=${_pkgbase}-dkms
pkgver=8.042
pkgrel=1
pkgdesc="A kernel module for Realtek 8168 network cards"
url="http://www.realtek.com.tw"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'dkms')
conflicts=("${_pkgbase}")
optdepends=('linux-headers: Build the module for Arch kernel'
			'linux-lts-headers: Build the module for LTS Arch kernel')
#install=$pkgname.install
source=(https://github.com/mtorromeo/r8168/archive/$pkgver/r8168-$pkgver.tar.gz
        'linux-4.5.patch'
        'dkms.conf')
sha256sums=('9dd8ae22115bcbef98c15b0b1e2160300cce3129ef7e0485d7e577188ba3fcc2'
            '6416bb61b72316a519d36dc5c3e50019b2b2f75a017ed6e49626ad57916ec60a'
            '260d8142e944f3144cbc704534e662d427318d8b32dc7a2852a855be72e8d763')

prepare() {
	cd "r8168-$pkgver"
	patch -p1 -i ../linux-4.5.patch
}
 

package() {
	install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	sed -e "s/@PKGNAME@/${_pkgbase}/g" \
		-e "s/@PKGVER@/${_pkgbase}/g" \
		-i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	cd "${_pkgbase}-$pkgver"
	rm src/Makefile_linux24x
	cp -dr --no-preserve='ownership' src "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"
}
