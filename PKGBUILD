# Maintainer: Alif <alive4ever at live.com>
pkgname=wimboot-git
pkgver=v2.6.0.r2.55cfe8a
pkgrel=1
pkgdesc="iPXE kernel to boot wim images from network for both UEFI and BIOS system"
arch=(any)
url="https://git.ipxe.org/wimboot.git"
license=('GPL')
makedepends=('git' 'pesign' 'gcab')
optdepends=("ipxe-git: iPXE network boot program"
	"ipxe-netboot: Alternative iPXE network boot program, with Archlinux network install support")
install=$pkgname.install
source=('wimboot::git+https://git.ipxe.org/wimboot.git'
	'01-efireloc.diff')
sha256sums=('SKIP'
            '6f8184d75ff2c30a19f9192a8d6f159a390a677e6fd110fd4aea79ac14e9f31d')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 < "$srcdir/01-efireloc.diff"
	cd "$srcdir/${pkgname%-git}/src"
	make
}	

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm644 README.txt $pkgdir/usr/share/wimboot/README.txt
	install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/wimboot/LICENSE.txt
	cd "$srcdir/${pkgname%-git}/src"
	for a in wimboot wimboot.x86_64 wimboot.x86_64.efi wimboot.i386 wimboot.i386.efi wimboot.cab ; do
	install -Dm755 $a $pkgdir/usr/share/wimboot/$a
	done
}
