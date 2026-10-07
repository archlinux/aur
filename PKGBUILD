# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname="CalibRaw"
pkgname="${_pkgname,,}-bin"
pkgver=1.2.0
pkgrel=1
pkgdesc="CalibRaw is a fast, non-destructive, GPU-accelerated RAW photo editor"

url="https://github.com/Duecki1/CalibRaw"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')

depends=(
  'libraw'
  'lensfun'
)

provides=("${_pkgname}")
conflicts=("${pkgname%-bin}")

source_x86_64=("$url/releases/download/v${pkgver}/CalibRaw-${pkgver}-${arch[0]}.AppImage")
source_aarch64=("$url/releases/download/v${pkgver}/CalibRaw-${pkgver}-${arch[1]}.AppImage")

sha256sums_x86_64=('08dc3c853af02af89503987c9cfbfe44cbf031ef7c2b2ca74347e978626f27b2')
sha256sums_aarch64=('b28d40e0665d91d8fc7342e22b0064b95346de9b9435f3c68ec5a8209002f406')

_appimagefile="CalibRaw-${pkgver}-${CARCH}.AppImage"
_root='squashfs-root'

prepare() {
	cd "${srcdir}/" || exit

	chmod +x "${_appimagefile}"

	./"${_appimagefile}" --appimage-extract

	mv ${_root}/usr/bin/${_pkgname,,} ${_root}/usr/bin/${_pkgname}

	sed -e "s|Exec=${_pkgname,,}|Exec=${_pkgname}|g" -i ${_root}/usr/share/applications/*.desktop
}

package() {
	cd "${srcdir}/${_root}/" || exit

	install -Dm755 usr/bin/${_pkgname} -t ${pkgdir}/usr/bin/

	find usr/share/applications/ -type f -exec install -Dm644 {} ${pkgdir}/{} \;
	find usr/share/icons/ -type f -exec install -Dm644 {} ${pkgdir}/{} \;

	install -dm755 ${pkgdir}/usr/share/${_pkgname,,}/
	cp -rf usr/share/${_pkgname,,} ${pkgdir}/usr/share/
}
