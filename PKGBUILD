# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
# Contributor: superlex
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Alessandro Sagratini <ale_sagra@hotmail.com>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname=r5u87x
pkgver=64
pkgrel=2
pkgdesc='Userspace module for Ricoh R5U870 OEM cameras'
arch=('i686' 'x86_64')
url='https://bitbucket.org/ahixon/r5u87x'
license=('GPL2')
depends=('glib2' 'libusb-compat')
optdepends=('guile: script for extracting firmware from Windows driver')
source=('https://launchpadlibrarian.net/82424811/r5u87x_0.2.1+r64+dfsg1.orig.tar.gz')
sha256sums=('0a4f8034e97d7fec72f90af1361a9f7809a39bab18c3f6a040c78c71f6f0bc1e')

prepare() {
	cd ${srcdir}/${pkgname}-0.2.1+r${pkgver}+dfsg1
	# fix udev rule
	sed -i 's| --reload||' contrib/90-r5u87x-loader.rules.in
}

build() {
	cd ${srcdir}/${pkgname}-0.2.1+r${pkgver}+dfsg1
	# set UCODE_PATH because we don't install to default location
	make UCODE_PATH=/usr/lib/firmware/r5u87x-%vid%-%pid%.fw
}

package() {
	cd ${srcdir}/${pkgname}-0.2.1+r${pkgver}+dfsg1
	make DESTDIR="${pkgdir}" \
		sbindir="/bin" \
		firmdir="/lib/firmware" \
		UDEV_INSTALL="/usr/lib/udev/rules.d" \
		install
	install recode-fw.scm ${pkgdir}/usr/bin
}
