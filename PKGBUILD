#Maintainer: paskali <paskali2005 at gmail dot com>
pkgname=infra-arcana
pkgver=21.0.1
pkgrel=1
epoch=
pkgdesc="Roguelike game inspired by H.P. Lovecraft"
arch=('i686' 'x86_64')
url="https://sites.google.com/site/infraarcana/home"
license=('custom:Infra Arcana License')
groups=()
makedepends=(cmake)
depends=('sdl2_image' 'sdl2_mixer' 'hicolor-icon-theme')
conflicts=('infra-arcana-git')

install=${pkgname}.install
source=( "git+https://gitlab.com/martin-tornqvist/ia.git#tag=v""$pkgver"
		"${pkgname}.install"
		"${pkgname}.desktop"
		"${pkgname}.sh")
md5sums=('SKIP'
         'd82f8781f8d1ce1df8c53094ce5c3b27'
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
	install -DTm644 "build/LICENSE-FONT-SPECIAL-ELITE.txt" \
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-FONT-SPECIAL-ELITE.txt"
        install -DTm644 "build/LICENSE-AUDIO.txt"\
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-AUDIO.txt"
        install -DTm644 "build/LICENSE-FONT-DEJAVU.txt"\
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-FONT-DEJAVU.txt"
        install -DTm644 "build/LICENSE-FONTS.txt"\
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-FONTS.txt"
        #install docs
	install -DTm644 "build/contact.txt" \
          "${pkgdir}/usr/share/doc/${pkgname}/contact.txt"
	install -DTm644 "build/credits.txt" \
          "${pkgdir}/usr/share/doc/${pkgname}/credits.txt"
	install -DTm644 "build/release_history.txt" \
          "${pkgdir}/usr/share/doc/${pkgname}/release_history.txt"
	# copy data
        mkdir -p "${pkgdir}/opt/${pkgname}/"
        cp -R build/audio "${pkgdir}/opt/${pkgname}/"
        cp -R build/data "${pkgdir}/opt/${pkgname}/"
        cp -R build/gfx "${pkgdir}/opt/${pkgname}/"
        cp build/manual.txt "${pkgdir}/opt/${pkgname}/"
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
