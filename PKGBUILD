# Maintainer: Pedro Montes Alcalde <pedro.montes.alcalde@gmail.com>
# Contributor: Pedro Montes Alcalde <pedro.montes.alcalde@gmail.com>
_pkgname="vita3k"
pkgname="${_pkgname}-bin"
pkgver=r3109.b7b52e27
pkgrel=1
pkgdesc="Experimental PlayStation Vita emulator"
arch=('x86_64')
url="https://vita3k.org/"
license=('GPL2')
depends=(
	'gtk3'
	'sdl2'
	'unzip'
	'xdg-desktop-portal'
)
optdepends=(
	'vulkan-validation-layers: Descriptive vulkan errors'
)
provides=('vita3k')
conflicts=('vita3k')
source=(
	"${_pkgname}.zip::https://github.com/Vita3K/Vita3K/releases/download/continuous/ubuntu-latest.zip"
	"vita3k.desktop"
)
b2sums=(
	'SKIP'
	'6331bd061fe93fea5fb9ae57667cdb7ff081efa27681e25b94c54da748809e52d933afa96465b7d14ca0d286b0c47e66328a5080acef6760a88a39c65bf2321c'
)

package() {
	unzip vita3k.zip -d bin
	mkdir -p "${pkgdir}/usr/bin/" "${pkgdir}/opt/vita3k/"

	cp -r "bin/"* "${pkgdir}/opt/vita3k/"
	cd "${srcdir}"
	ln -s "/opt/vita3k/Vita3K" "${pkgdir}/usr/bin/vita3k"

	# These folders needs 777 permissions because vita3k creates files in them
	chmod 777 "${pkgdir}/opt/vita3k/"
	chmod 777 "${pkgdir}/opt/vita3k/data"
	chmod 755 "${pkgdir}/opt/vita3k/Vita3K"

	# Provided blob doesn't have README.md
	install -Dm644 "data/image/icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
	install -Dm644 "${srcdir}/vita3k.desktop" "${pkgdir}/usr/share/applications/vita3k.desktop"

	rm vita3k.zip
}
