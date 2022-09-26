# Maintainer: piernov <piernov@piernov.org>

pkgname=opensuperclone-git
_pkgname=OpenSuperClone
pkgver=r26.f8ee02f
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
            '6d5aa44b62b24936c1370db08c293389c75f731f21af3c9139a522441a046ad0aa9c6728e4224fdc7ce273c6a19f16d1ea1d813ffbc6003da189e7149e2fe14c'
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
