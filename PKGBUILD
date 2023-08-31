_pkgname=warsmash
pkgname=warsmash-git
pkgver=20230823.6814a4c
pkgrel=2
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
	git log -1 --format='%cd.%h' --date=short --abbrev=7 | tr -d -
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
