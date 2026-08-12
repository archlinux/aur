# Maintainer: Alexei Colin <ac@alexeicolin.com>
# Contributor: Florian Ziegler <zieglerflorian fastmail fm>

pkgname=grml2usb
pkgver=0.20.14
pkgrel=1
pkgdesc="Installs one or multiple grml ISOs on an USB device - contains grml2iso"
arch=(x86_64)
url="http://grml.org/grml2usb/"
license=('GPL2')
depends=('python' 'bash' 'python-flake8-isort' 'python-flake8-black' 'python-pyparted')
makedepends=('asciidoc' 'vulture' 'nasm')
optdepends=(
	'cdrkit: creating multiboot ISOs with grml2iso'
	'syslinux: installing boot loader'
	'grub: installing boot loader'
)
source=("https://github.com/grml/grml2usb/archive/v${pkgver}.tar.gz")

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	sed -i'' -e 's#stylesheet/nwalsh#xsl-stylesheets-$(shell pacman -Q docbook-xsl | cut -d " " -f 2 | cut -d "-" -f 1)#g' Makefile doc/Makefile

	sed -i -e "s/PROG_VERSION = '\*\*\*UNKNOWN\*\*\*'/PROG_VERSION = '${pkgver}'/" grml2usb
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	make

	# Does not build:
	#    warning: failed to load external entity "/usr/share/xml/docbook/stylesheet/nwalsh/manpages/docbook.xsl"
	#    cannot parse /usr/share/xml/docbook/stylesheet/nwalsh/manpages/docbook.xsl
	make -C doc

	gzip grml2usb.8
	gzip grml2iso.8
	gzip doc/mbr.8

}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	install -D -m 755 grml2usb ${pkgdir}/usr/bin/grml2usb
	install -D -m 755 grml2iso ${pkgdir}/usr/bin/grml2iso

	install -D -m 644 grml2usb.8.gz ${pkgdir}/usr/share/man/man8/grml2usb.8.gz
	install -D -m 644 grml2iso.8.gz ${pkgdir}/usr/share/man/man8/grml2iso.8.gz
	install -D -m 644 doc/mbr.8.gz ${pkgdir}/usr/share/man/man8/grmlmbr.8.gz

	install -D -m 644 grub/splash.xpm.gz ${pkgdir}/usr/share/grml2usb/grub/splash.xpm.gz
	install -D -m 644 grub/grml.png ${pkgdir}/usr/share/grml2usb/grub/grml.png
}

sha256sums=('e06e42fc5ebed95bb8ed4754fa8d69b009a9d7c7de815447465694f1fe700815')
