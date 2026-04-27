# Maintainer: Emily Ellis <emily@uni.horse>

pkgname=circuitjs-electron-git
pkgver=r1907.17c517b
pkgrel=1
pkgdesc="Falstad circuit simulator (CircuitJS1), git HEAD, with Electron wrapper"
arch=('any')
url="https://www.falstad.com/circuit/"

license=('GPL-2.0-or-later')

depends=(electron)
makedepends=(
	git
	jdk21-openjdk # included gradle wrapper is too old to support newer java versions
)
source=(
	git+https://github.com/pfalstad/circuitjs1.git
	circuitjs.desktop
	circuitjs
)

sha1sums=(
	'SKIP'
	'fc64f94777891f25521ed5b447bd6f1db8e4ab86'
	'69721990fa2a3fb3bb73e436f70f55d5842b8334'
)

pkgver() {
	cd "${srcdir}/circuitjs1"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${srcdir}/circuitjs1"
	
	export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
	export PATH="$JAVA_HOME/bin:$PATH"

	./gradlew compileGwt --console verbose --info
	./gradlew makeSite --console verbose --info
}

package() {
	install -d "${pkgdir}/opt"
	cp -R "${srcdir}/circuitjs1/site" "${pkgdir}/opt/circuitjs"
	install -d "${pkgdir}/usr/share/applications"
	install "${srcdir}/circuitjs.desktop" "${pkgdir}/usr/share/applications/"
	install -d "${pkgdir}/usr/bin"
	install "${srcdir}/circuitjs" "${pkgdir}/usr/bin/"
}
