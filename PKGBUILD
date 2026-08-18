# Maintainer: calamity <calamity dot aur at mailban dot de>
# Contributor: Cobra <najahannah [at] gmail [dot] com>
# Contributor: Michael Lass <bevan@bi-co.net>

pkgname=portfolio-performance
_shortname=portfolio
pkgver=0.87.0
pkgrel=1
pkgdesc='Track your investment portfolio performance – XDG base directory conforming'
arch=('x86_64')
url='https://www.portfolio-performance.info'
license=('EPL-1.0')
depends=('gtk3' 'java-runtime')
makedepends=('archlinux-java-run' 'java-environment=21' 'maven')
optdepends=('webkit2gtk-4.1: pie chart rendering without fallback to SWTChart')
conflicts=('portfolio' 'portfolio-performance-bin')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/buchen/portfolio/archive/${pkgver}.tar.gz"
        'portfolio-performance'
        'portfolio-performance.desktop')
sha1sums=('12f83b68c8a46642df5198387e881f7a4113d0ac'
          '0dd892ac5ad02ad52f12202bc986ee8685acb34e'
          'cacc120b5270555da950e4f3583daa7e1ddba17c')

prepare() {
	cd "${_shortname}-${pkgver}"
	echo 'ewogICJjbGllbnRJZCI6ICJkNmQwdm9xMXcwODFzeHR5MHFxN2EiLAogICJiYXNlVXJsIjogImh0dHBzOi8vYWNjb3VudHMucG9ydGZvbGlvLXBlcmZvcm1hbmNlLmluZm8vb2lkYyIsCiAgImF1dGhFbmRwb2ludCI6ICIvYXV0aCIsCiAgInRva2VuRW5kcG9pbnQiOiAiL3Rva2VuIiwKICAicmV2b2NhdGlvbkVuZHBvaW50IjogIi90b2tlbi9yZXZvY2F0aW9uIiwKICAiYXV0aFNjb3BlIjogIm9wZW5pZCBvZmZsaW5lX2FjY2VzcyIsCiAgImFwaVJlc291cmNlIjogImh0dHBzOi8vYXBpLnBvcnRmb2xpby1wZXJmb3JtYW5jZS5pbmZvIgp9Cgo=' | base64 -d > name.abuchen.portfolio/src/name/abuchen/portfolio/oauth/impl/config.json
}

build() {
	export LC_ALL='C.UTF-8'
	export JAVA_HOME=$(archlinux-java-run --min 21 --max 21 --java-home)
	export MAVEN_OPTS='-Xmx4g'

	cd "${_shortname}-${pkgver}/portfolio-app"
	mvn clean install -Dgenerate-target-platform=true -Dtycho.disableP2Mirrors -Dmaven.repo.local="${srcdir}/.mvn"
}

package() {
	cd "${_shortname}-${pkgver}/portfolio-product/target/products/name.abuchen.portfolio.product/linux/gtk/${CARCH}/portfolio/"

	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	cp -dr --preserve=mode,timestamp * "${pkgdir}/usr/share/${pkgname}/"

	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
