# Maintainer: piernov <piernov@piernov.org>

pkgname=opensuperclone-git
_pkgname=OpenSuperClone
pkgver=r23.1426035
pkgrel=1
pkgdesc="Fork of HDDSuperClone"
arch=('x86_64')
url="https://github.com/ISpillMyDrink/OpenSuperClone"
license=('GPL2')
depends=('openssl' 'curl' 'gtk3' 'libusb-compat')
optdepends=('linux-headers: Direct AHCI kernel driver')
source=("git+https://github.com/ISpillMyDrink/OpenSuperClone.git"
	"fix-paths.patch"
	"gtk3-build.patch")
sha512sums=('SKIP'
            '7e0aaa75a092a8a0f8d172cb8e28b5b60d377540b8a6bba5e19abfd3bdf0ac12c67b009d5ab20772d7177b52261047fb45b811a3a7b3073d9cab7835cd59fa76'
            '5bdf87cbe58cd930aec94833612e6cde8249c74fe9457028fe4c5fb88375a98c852930654bb473d8441f762b15e69f0b2b1155df51fac06a20250c9f3a1fc2ae')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	patch -p1 < "${srcdir}/fix-paths.patch"
	patch -p1 < "${srcdir}/gtk3-build.patch"
}

build() {
	cd "$_pkgname/src"
	make
}

package() {
	cd "$_pkgname/bin"
	install -Dm755 hddsuperclone "${pkgdir}/usr/bin/hddsuperclone"
	install -Dm755 hddscviewer "${pkgdir}/usr/bin/hddscviewer"
	cp -r hddscripts "${pkgdir}/usr/bin/hddscripts"
}
