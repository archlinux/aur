# Maintainer: sukanka <su975853527 at gmail dot com>

_pkgname=BookxNotePro
pkgname=${_pkgname,,}-bin
pkgver=2.0.0.1121
pkgrel=1
pkgdesc="Electronic notebook"
arch=('x86_64')
url="http://www.bookxnote.com"
license=('unknown')
provides=("${_pkgname,,}")
depends=('qt5-base' 'qt5-speech')
makedepends=('patchelf')
source=("local://${_pkgname}_ubuntu_amd64_${pkgver}.deb" #::${url}/setup/BookxNotePro_ubuntu_amd64-${pkgver}.deb"
	"${_pkgname}.sh"
)
sha512sums=('a30db31a6c1877616f90e138ad7e0456f587717aec5f4c7b440fa8a9a9b816e84d56ceb4f3fbf0e4943a9701b9f1108f67605c8988c8232843fa0943d3c6a8a1'
            '0b605046f657ddc9b3c566c022e702ca81bb5cc58aba3fd71d0ae73ce22af1cbc60fbaac6949a09b81fa6ee5f2a2818579a07798e2a92be2f03a1c0e52fcd924')

prepare() {
	cd ${srcdir}
	mkdir -p build
	tar -xf data.tar.xz -C build
	cd build/usr/share/applications
	sed -i "s|^Exec=.*|Exec=${_pkgname} %u|g" ${_pkgname}.desktop
	sed -i "s|^Icon=.*|Icon=${_pkgname}|g" ${_pkgname}.desktop
	cd ${srcdir}/build/usr/local/${_pkgname}
	chmod a+r lang/zh_cn.xml
	patchelf --remove-rpath ${_pkgname}
}

package() {
	cd ${srcdir}/build/usr
	install -Dm644 share/applications/*.desktop -t ${pkgdir}/usr/share/applications/
	install -Dm644 local/${_pkgname}/bxn_pro_logo.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png
	install -d ${pkgdir}/usr/lib/${_pkgname}
	cp -pvrf local/${_pkgname}/{lang,theme,${_pkgname}} ${pkgdir}/usr/lib/${_pkgname}
	install -Dm755 ${srcdir}/${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
}
# vim: ts=2 sw=2 et:
