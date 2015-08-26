# Maintainer: metamer <metamer at openmailbox dot org>
pkgname=infra-arcana
pkgver=17.0
pkgrel=1
epoch=
pkgdesc="Roguelike game inspired by H.P. Lovecraft"
arch=('i686' 'x86_64')
url="https://sites.google.com/site/infraarcana/home"
license=('custom:Infra Arcana License')
groups=()
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf')
#checkdepends=('valgrind')
backup=()
options=()
install=
source=("https://github.com/InfraArcana/ia/archive/v${pkgver}.zip"
        "${pkgname}-functionalinclude.diff"
		"${pkgname}.sh")
md5sums=("bbc7c22d0b8c0bca002597a7b3c7a289"
"6764e7e92ddfeb06ed74fb24dd3988cd"
"87294b81f5a2f98a78d318a5dcec7caf"
)

prepare() {
	patch -uNp1 -i "${pkgname}-functionalinclude.diff" || return 1
}

build() {
	cd "ia-${pkgver}"
	make
}

package() {
	cd "ia-$pkgver"

	install -DTm644 "target/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

	mkdir -p "${pkgdir}/opt/${pkgname}/"
	cp -R target/* "${pkgdir}/opt/${pkgname}/"
	chmod a+w "${pkgdir}/opt/${pkgname}/data/save"

	# this shell script is required as the compiled binary relies on relative references
	install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

}
