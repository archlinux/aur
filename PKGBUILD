# Maintainer: Zach Jaggi <feilen1000@gmail.com>
# Contributor: Christoph Haag <haagch at studi.informatik.uni-stuttgart.de>

pkgname=oculus-rift-sdk
_basename=ovr_sdk_linux
pkgver=0.5.0.1
pkgrel=1
pkgdesc="Oculus Rift SDK official version."
arch=('x86_64')
url="https://developer.oculus.com"
license=('custom')
optdepends=("libudev.so.0: The closed config utility is linked against libudev.so.0"
        "oculus-udev: Udev rule to make the rift sensors usable to the user \"plugdev\"")
conflicts=('oculus-rift-sdk-jherico-git')
options=('staticlibs')

source=("http://static.oculus.com/sdk-downloads/${_basename}_${pkgver}.tar.xz"
		"OculusWorldDemo.sh"
		"ovrd.desktop")
md5sums=('a57b71f94d9a2eca9629a3ec63ea2cf4'
         '7878667978694c58e6691df1c86b071f'
         '2f10af2067a3201d4d460226f4cfb43a')

build() {
	cd ${srcdir}/${_basename}_${pkgver}
	make PREFIX=/usr/${pkgdir} release
}

package() {
	cd ${srcdir}/${_basename}_${pkgver}
	mkdir -p ${pkgdir}/usr
	make PREFIX=${pkgdir}/usr install

	install -d "$pkgdir/etc/xdg/autostart"
	install -m644 "${srcdir}/ovrd.desktop" "$pkgdir/etc/xdg/autostart/ovrd.desktop"

	#Make Tuscany demo work as intended
	mv "${pkgdir}/usr/bin/OculusWorldDemo" "${pkgdir}/usr/share/OculusWorldDemo"
	install -m755 "${srcdir}/OculusWorldDemo.sh" "$pkgdir/usr/bin/OculusWorldDemo"
}

# vim:set ts=2 sw=2 et:
