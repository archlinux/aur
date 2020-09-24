# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
# Contributor: superlex
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Alessandro Sagratini <ale_sagra@hotmail.com>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname=r5u87x
pkgver=64
pkgrel=3
pkgdesc='Userspace module for Ricoh R5U870 OEM cameras'
arch=('i686' 'x86_64')
url='https://bitbucket.org/ahixon/r5u87x'
license=('GPL2')
makedepends=('git')
depends=('glib2' 'libusb-compat')
optdepends=('guile: script for extracting firmware from Windows driver')
source=('git+https://github.com/tmn505/r5u87x.git#commit=6e521e39d60afee08370970d3ccd362ad5541cfe')
sha256sums=('SKIP')

prepare() {
	cd ${srcdir}/${pkgname}
	# fix udev rule
	sed -i 's| --reload||' contrib/90-r5u87x-loader.rules.in
}

build() {
	cd ${srcdir}/${pkgname}
	# set UCODE_PATH because we don't install to default location
	make UCODE_PATH=/usr/lib/firmware/r5u87x-%vid%-%pid%.fw
}

package() {
	cd ${srcdir}/${pkgname}
	make DESTDIR="${pkgdir}" \
		sbindir="/bin" \
		firmdir="/lib/firmware" \
		UDEV_INSTALL="/usr/lib/udev/rules.d" \
		install
	install recode-fw.scm ${pkgdir}/usr/bin
}
