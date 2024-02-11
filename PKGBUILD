# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=flare-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Chat with your friends on Signal"
url="https://gitlab.com/schmiddi-on-mobile/$pkgname"
arch=("x86_64")
license=("AGPL3")
depends=("libadwaita" "libsecret" "protobuf" "gtksourceview5")
optdepends=("feedbackd: for vibrating notifications"
	"libspelling-git: for spell-checking support")
source=("https://gitlab.com/schmiddi-on-mobile/flare/-/archive/$pkgver/flare-$pkgver.tar.gz"
	"https://gitlab.com/schmiddi-on-mobile/flare/-/package_files/112823192/download")
sha256sums=("3c0bf3bf152367734e316e5a29ad99447eedd0b443a10e3b0fc3c921603980c4"
	"384683ae18a5ade173a3f1f2e5149062abd33f6c1966a3bb097b7db538952a13")
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
