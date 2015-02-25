# Maintainer: X0rg

_pkgbasename=memtest86
pkgname=$_pkgbasename-efi
pkgver=6.0.0
pkgrel=1
pkgdesc="A free, thorough, stand alone memory test as an EFI application"
arch=('i686' 'x86_64')
url="http://www.memtest86.com"
license=('GPL2')
backup=(etc/$pkgname.conf)
install=$pkgname.install
source=("$_pkgbasename-$pkgver.iso.tar.gz::http://www.memtest86.com/downloads/$_pkgbasename-iso.tar.gz"
	"memtest86-efi"
	"memtest86-efi.conf")
md5sums=('c07e36cb18147d11eda2dcbf0c0c44a4'
         '1d2591c66ec002619f236da72d797a30'
         '6c096df3f55baf3e27c3bd605a418aa2')

prepare() {
	msg2 "Extract ISO..."
	bsdtar -xf "Memtest86-6.0.0.iso"
}

package() {
	msg2 "Move MemTest86 stuff in share directory..."
	[[ "$CARCH" == "i686" ]]   && install -Dvm755 "$srcdir/EFI/BOOT/BOOTIA32.EFI" "$pkgdir/usr/share/$pkgname/bootia32.efi"
	[[ "$CARCH" == "x86_64" ]] && install -Dvm755 "$srcdir/EFI/BOOT/BOOTX64.EFI"  "$pkgdir/usr/share/$pkgname/bootx64.efi"
	install -vm644 "$srcdir/EFI/BOOT/MT86.PNG" "$pkgdir/usr/share/$pkgname/mt86.png"

	msg2 "Install AUR provided script..."
	install -Dvm755 "$srcdir/memtest86-efi"		"$pkgdir/usr/bin/memtest86-efi"
	install -Dvm644 "$srcdir/memtest86-efi.conf"	"$pkgdir/etc/memtest86-efi.conf"
}
