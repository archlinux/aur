# Author: Leonardo Gates <leogx9r>
# Maintainer: Leonardo Gates <leogx9r>
_pkgname=havege
pkgname=${_pkgname}-dkms
pkgver=1.0.0
pkgrel=1
pkgdesc="HArdware Volatile Entropy Gathering & Expansion kernel module"

arch=('x86_64')
license=('GPL')
groups=('leogx9r')

depends=('dkms')
provides=("${_pkgname}-${pkgver}")

source=('step.h'
        'body.h'
        'havege.c'
        'Kbuild'
        'Makefile'
        'dkms.conf'
        'LICENSE'
        '99-havege-udev.rules')

sha256sums=('d280bcda294824f26eb19490e0caf50af2b4a61d2dd8ffa2a6f3002631e2c95d'
            'eab8a8ad347eebd5a9ab5d540c8917736d8b330baae0e595a30dc6414302a22a'
            '6801f4711a64cd5924f9d17d751919a0f3c4ec4797b319b92f8744aaea8bdcd0'
            'a7d29866566640c5bbd35dcacffbf3ca4b3bc9b2fde5adf05671a3881ef9a52e'
            '11bc0a630c6a3d9a7ca2563432aba1d4f4b539941423640428d3cc5b449a22b0'
            '46863364b2f9db6aa75fea98f2430452b72361c73b88436aec8b5a1ff52952e7'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'
            '08278f2efef8514505ee76c2d031588353f1663bba243877f78c3f365cf3db2c')

package() {
	msg2 "Installing ..."

	cd "$srcdir"
	install -Dm644 dkms.conf "$pkgdir/usr/src/${_pkgname}-${pkgver}/dkms.conf"

	sed -e "s/@_PKGBASE@/${_pkgname}-${pkgver}/" \
		-e "s/@PKGVER@/${pkgver}/" \
		-i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

	install -Dm644 99-havege-udev.rules "$pkgdir/etc/udev/rules.d/99-havege-udev.rules"
	install -Dm644 step.h "$pkgdir/usr/src/${_pkgname}-${pkgver}/step.h"
	install -Dm644 body.h "$pkgdir/usr/src/${_pkgname}-${pkgver}/body.h"
	install -Dm644 havege.c "$pkgdir/usr/src/${_pkgname}-${pkgver}/havege.c"
	install -Dm644 Makefile "$pkgdir/usr/src/${_pkgname}-${pkgver}/Makefile"
	install -Dm644 Kbuild "$pkgdir/usr/src/${_pkgname}-${pkgver}/Kbuild"
	install -Dm644 LICENSE "$pkgdir/usr/src/${_pkgname}-${pkgver}/LICENSE"

	msg2 "Building module ..."
	dkms install --all $_pkgname/$pkgver
}
