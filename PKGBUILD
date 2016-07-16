# Maintainer: metamer <metamer at openmailbox dot org>
pkgname=infra-arcana
pkgver=18.2
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
source=( "git+https://github.com/martin-tornqvist/ia.git"#"tag=v${pkgver}"
		"rl-utils-numeric-include.patch"
		"room-numeric-include.patch"
		"${pkgname}.install"
		"${pkgname}.desktop"
		"${pkgname}.sh")
md5sums=('SKIP'
         'fd8cacaa622c4363787cff2e575a8938'
         '3c05836d84ad451d5d8034267b21ade8'
         '2bc0fb64e8593e25009b1dc50e642cd8'
         '2e28c2803d7d2cd4376dcd3aa6512774'
         '87294b81f5a2f98a78d318a5dcec7caf')

prepare(){
	cd $srcdir/"ia"
	cd src
	patch -uN room.cpp $srcdir/room-numeric-include.patch
	cd $srcdir/"ia"
	git submodule init
	git submodule update
	cd rl_utils/src
	patch -uN rl_utils.cpp $srcdir/rl-utils-numeric-include.patch
}

build() {
	cd $srcdir/"ia"
	make
}

package() {
	cd "ia"
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
        install -Dm644 "${srcdir}/${pkgname}.desktop" \
          "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
