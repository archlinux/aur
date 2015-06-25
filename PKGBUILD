# Maintainer: Pablo Lezaeta <prflr88 (arro'a) gmail puntocom>

pkgname=fwupdate-git
pkgver=0.4.r97
pkgrel=2
pkgdesc="Provides user access to read the EFI System Resource Table (ESRT) - Git version"
url="https://github.com/rhinstaller/fwupdate"
license=("GPL2")
arch=("i686" "x86_64")
provides=("fwupdate" "fwupdate-git")
conflicts=("fwupdate")
depends=("efivar>=0.20")
makedepends=("git" "pesign" "gnu-efi-libs" "gettext" "popt" "pkgconfig")
source=("fwupdate::git+https://github.com/rhinstaller/fwupdate")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/fwupdate"

	echo $(git describe --abbrev=0).r$(git rev-list --count master) | sed 's|-|.|g' | sed 's|v||g'
}

build() {
	cd "${srcdir}/fwupdate"

	make LIBEXECDIR=/usr/lib/fwupdate LIBDIR=/usr/lib \
		SBINDIR=/usr/bin BINDIR=/usr/bin libdir=/usr/lib \
		GNUEFIDIR=/usr/lib EFIDIR=Arch PREFIX=/usr
}

package() {
	cd "${srcdir}/fwupdate"

	make LIBDIR=/usr/lib EFIDIR=Arch DESTDIR="${pkgdir}" install

	#don't install into /boot. copy files to /usr/lib/fwupdate for manual installation
	install -d "${pkgdir}"/usr/lib/fwupdate
	mv "${pkgdir}"/boot/efi/EFI "${pkgdir}"/usr/lib/fwupdate/EFI
	rm -rf "${pkgdir}"/boot
}
