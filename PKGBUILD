# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=flare-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Chat with your friends on Signal"
url="https://gitlab.com/schmiddi-on-mobile/$pkgname"
arch=("x86_64")
license=("AGPL3")
depends=("libadwaita" "libsecret" "protobuf" "gtksourceview5")
optdepends=("feedbackd: for vibrating notifications"
	"libspelling-git: for spell-checking support")
source=("https://gitlab.com/schmiddi-on-mobile/flare/-/archive/$pkgver/flare-$pkgver.tar.gz"
	"https://gitlab.com/schmiddi-on-mobile/flare/-/package_files/90580214/download")
sha256sums=("c34d1531bdf4a30c0a68a05f66465f26b726a392cc08b9b3267b60f73319b23e"
	"6ccdcc28100b25846be973a4a6e17d170f2da9989e11aa8386908657f0aa8c91")
conflicts=("flare")
provides=("flare")

package() {
	install -d "${pkgdir}"/usr/bin
	install -d "${pkgdir}"/usr/share/applications
	install -d "${pkgdir}"/usr/share/dbus-1/services
	install -d "${pkgdir}"/usr/share/glib-2.0/schemas
	install -d "${pkgdir}"/usr/share/icons/hicolor/scalable/apps
	install -d "${pkgdir}"/usr/share/icons/hicolor/symbolic/apps
	install -d "${pkgdir}"/usr/share/metainfo
	for lingua in $(cat "${srcdir}"/flare-$pkgver/po/LINGUAS); do install -d "${pkgdir}"/usr/share/locale/$lingua/LC_MESSAGES; done

	cp "${srcdir}"/download "${pkgdir}"/usr/bin/flare
	cp "${srcdir}"/flare-$pkgver/data/de.schmidhuberj.Flare.desktop.in.in "${pkgdir}"/usr/share/applications/de.schmidhuberj.Flare.desktop
	cp "${srcdir}"/flare-$pkgver/data/de.schmidhuberj.Flare.service.in "${pkgdir}"/usr/share/dbus-1/services/de.schmidhuberj.Flare.service
	cp "${srcdir}"/flare-$pkgver/data/de.schmidhuberj.Flare.gschema.xml "${pkgdir}"/usr/share/glib-2.0/schemas/
	cp "${srcdir}"/flare-$pkgver/data/icons/de.schmidhuberj.Flare.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/
	cp "${srcdir}"/flare-$pkgver/data/icons/de.schmidhuberj.Flare-symbolic.svg "${pkgdir}"/usr/share/icons/hicolor/symbolic/apps/
	cp "${srcdir}"/flare-$pkgver/data/de.schmidhuberj.Flare.metainfo.xml "${pkgdir}"/usr/share/metainfo/

	chmod +x "${pkgdir}"/usr/bin/flare

	sed -i 's/@bindir@/\/usr\/bin/' "${pkgdir}"/usr/share/applications/de.schmidhuberj.Flare.desktop
	sed -i 's/@bindir@/\/usr\/bin/' "${pkgdir}"/usr/share/dbus-1/services/de.schmidhuberj.Flare.service
	sed -i 's/@appid@/de.schmidhuberj.Flare/' "${pkgdir}"/usr/share/dbus-1/services/de.schmidhuberj.Flare.service
	
	for lingua in $(cat "${srcdir}"/flare-$pkgver/po/LINGUAS); do msgfmt "${srcdir}"/flare-$pkgver/po/$lingua.po -o "${pkgdir}"/usr/share/locale/$lingua/LC_MESSAGES/flare.mo; done
}
