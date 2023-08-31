_pkgname=warsmash
pkgname=warsmash-git
pkgver=r346.6814a4c
pkgrel=1
pkgdesc="An emulation engine to improve Warcraft III modding. (Original copy required)"
arch=('x86_64')
url="https://github.com/Retera/WarsmashModEngine"
license=('MIT')
conflicts=()
depends=('java-runtime')
makedepends=('git' 'jdk17-temurin')
source=("${_pkgname}::git+https://github.com/Retera/WarsmashModEngine.git")
sha256sums=('SKIP')


pkgver() {
	cd ${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_pkgname}
	chmod u+x gradlew
	./gradlew desktop:runtime

	cd "${srcdir}/${_pkgname}/desktop/build/image/"
	"./bin/warsmash"
}

package(){
	cd ${_pkgname}

	mkdir -p "$pkgdir/opt/${_pkgname}"
        mkdir -p "$pkgdir/usr/bin"
        mkdir -p "$pkgdir/usr/share/applications"

	_pkgver=$(find ${srcdir}/warsmash/releases/ -iname "warsmash-*" -type d)
	install -m755 "${srcdir}/${_pkgname}/core/exe/warsmash" "${pkgdir}/usr/bin/${_pkgname}"
        install -m755 "${srcdir}/${_pkgname}/core/exe/warsmash.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
	cd "${_pkgver}"
	mv * "${pkgdir}/opt/${_pkgname}"
}
