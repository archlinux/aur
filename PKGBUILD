# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor="Duecki1"
_pkgname="CalibRaw"
pkgname="${_pkgname,,}-bin"
pkgver=1.4.1
pkgrel=1
pkgdesc="CalibRaw is a fast, non-destructive, GPU-accelerated RAW photo editor"

url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')

makedepends=('libappimage')
depends=('glibc' 'libgcc' 'libstdc++' 'glib2' 'pcre2' 'libjpeg-turbo' 'libgomp' 'zlib' 'hicolor-icon-theme')

provides=("${_pkgname}")
conflicts=("${pkgname%-bin}")

source_x86_64=("$url/releases/download/v${pkgver}/${_pkgname}-${arch[0]}.AppImage")
source_aarch64=("$url/releases/download/v${pkgver}/${_pkgname}-${arch[1]}.AppImage")

sha256sums_x86_64=('cd9b663a2902c7ebfd120e676eee993dd0a3c86da995f0a1444a40cdfee06455')
sha256sums_aarch64=('27a71b95703059ac3d952e9dddf0dbe83e3e42eb15ed5fe05d2f568eca04e934')

_appimagefile="${_pkgname}-${CARCH}.AppImage"
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
