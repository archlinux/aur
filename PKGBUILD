# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname="CalibRaw"
pkgname="${_pkgname,,}-bin"
pkgver=1.3.1
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

source_x86_64=("$url/releases/download/v${pkgver}/CalibRaw-${arch[0]}.AppImage")
source_aarch64=("$url/releases/download/v${pkgver}/CalibRaw-${arch[1]}.AppImage")

sha256sums_x86_64=('57ac3f9b29d2b0f85f468c7b9006c5d71afe94aee5ff97742da180b22bff4ef7')
sha256sums_aarch64=('73196e224d92734bbe4515876edb2077613e32e4dc98da4e87ffa376488b72dd')

_appimagefile="CalibRaw-${CARCH}.AppImage"
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

	install -dm755 ${pkgdir}/usr/share/
	cp -rf usr/share/${_pkgname,,} ${pkgdir}/usr/share/
	find ${pkgdir}/usr/share/${_pkgname,,} -type d -exec chmod 755 {} +
}
