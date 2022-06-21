# Maintainer: Marek Setnik <setnikmarek99@gmail.com>
_pkgbase=t150_driver
pkgname="${_pkgbase}-dkms-git"
pkgver=0.7c.r137.a47b1bc
pkgrel=1
pkgdesc="Thrustmaster T150 Force Feedback Wheel Linux drivers"
arch=('x86_64')
url="https://github.com/scarburato/${_pkgbase}"
license=('GPL-2.0')
depends=('dkms')
makedepends=('git')
provides=("t150_driver-dkms=${pkgver}")
conflicts=("t150_driver-dkms")
install=$_pkgbase.install
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgbase"
	printf "0.7c.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mv "${_pkgbase}/dkms_make.mak" "${_pkgbase}/Makefile"
	mkdir "hid-tminit"
	git clone https://github.com/scarburato/hid-tminit "${_pkgbase}/hid-tminit"
	install -Dm644 ${_pkgbase}/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  	sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      	-e "s/@PKGVER@/${pkgver}/" \
      	-i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  	cp -r ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

	install -D "${_pkgbase}/files/etc/udev/rules.d/10-t150.rules" -t "$pkgdir/usr/lib/udev/rules.d/"
}
