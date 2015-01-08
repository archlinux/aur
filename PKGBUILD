# Maintainer: X0rg

_pkgbasename=memtest86
pkgname=$_pkgbasename-efi
pkgver=5.1.0
pkgrel=1
pkgdesc="A free, thorough, stand alone memory test as an EFI application"
arch=('i686' 'x86_64')
url="http://www.memtest86.com"
license=('GPL2')
backup=(etc/$pkgname.conf)
install=$pkgname.install
source=("$_pkgbasename-$pkgver".iso.gz::"$url/downloads/$_pkgbasename-iso.gz"
	"$pkgname"
	"$pkgname.conf")
md5sums=('483b1066de1f631b3d4222b95bcbfb5e'
         '786ecb9dd8fb1fe4cebcfebef22cc323'
         '16cb53c7132214cdd848d83433ef6462')

prepare() {
	bsdtar -xf "$_pkgbasename-$pkgver.iso"

	cd "$srcdir/EFI/BOOT/"
	mv -f MT86.PNG mt86.png
	[[ "${CARCH}" == "i686" ]]   && rm -f BOOTX64.EFI	&& mv -f BOOTIA32.EFI bootia32.efi
	[[ "${CARCH}" == "x86_64" ]] && rm -f BOOTIA32.EFI	&& mv -f BOOTX64.EFI bootx64.efi
}

package() {
	install -dv "$pkgdir/etc" "$pkgdir/usr/bin" "$pkgdir/usr/share/$pkgname"

	install -vm755 "$srcdir/EFI/BOOT/"boot*.efi "$pkgdir/usr/share/$pkgname"
	install -vm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"

	install -vm644 "$srcdir/EFI/BOOT/mt86.png" "$pkgdir/usr/share/$pkgname"
	install -vm644 "$srcdir/$pkgname.conf" "$pkgdir/etc"
}
