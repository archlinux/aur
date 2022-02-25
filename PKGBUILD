# Maintainer: Agata Margas <agata.margas@student.uj.edu.pl>
# Contributor: Łukasz Klimek <lukas.klimek@student.uj.edu.pl>
# Contributor: Krzysztof Mrzigod <krzysztof.mrzigod@student.uj.edu.pl>
# Contributor: Oliwia Gil <oliwia.gil@student.uj.edu.pl>

pkgname=archiso-encrypted
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="An extension to mkarchiso that lets you encrypt the iso during creation"
arch=('any')
url="https://gitlab.com/ia-projekt-zespolowy-2021-2022/livecd-encryption"
license=('GPL')
groups=()
depends=('arch-install-scripts' 'bash' 'cryptsetup' 'device-mapper' 'dosfstools' 'e2fsprogs' 
'erofs-utils' 'libarchive' 'libisoburn' 'mkinitcpio' 'mtools' 'squashfs-tools')
makedepends=('archiso' 'mkinitcpio-archiso')
checkdepends=()
optdepends=()
provides=('archiso')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname.zip::https://gitlab.com/ia-projekt-zespolowy-2021-2022/livecd-encryption/-/archive/main/livecd-encryption-main.zip")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "livecd-encryption-main"
	cp /usr/share/archiso/configs/baseline/airootfs/etc/mkinitcpio.conf mkinitcpio.conf
	sed -i "s/BINARIES=(/BINARIES=(cryptsetup /" mkinitcpio.conf
	sed -i "s/MODULES=(/MODULES=(cbc dm-crypt /" mkinitcpio.conf
	sed -i 's/\(HOOKS=(.*\)archiso /\1keyboard archiso-encrypted /' mkinitcpio.conf

}

package() {
	cd "livecd-encryption-main"
	mkdir -p "$pkgdir/usr/bin/"
	cp mkarchiso "$pkgdir/usr/bin/mkarchiso-encrypted"
	mkdir -p "$pkgdir/usr/lib/initcpio/hooks/"
	cp archiso-encrypted "$pkgdir/usr/lib/initcpio/hooks"

	mkdir -p "$pkgdir/usr/share/archiso/configs/"
	cp -r /usr/share/archiso/configs/baseline/ "$pkgdir/usr/share/archiso/configs/"
	mv "$pkgdir/usr/share/archiso/configs/baseline/" "$pkgdir/usr/share/archiso/configs/encryption/"
	cp mkinitcpio.conf "$pkgdir/usr/share/archiso/configs/encryption/airootfs/etc/mkinitcpio.conf"

    mkdir -p "$pkgdir/usr/lib/initcpio/install"
    cp /usr/lib/initcpio/install/archiso "$pkgdir/usr/lib/initcpio/install/archiso-encrypted"
    
    mkdir -p "$pkgdir/usr/share/archiso/configs/encryption/airootfs/usr/lib/initcpio/hooks"
    cp archiso-encrypted "$pkgdir/usr/share/archiso/configs/encryption/airootfs/usr/lib/initcpio/hooks/"

    mkdir -p "$pkgdir/usr/share/archiso/configs/encryption/airootfs/usr/lib/initcpio/install"
    cp /usr/lib/initcpio/install/archiso "$pkgdir/usr/share/archiso/configs/encryption/airootfs/usr/lib/initcpio/install/archiso-encrypted"
}
