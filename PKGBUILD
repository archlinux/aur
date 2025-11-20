# Maintainer: basxto <archlinux basxto de>
# Initial version by Mr.Smith1974

_pkgname=warsmash
pkgname=warsmash-git
pkgver=r592.356f154c
pkgrel=1
pkgdesc="An emulation engine to improve Warcraft III modding. (Original copy required)"
arch=('x86_64')
url="https://github.com/Retera/WarsmashModEngine"
license=('AGPL-3.0-only')
conflicts=()
provides=("$_pkgname")
depends=('java-runtime' 'alsa-lib' 'freetype2' 'libxrender' 'libxi' 'libxtst' 'sh' 'hicolor-icon-theme')
makedepends=('git' 'jdk17-temurin')
source=("${_pkgname}::git+https://github.com/Retera/WarsmashModEngine.git" "warsmash.sh")
#source=("${_pkgname}::git+https://github.com/Retera/WarsmashModEngine.git#commit=356f154c08ac9e0d3cd094feaf4fd7502d6ad481" "warsmash.sh")
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd ${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_pkgname}
	chmod u+x gradlew
	JAVA_HOME=/usr/lib/jvm/java-17-temurin/ ./gradlew --warning-mode all desktop:runtime
}

package(){
	cd ${_pkgname}/desktop/build/image

	install -d "${pkgdir}/opt/${_pkgname}"
	#install -dm777 "${pkgdir}/var/log/${_pkgname}"
	install -d "${pkgdir}/usr/bin"

	install -Dm755 "${srcdir}/warsmash.sh" "${pkgdir}/usr/bin/${_pkgname}"
	cp -r "./lib/" "./legal/" "./include/" "./conf/" "${srcdir}/${_pkgname}/resources/" "${pkgdir}/opt/${_pkgname}/"
	#ln -s "/var/log/${_pkgname}/" "${pkgdir}/opt/${_pkgname}/Logs"
	cd "${srcdir}/${_pkgname}/core/assets/resources/"
	for i in 16 32 64 128;do
		install -d "${pkgdir}/usr/share/icons/hicolor/${i}x${i}"
		install -Dm644 "Icon${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
		ln -s "/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png" "${pkgdir}/opt/${_pkgname}/resources/Icon${i}.png"
	done
}
