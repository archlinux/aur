# Maintainer: X0rg

_pkgbasename=memtest86
pkgname=$_pkgbasename-efi
pkgver=7.5.1001
pkgrel=1
pkgdesc="A free, thorough, stand alone memory test as an EFI application"
arch=('i686' 'x86_64')
url="http://www.memtest86.com"
license=('GPL2' 'custom:PassMark')
makedepends=('p7zip')
optdepends=('efibootmgr: to add a new EFI boot entry'
	'grub: to add MemTest86 entry in GRUB2 menu')
backup=(etc/$pkgname/$pkgname.conf)
install=$pkgname.install
source=("https://www.passmark.com/ftp/$_pkgbasename-usb-$pkgver.tar.gz"
	"memtest86-efi"
	"memtest86-efi.conf"
	"grub.conf"
	"systemd-boot.conf"
	"memtest86-efi-update.hook"
	"memtest86-efi-remove.hook")
sha512sums=('10232a1c3a589407e06257f7fff14a28b524d3998bc712317d25081e3e67f87549bf36cb9e79f50ee9676e32b050d38bbfa74d2f536899d358bcd05edea3b97a'
            '001151346736fc901dac0f5f2b07557b049f2e2cf2a7de0aae7019e7fde126e4e6cf291328dea920d5af45b21b08366b6465b8a8aa453f7af0fd760ced3952aa'
            '947df5f141bdb00a007a796c74f862d6ca41f74b4e5b28d1a444b4b8e538114e7f404f54420508639a77e554c2477ad324570ada0462c9fd7b058ed51e0ea8d8'
            'df883042a5bad262e74b69e2ca0cd8c9c21a4e4eb5132aed0041a07050b5ab7f280e94681ffe106e6de547d00b621fd2a019cf5b669e00876a32e637687395f8'
            '1ece1ca18d53a19eff8341cce0c6099ac6b8d27ebad176c9a85714a7cac24cef7dfa2b462d8a0160dc8eb71f21aca1ee2469ebdf095083dcd77fa0b0f90f1812'
            '6952376b601b84da5fba14a7a5316d37b6083bae20f68f5b90b22d2728a19bf6d1fb367cf1adecfb82bf03e339b7dbf91f6d23f0d59731f89cf45240f16d5614'
            '1fe55a642e36005f5b7b58e5fb245e8029bb1a19b5f30d8ddba6bbf5a4b96c1bba35be0dfacee478034b8367fdde62d34a934dcd787f4c6702889615bac9f78a')

prepare() {
	msg2 "Extract ISO..."
	7z x -y "$srcdir/memtest86-usb.img" > /dev/null
	7z x -y "$srcdir/EFI System Partition.img" -oc:"$srcdir/$pkgname-$pkgver" > /dev/null 
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	msg2 "Move MemTest86 stuff in share directory..."
	[[ "$CARCH" == "i686" ]]   && install -Dvm755  "EFI/BOOT/BOOTIA32.efi" "$pkgdir/usr/share/$pkgname/bootia32.efi"
	[[ "$CARCH" == "x86_64" ]] && install -Dvm755  "EFI/BOOT/BOOTX64.efi"  "$pkgdir/usr/share/$pkgname/bootx64.efi"
	install -Dvm644 "EFI/BOOT/mt86.png"    "$pkgdir/usr/share/$pkgname/mt86.png"
	install -Dvm644 "EFI/BOOT/unifont.bin" "$pkgdir/usr/share/$pkgname/unifont.bin"
	install -Dvm644 "license.rtf"          "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rtf"

	msg2 "Install AUR provided script..."
	install -Dvm755 "$srcdir/memtest86-efi"        "$pkgdir/usr/bin/memtest86-efi"
	install -Dvm644 "$srcdir/memtest86-efi.conf"   "$pkgdir/etc/memtest86-efi/memtest86-efi.conf"
	install -Dvm644 "$srcdir/grub.conf"            "$pkgdir/etc/memtest86-efi/grub.conf"
	install -Dvm644 "$srcdir/systemd-boot.conf"    "$pkgdir/etc/memtest86-efi/systemd-boot.conf"

	msg2 "Install Pacman hooks..."
	install -Dvm644 "$srcdir/memtest86-efi-update.hook" "$pkgdir/usr/share/libalpm/hooks/memtest86-efi-update.hook"
	install -Dvm644 "$srcdir/memtest86-efi-remove.hook" "$pkgdir/usr/share/libalpm/hooks/memtest86-efi-remove.hook"
}
