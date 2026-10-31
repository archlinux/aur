# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname="CalibRaw"
pkgname="${_pkgname,,}-bin"
pkgver=1.4.0
pkgrel=2
pkgdesc="CalibRaw is a fast, non-destructive, GPU-accelerated RAW photo editor"

url="https://github.com/Duecki1/CalibRaw"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')

depends=('glibc' 'libgcc' 'libstdc++' 'glib2' 'pcre2' 'libjpeg-turbo' 'libgomp' 'zlib' 'hicolor-icon-theme')

provides=("${_pkgname}")
conflicts=("${pkgname%-bin}")

source_x86_64=("$url/releases/download/v${pkgver}/CalibRaw-${arch[0]}.AppImage")
source_aarch64=("$url/releases/download/v${pkgver}/CalibRaw-${arch[1]}.AppImage")

sha256sums_x86_64=('4baa19518a6480f4387fc3462ca40e818d44b71b6205b8d75b85ba9eb5966965')
sha256sums_aarch64=('ee1c39f06f335ac83af62ce653f13cd05025e018571dcfab04e8778279fd21d9')

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

	install -Dm755 usr/lib/libraw.so.26 -t ${pkgdir}/usr/lib/
	install -Dm755 usr/lib/liblensfun.so.2 -t ${pkgdir}/usr/lib/

	find usr/share/applications/ -type f -exec install -Dm644 {} ${pkgdir}/{} \;
	find usr/share/icons/ -type f -exec install -Dm644 {} ${pkgdir}/{} \;

	install -dm755 ${pkgdir}/usr/share/
	cp -rf usr/share/${_pkgname,,} ${pkgdir}/usr/share/
	find ${pkgdir}/usr/share/${_pkgname,,} -type d -exec chmod 755 {} +
}
