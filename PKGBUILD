# Maintainer: X0rg

_pkgbasename=memtest86
pkgname=$_pkgbasename-efi
pkgver=7.2
pkgrel=2
pkgdesc="A free, thorough, stand alone memory test as an EFI application"
arch=('i686' 'x86_64')
url="http://www.memtest86.com"
license=('GPL2' 'custom:PassMark')
makedepends=('libarchive')
optdepends=('efibootmgr: to add a new EFI boot entry'
	'grub: to add MemTest86 entry in GRUB2 menu')
backup=(etc/$pkgname/$pkgname.conf)
install=$pkgname.install
source=("$_pkgbasename-$pkgver.iso.tar.gz::http://www.memtest86.com/downloads/$_pkgbasename-iso.tar.gz"
	"memtest86-efi"
	"memtest86-efi.conf"
	"grub.conf"
	"systemd-boot.conf"
	"memtest86-efi-update.hook"
	"memtest86-efi-remove.hook")
md5sums=('5ac971dbe3af784c1847a693f587a667'
         '5dc6005ffd904163c40ceb06e68a467b'
         '6c096df3f55baf3e27c3bd605a418aa2'
         '8b4aa0e2f5d769d902459c8f8d514336'
         '496120c33c2af986933bf33456fa6cf3'
         'a7dc15b3dea142e73d24338d9c6c51a5'
         '86ab2980113da2d1ec72b0feeedaa600')

prepare() {
	msg2 "Extract ISO..."
	bsdtar -xf "Memtest86-$pkgver.iso"
}

package() {
	msg2 "Move MemTest86 stuff in share directory..."
	[[ "$CARCH" == "i686" ]]   && install -Dvm755  "$srcdir/EFI/BOOT/BOOTIA32.EFI" "$pkgdir/usr/share/$pkgname/bootia32.efi"
	[[ "$CARCH" == "x86_64" ]] && install -Dvm755  "$srcdir/EFI/BOOT/BOOTX64.EFI"  "$pkgdir/usr/share/$pkgname/bootx64.efi"
	install -Dvm644 "$srcdir/EFI/BOOT/MT86.PNG"    "$pkgdir/usr/share/$pkgname/mt86.png"
	install -Dvm644 "$srcdir/EFI/BOOT/UNIFONT.BIN" "$pkgdir/usr/share/$pkgname/unifont.bin"
	install -Dvm644 "$srcdir/LICENSE.RTF"          "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rtf"

	msg2 "Install AUR provided script..."
	install -Dvm755 "$srcdir/memtest86-efi"        "$pkgdir/usr/bin/memtest86-efi"
	install -Dvm644 "$srcdir/memtest86-efi.conf"   "$pkgdir/etc/memtest86-efi/memtest86-efi.conf"
	install -Dvm644 "$srcdir/grub.conf"            "$pkgdir/etc/memtest86-efi/grub.conf"
	install -Dvm644 "$srcdir/systemd-boot.conf"    "$pkgdir/etc/memtest86-efi/systemd-boot.conf"

	msg2 "Install Pacman hooks..."
	install -Dvm644 "$srcdir/memtest86-efi-update.hook" "$pkgdir/usr/share/libalpm/hooks/memtest86-efi-update.hook"
	install -Dvm644 "$srcdir/memtest86-efi-remove.hook" "$pkgdir/usr/share/libalpm/hooks/memtest86-efi-remove.hook"
}
