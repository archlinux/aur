#Maintainer: paskali <paskali2005 at gmail dot com>
pkgname=infra-arcana
pkgver=20.0
pkgrel=0
epoch=
pkgdesc="Roguelike game inspired by H.P. Lovecraft"
arch=('i686' 'x86_64')
url="https://sites.google.com/site/infraarcana/home"
license=('custom:Infra Arcana License')
groups=()
makedepends=(cmake)
depends=('sdl2_image' 'sdl2_mixer' 'hicolor-icon-theme')
conflicst=('infra-arcana-git')

install=${pkgname}.install
source=( "git+https://gitlab.com/martin-tornqvist/ia.git#tag=v""$pkgver"
		"${pkgname}.install"
		"${pkgname}.desktop"
		"${pkgname}.sh")
md5sums=('SKIP'
         '7c9b6d90f53be077e6f6c93b251f64ba'
         '2e28c2803d7d2cd4376dcd3aa6512774'
         '87294b81f5a2f98a78d318a5dcec7caf')

prepare(){
	cd $srcdir/ia
}

build() {
	cd $srcdir/"ia"
	mkdir -p build && cd build
	cmake ..
	make ia
}

package() {
	cd "ia"
        #install licenses
	install -DTm644 "build/LICENSE.txt"\
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
	install -DTm644 "build/gfx/fonts/SPECIAL_ELITE_License.txt" \
          "${pkgdir}/usr/share/licenses/${pkgname}/SPECIAL_ELITE_License.txt"
        install -DTm644 "build/README-AUDIO-FILES.txt"\
          "${pkgdir}/usr/share/licenses/${pkgname}/README-AUDIO-FILES.txt"
        #install docs
	install -DTm644 "build/contact.txt" \
          "${pkgdir}/usr/share/doc/${pkgname}/contact.txt"
	install -DTm644 "build/credits.txt" \
          "${pkgdir}/usr/share/doc/${pkgname}/credits.txt"
	install -DTm644 "build/manual.txt" \
          "${pkgdir}/usr/share/doc/${pkgname}/manual.txt"
	install -DTm644 "build/release_history.txt" \
          "${pkgdir}/usr/share/doc/${pkgname}/release_history.txt"
	# copy data
        mkdir -p "${pkgdir}/opt/${pkgname}/"
        cp -R build/audio "${pkgdir}/opt/${pkgname}/"
        cp -R build/data "${pkgdir}/opt/${pkgname}/"
        cp -R build/gfx "${pkgdir}/opt/${pkgname}/"
	# copy main binary
	cp build/ia "${pkgdir}/opt/${pkgname}/"
        # this shell script is required as the compiled binary relies on
        # relative references
        install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
        #install icon
        install -Dm644 "icon/icon.ico" \
          "$pkgdir/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
        install -Dm644 "${srcdir}/${pkgname}.desktop" \
          "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
