# Maintainer: Xuelin Yang <xuelin@adamanteye.cc>
# Contributor: Yigit Dallilar <yigit.dallilar@gmail.com>
pkgname=astroimagej
pkgver=6.0.7.02
pkgrel=1
pkgdesc="A simple and powerful tool for astronomical image analysis and precise photometry."
arch=('x86_64')
url="https://github.com/AstroImageJ/astroimagej"
license=('GPL')
depends=('java-runtime>=25')
makedepends=('gradle' 'jdk17-openjdk' 'jdk25-openjdk')
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
	"aij"
	"astroimagej.desktop"
)
sha256sums=(
	'0cefe4af359ca3b68630f3bdeac1cc4bebfd20b0f4094493b5abb18edca4aa88'
	'2862d88ade6f411c7d013a542a9adfb89bf87a63d7dcddc9940b54fdf7551b6d'
	'1b32cc64c00ce92daef1d14bfaf37868f4d0f3b4949f1d5a824cf32aee1c1f87'
)

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export GRADLE_USER_HOME="${srcdir}/.gradle"
	gradle -Dorg.gradle.java.installations.auto-download=false commonFiles \
		-Pversion="${pkgver}" \
		-PreleaseType=RELEASE \
		--no-daemon
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -dm755 "${pkgdir}/opt/${pkgname}"
	cp -a build/commonFiles/. "${pkgdir}/opt/${pkgname}/"

	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "packageFiles/assets/linux/AstroImageJ.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm755 "${srcdir}/aij" "${pkgdir}/usr/bin/aij"
}
