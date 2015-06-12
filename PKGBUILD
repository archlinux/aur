# Maintainer: Mitsu <archlinux AT suumitsu DOT eu>

pkgname="svgcleaner"
pkgver=0.6.2
pkgrel=3
pkgdesc="An application that cleans svg images from unnecessary data in batch mode."
provides=("svg-cleaner")
arch=("i686" "x86_64")
url="https://launchpad.net/svg-cleaner"
license=("GPL3")
makedepends=("qt4")
depends=("p7zip" "qt4")
source=("svgcleaner.install"
	"https://github.com/RazrFalcon/SVGCleaner/archive/v${pkgver}.tar.gz")
install="svgcleaner.install"
sha512sums=('938b5a1ab4a90512f1d25190cb4c246ee565aca841b8172fa93da81b0820d69c1598593ffcf44fee9c4be5f153e90f89ff09a32ad95a28eff16ed1b623b459a0'
	'37815f456d93d59301be765050b4c96851f4adfb16f86febbb597d707d74df4ec5b2fd5d45c48a94e98a7c32d435b265cf8c9fcafcf0c748efcc8b0407afa9d7')

build() {
	cd "${srcdir}/SVGCleaner-${pkgver}/src/cli/"
	qmake-qt4 cli.pro CONFIG+="release"
	make -j $(nproc)

	# fix lrelease name
	cd "${srcdir}/SVGCleaner-${pkgver}"
	sed 's/QMAKE_LRELEASE = lrelease/QMAKE_LRELEASE = lrelease-qt4/' -i translations/translations.pri

	cd "${srcdir}/SVGCleaner-${pkgver}/src/gui/"
	qmake-qt4 gui.pro CONFIG+="release"
	make -j $(nproc)
}

package() {
	cd "${srcdir}/SVGCleaner-${pkgver}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/svgcleaner/presets"
	mkdir -p "${pkgdir}/usr/share/svgcleaner/translations"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
	mkdir -p "${pkgdir}/usr/share/applications/"
	install -Dm755 "bin/svgcleaner-cli" "${pkgdir}/usr/bin/svgcleaner-cli"
	install -Dm755 "bin/svgcleaner-gui" "${pkgdir}/usr/bin/svgcleaner-gui"
	install -Dm644 "translations/svgcleaner_cs.ts" "${pkgdir}/usr/share/svgcleaner/translations/svgcleaner_cs.ts"
	install -Dm644 "translations/svgcleaner_de.ts" "${pkgdir}/usr/share/svgcleaner/translations/svgcleaner_de.ts"
	install -Dm644 "translations/svgcleaner_fr.ts" "${pkgdir}/usr/share/svgcleaner/translations/svgcleaner_fr.ts"
	install -Dm644 "translations/svgcleaner_it.ts" "${pkgdir}/usr/share/svgcleaner/translations/svgcleaner_it.ts"
	install -Dm644 "translations/svgcleaner_ru.ts" "${pkgdir}/usr/share/svgcleaner/translations/svgcleaner_ru.ts"
	install -Dm644 "translations/svgcleaner_uk.ts" "${pkgdir}/usr/share/svgcleaner/translations/svgcleaner_uk.ts"

	install -Dm644 "icons/svgcleaner.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/svgcleaner.svg"
	install -Dm644 "svgcleaner.desktop" "${pkgdir}/usr/share/applications/svgcleaner.desktop"
}
