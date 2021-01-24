# Maintainer: Alexei Colin <ac@alexeicolin.com>
# Contributor: Florian Ziegler <zieglerflorian fastmail fm>

pkgname=grml2usb
pkgver=0.18.5
pkgrel=1
pkgdesc="Installs one or multiple grml ISOs on an USB device - contains grml2iso"
arch=(x86_64)
url="http://grml.org/grml2usb/"
license=('GPL2')
depends=('python' 'bash' 'python-flake8-isort' 'python-flake8-black')
makedepends=('asciidoc')
optdepends=(
	'cdrkit: creating multiboot ISOs with grml2iso'
	'syslinux: installing boot loader'
	'grub: installing boot loader'
)
source=("https://github.com/grml/grml2usb/archive/v${pkgver}.tar.gz")

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	sed -i'' -e 's#stylesheet/nwalsh#xsl-stylesheets-$(shell pacman -Q docbook-xsl | cut -d " " -f 2 | cut -d "-" -f 1)#g' Makefile

	sed -i -e "s/PROG_VERSION = '\*\*\*UNKNOWN\*\*\*'/PROG_VERSION = '${pkgver}'/" grml2usb
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	make
	make -C mbr

	gzip grml2usb.8
	gzip grml2iso.8

}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	install -D -m 755 grml2usb ${pkgdir}/usr/bin/grml2usb
	install -D -m 755 grml2iso ${pkgdir}/usr/bin/grml2iso

	install -D -m 644 grml2usb.8.gz ${pkgdir}/usr/share/man/man8/grml2usb.8.gz
	install -D -m 644 grml2iso.8.gz ${pkgdir}/usr/share/man/man8/grml2iso.8.gz

	install -D -m 644 grub/splash.xpm.gz ${pkgdir}/usr/share/grml2usb/grub/splash.xpm.gz
	install -D -m 644 grub/grml.png ${pkgdir}/usr/share/grml2usb/grub/grml.png

	install -D -m 644 mbr/mbrmgr ${pkgdir}/usr/share/grml2usb/mbr/mbrmgr
	install -D -m 644 mbr/mbrldr ${pkgdir}/usr/share/grml2usb/mbr/mbrldr
}

sha256sums=('ceef66aa1d6bee918a26966b47c211f42142df78bd757301086f4c751fce65b3')
