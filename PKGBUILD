# Maintainer: éclairevoyant
# Contributor: Felix Golatofski <contact at xdfr dot de>
# Contributor: Andy Weidenbaum <archbaum at gmail dot com>
# Contributor: Sebastian Lau <archlinux _at_ slau _dot_ info>
# Contributor: Eric Ozwigh <ozwigh at gmail dot com>

_pkgname=veracrypt
pkgname="$_pkgname-git"
pkgver=1.25.9.r158.7ada94d3
pkgrel=1
epoch=1
pkgdesc='Disk encryption with strong security based on TrueCrypt'
url='https://www.veracrypt.fr/'
arch=(i686 x86_64)
license=('custom:TrueCrypt')
depends=(device-mapper 'fuse2>=2.8.0' libsm wxwidgets-gtk3)
makedepends=(git yasm)
optdepends=('sudo: mounting encrypted volumes as nonroot users')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/veracrypt/VeraCrypt.git"
        no-makeself.patch
        wx-3.2-size-warnings.patch
        $_pkgname.desktop)
b2sums=('SKIP'
        'e336984d8fdbeb6d8c5048de69e23770dce21681269d29bc0f3b182df6c80e2e07e90cc01c215bb81ec1260332fa0f37f63bee6ce42930eff0f7eeffe9e20fbd'
        '5f51de91f2ccccc08304eb82ada94ea0140143c9f13ecc6b1c91c39e921faf8e42ae0f638225845725417b3cf23fb2655d96f5b2d335409c5899444d6d043b3f'
        '9a68587e7b7df71ccae73157131db7b1f29ac9e529812d9a7435593534b1b66a5fb34cef385436beb08a34cfa444848b3a0bce52fc6f2407fcb12001af0fa997')

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/^VeraCrypt_//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname/src

	chmod -R u+w . # WAT award
	patch -Np1 -i "${srcdir}/no-makeself.patch"
	patch -Np1 -i "${srcdir}/wx-3.2-size-warnings.patch"
}

build() {
	cd $_pkgname/src
	make PKG_CONFIG_PATH=/usr/lib/pkgconfig \
		WX_CONFIG=/usr/bin/wx-config \
		TC_EXTRA_LFLAGS+="-ldl ${LDFLAGS}" \
		TC_EXTRA_CXXFLAGS="${CXXFLAGS} ${CPPFLAGS}" \
		TC_EXTRA_CFLAGS="${CFLAGS} ${CPPFLAGS}"
}

package() {
	install -vDm0644 $_pkgname.desktop -t "$pkgdir/usr/share/applications/"

	cd $_pkgname/src

	install -vDm0755 Main/$_pkgname -t "$pkgdir/usr/bin/"
	install -vDm0644 Resources/Icons/VeraCrypt-256x256.xpm "$pkgdir/usr/share/pixmaps/$_pkgname.xpm"
	install -vDm0644 License.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
