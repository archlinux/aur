# Maintainer: UnicornDarkness

_realname=memtest86
pkgname=$_realname-efi
epoch=1
pkgver=10.7build1000
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
source=("$pkgname-$pkgver.zip::https://github.com/TheTumultuousUnicornOfDarkness/AUR-packages/raw/master/files/$_realname-$pkgver-usb.zip"
	"memtest86-efi"
	"memtest86-efi.conf"
	"memtest86-efi-update.hook")
sha512sums=('ccd6c10471ddc66bfad057f0d9f391255c88d910a4607566b9523aeaae47c04975cc7b65bc33ff6809a8660c69ae42faf5cc8d527972c03847e93b1ca7c0300b'
            'e509a3e0b70d6a6cacb3ab0e99c43d2eef29863f2f59fd6f0a858d9d8a97b0e7b432ac965a22e37bf01f5ba63fadcdc47eae49e68e53edb848ee8a03707e98a1'
            '5eb6231096484d8923fa9943401c5f5e654a498028b3b4c0b19d26c8265fd8882c94ee90dfa23fabcfb1f8d3812e0a502c195d57b4fbdf5cc25f3ac8dcb36759'
            '2ec7fa38c1c100109e181544c217e6150affb7e8e7a3cf5795e3c2143d00deeca6a1e55dcb6bdec262c4c77226dddb91d20d2c183948e1d2e1f63fb34badceb8')

prepare() {
	7z e -y "$srcdir/memtest86-usb.img" '*EFI System Partition*' > /dev/null
	7z x -y "$srcdir/"*"EFI System Partition.img" -o"$srcdir/$pkgname-$pkgver" > /dev/null
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	# Move MemTest86 stuff in share directory
	for file in EFI/BOOT/*; do
		if [[ "$file" == *".efi" ]]; then
			filebase="$(basename "$file" | tr '[:upper:]' '[:lower:]')"
			install -Dvm755 "$file" "$pkgdir/usr/share/$pkgname/$filebase"
		elif [[ -d "$file" ]]; then
			dirbase="$(basename "$file")"
			install -dvm755 "$pkgdir/usr/share/$pkgname/$dirbase"
		else
			filebase="$(basename "$file")"
			install -Dvm644 "$file" "$pkgdir/usr/share/$pkgname/$filebase"
		fi
	done
	for file in help/*; do
		filebase="$(basename "$file")"
		install -Dvm644 "$file" "$pkgdir/usr/share/doc/$pkgname/$filebase"
	done
	install -Dvm644 "license.rtf" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rtf"

	# Install AUR provided script
	install -Dvm755 "$srcdir/memtest86-efi"        "$pkgdir/usr/bin/memtest86-efi"
	install -Dvm644 "$srcdir/memtest86-efi.conf"   "$pkgdir/etc/memtest86-efi/memtest86-efi.conf"

	# Install Pacman hooks
	install -Dvm644 "$srcdir/memtest86-efi-update.hook" "$pkgdir/usr/share/libalpm/hooks/memtest86-efi-update.hook"
}
