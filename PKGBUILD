# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=applecommander
_pkgname=AppleCommander
pkgver=1.6.0
pkgrel=1
pkgdesc="Tool that manipulates Apple ][ disk images"
arch=(x86_64)
url="https://applecommander.github.io/"
license=('GPL2')
depends=(bash java-runtime)
optdepends=('gtk3: Graphical User Interface')
makedepends=(archlinux-java-run "java-environment<12")
source=(https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver//./-}.tar.gz
        applecommander.sh
        applecommander-gui.sh)
sha256sums=('246cdf31812a9034d1b8f1492d48560ef65e5a2cf13ee873522ded3980c5f627'
            '193dc3a0f5a73a371997ff837b7222edb4d52cf22a70431dedcfd7821dbbb879'
            '52a269fbc7aea2f354b6a0c6d0deff8e01c41a5021cf946542cdfadd2a392ead')

# gradle 5.6.2 does not support newer JDKs
export JAVA_HOME=$(archlinux-java-run -f jdk -b 11 -j)

build() {
	cd "${_pkgname}-${pkgver//./-}"
	./gradlew --no-daemon clean assemble
}

package() {
	# launch scripts
	install -Dm 755 applecommander.sh "$pkgdir"/usr/bin/applecommander
	install -Dm 755 applecommander-gui.sh "$pkgdir"/usr/bin/applecommander-gui

	# jar files
	cd "${_pkgname}-${pkgver//./-}"/build/libs
	install -Dm 644 ${_pkgname}-${pkgver//./-}-ac-${pkgver}.jar "$pkgdir"/usr/share/java/$pkgname/${_pkgname}-ac.jar
	install -Dm 644 ${_pkgname}-${pkgver//./-}-linux64-gtk-${pkgver}.jar "$pkgdir"/usr/share/java/$pkgname/${_pkgname}-linux64-gtk.jar
}
