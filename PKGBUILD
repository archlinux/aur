# Maintainer: X0rg

_realname=memtest86
pkgname=$_realname-efi
pkgver=8.4
pkgrel=1
pkgdesc="A free, thorough, stand alone memory test as an EFI application"
arch=('any')
url="https://www.memtest86.com"
license=('GPL2' 'custom:PassMark')
makedepends=('p7zip')
optdepends=('efibootmgr: to add a new EFI boot entry'
	'grub: to add MemTest86 entry in GRUB2 menu')
backup=("etc/$pkgname/$pkgname.conf")
install="$pkgname.install"
source=(#"$pkgname-$pkgver.zip::https://www.memtest86.com/downloads/$_realname-usb.zip"
	"$pkgname-$pkgver.zip::https://github.com/X0rg/AUR-packages/raw/master/files/$_realname-usb.zip"
	"memtest86-efi"
	"memtest86-efi.conf"
	"memtest86-efi-update.hook"
	"memtest86-efi-remove.hook")
sha512sums=('905e5a7983f5fe3c2ccf3852d1047e31bec293589acd476c610da53b58670b7d7b2a18683f80c02bfbb1ef778b97113cde6168371972bf50aa3beb49b145a8f3'
            '493bbdd83ad33602a8a125cd06c0da4b48de19c11748fe315723c3ac2bbdc577a28a61e93639d6067033110524ed8975a95930ae86280dcf286b3bf41d21c804'
            '947df5f141bdb00a007a796c74f862d6ca41f74b4e5b28d1a444b4b8e538114e7f404f54420508639a77e554c2477ad324570ada0462c9fd7b058ed51e0ea8d8'
            '6952376b601b84da5fba14a7a5316d37b6083bae20f68f5b90b22d2728a19bf6d1fb367cf1adecfb82bf03e339b7dbf91f6d23f0d59731f89cf45240f16d5614'
            '1fe55a642e36005f5b7b58e5fb245e8029bb1a19b5f30d8ddba6bbf5a4b96c1bba35be0dfacee478034b8367fdde62d34a934dcd787f4c6702889615bac9f78a')

prepare() {
	7z x -y "$srcdir/memtest86-usb.img" > /dev/null
	7z x -y "$srcdir/EFI System Partition.img" -oc:"$srcdir/$pkgname-$pkgver" > /dev/null
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	# Move MemTest86 stuff in share directory
	install -Dvm755 "EFI/BOOT/BOOTIA32.efi"  "$pkgdir/usr/share/$pkgname/bootia32.efi"
	install -Dvm755 "EFI/BOOT/BOOTX64.efi"   "$pkgdir/usr/share/$pkgname/bootx64.efi"
	install -Dvm644 "EFI/BOOT/blacklist.cfg" "$pkgdir/usr/share/$pkgname/blacklist.cfg"
	install -Dvm644 "EFI/BOOT/mt86.png"      "$pkgdir/usr/share/$pkgname/mt86.png"
	install -Dvm644 "EFI/BOOT/unifont.bin"   "$pkgdir/usr/share/$pkgname/unifont.bin"
	install -Dvm644 "license.rtf"            "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rtf"

	# Install AUR provided script
	install -Dvm755 "$srcdir/memtest86-efi"        "$pkgdir/usr/bin/memtest86-efi"
	install -Dvm644 "$srcdir/memtest86-efi.conf"   "$pkgdir/etc/memtest86-efi/memtest86-efi.conf"

	# Install Pacman hooks
	install -Dvm644 "$srcdir/memtest86-efi-update.hook" "$pkgdir/usr/share/libalpm/hooks/memtest86-efi-update.hook"
	install -Dvm644 "$srcdir/memtest86-efi-remove.hook" "$pkgdir/usr/share/libalpm/hooks/memtest86-efi-remove.hook"
}
