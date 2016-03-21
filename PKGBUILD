# Maintainer: metamer <metamer at openmailbox dot org>
pkgname=infra-arcana
pkgver=18.1
pkgrel=1
epoch=
pkgdesc="Roguelike game inspired by H.P. Lovecraft"
arch=('i686' 'x86_64')
url="https://sites.google.com/site/infraarcana/home"
license=('custom:Infra Arcana License')
groups=()
depends=('sdl2_image' 'sdl2_mixer' 'hicolor-icon-theme')
#checkdepends=('valgrind')
backup=()
options=()
install=${pkgname}.install
source=("https://github.com/InfraArcana/ia/archive/v${pkgver}.zip"
		"${pkgname}.install"
		"${pkgname}.sh")
md5sums=('fc6561591d30b7af0d86390ee547bd4a'
         '16afb02e73700171bb2b88e03ef9a5ea'
         '87294b81f5a2f98a78d318a5dcec7caf')

build() {
	cd "ia-${pkgver}"
	make
}

package() {
	cd "ia-$pkgver"
        #install licenses
	install -DTm644 "target/license.txt"\
          "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
	install -DTm644 "target/images/SPECIAL_ELITE_License.txt" \
          "${pkgdir}/usr/share/licenses/${pkgname}/SPECIAL_ELITE_License.txt"
        #install docs
	install -DTm644 "target/contact.txt" \
          "${pkgdir}/usr/share/doc/${pkgname}/contact.txt"
	install -DTm644 "target/credits.txt" \
          "${pkgdir}/usr/share/doc/${pkgname}/credits.txt"
	install -DTm644 "target/manual.txt" \
          "${pkgdir}/usr/share/doc/${pkgname}/manual.txt"
	install -DTm644 "target/release_history.txt" \
          "${pkgdir}/usr/share/doc/${pkgname}/release_history.txt"
        #make dir for save game storage
        mkdir -p "${pkgdir}/var/lib"
        install -dm775 -g games "${pkgdir}/var/lib/${pkgname}"
        install -dm775 -g games "${pkgdir}/var/lib/${pkgname}/data"
        #move target
	mkdir -p "${pkgdir}/opt/${pkgname}/"
	cp -R target/* "${pkgdir}/opt/${pkgname}/"
        #link savegame folder
	rm -rf  "${pkgdir}/opt/${pkgname}/data"
        ln -s "/var/lib/${pkgname}/data" "${pkgdir}/opt/${pkgname}"
        # this shell script is required as the compiled binary relies on
        # relative references
        install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
        #install icon
        install -Dm644 "icon/icon.ico" \
          "$pkgdir/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
}
