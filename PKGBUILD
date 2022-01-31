# Maintainer: X0rg

_realname=memtest86
pkgname=$_realname-efi
epoch=1
pkgver=9.4build1000
pkgrel=2
pkgdesc="A free, thorough, stand alone memory test as an EFI application"
arch=('any')
url="https://www.memtest86.com"
license=('GPL2' 'custom:PassMark')
makedepends=('p7zip')
optdepends=('efibootmgr: to add a new EFI boot entry'
	'grub: to add MemTest86 entry in GRUB2 menu')
backup=("etc/$pkgname/$pkgname.conf")
install="$pkgname.install"
source=("$pkgname-$pkgver.zip::https://github.com/X0rg/AUR-packages/raw/master/files/$_realname-$pkgver-usb.zip"
	"memtest86-efi"
	"memtest86-efi.conf"
	"memtest86-efi-update.hook"
	"memtest86-efi-remove.hook")
sha512sums=('c5a6183e2b66fe6023a7478ddfecf94dab03e99272d916fe156f05e2edcc2e70c7cd12feff474381571213bd6b07c76b78dd54d07f2db011cbe3127dac2dc222'
            '5667c8dd6bfc927c17ac69babc263e203ad963958c7c598458771eed1aca12635184cf50ee24627ce44587d818bebb2350f9c7f61a1ff84df11063cf9c66bf67'
            '947df5f141bdb00a007a796c74f862d6ca41f74b4e5b28d1a444b4b8e538114e7f404f54420508639a77e554c2477ad324570ada0462c9fd7b058ed51e0ea8d8'
            'a8936ed4a1955d69251955b824cfdfc606c374d40509a767ee4e357e746947d5bf1bd6793e5a4224733907556375bee05c0dd27f8044604f136d84c9be365d42'
            '72220e2d5a055838bc347ac0266dd41d466d60186968b21f1782062c35f47f1fab544ad313cab9fac796e597c1f0095864ef38dbce7eee00bf53c336b38b34e6')

prepare() {
	7z x -y "$srcdir/memtest86-usb.img" > /dev/null
	7z x -y "$srcdir/EFI System Partition.img" -oc:"$srcdir/$pkgname-$pkgver" > /dev/null
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
	install -Dvm644 "$srcdir/memtest86-efi-remove.hook" "$pkgdir/usr/share/libalpm/hooks/memtest86-efi-remove.hook"
}
