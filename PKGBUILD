# Maintainer: Cobra <najahannah [at] gmail [dot] com>
# Maintainer: Michael Lass <bevan@bi-co.net>

pkgname=portfolio
pkgver=0.85.0
pkgrel=1
pkgdesc="Track your portfolio performance (finance)"
arch=('i686' 'x86_64')
url="https://github.com/portfolio-performance/portfolio"
license=('EPL-1.0')
depends=('archlinux-java-run' 'java-environment=21')
makedepends=('gendesk')
optdepends=('webkit2gtk-4.1: pie chart rendering without fallback to SWTChart')

_DEST="/usr/share/portfolio"

[ "$CARCH" = "i686" ]   && _platform="x86"
[ "$CARCH" = "x86_64" ] && _platform="x86_64"

_mvnver=3.9.16

source=("https://github.com/buchen/portfolio/archive/$pkgver.tar.gz"
        "https://dlcdn.apache.org/maven/maven-3/$_mvnver/binaries/apache-maven-$_mvnver-bin.tar.gz"
        "portfolio.sh")
sha1sums=('e068a7cde9a0ad1801258cdc5869ab4de38c4dbf'
          'a55820cac786c44c329462c7b5591d0a663d53bb'
          '044c48a939e20311b27a1bbbd98d4866ee3eff3c')

prepare() {
	gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
		--name="Portfolio Performance" \
		--genericname="Personal finance" \
		--exec="portfolio %f" \
		--categories="Office;Finance" \
		--terminal="False" \
		--startupnotify="False" \
		--icon="/usr/share/portfolio/icon.xpm" \
		--custom="StartupWMClass=Portfolio Performance"

    cd $pkgname-$pkgver
    echo 'ewogICJjbGllbnRJZCI6ICJkNmQwdm9xMXcwODFzeHR5MHFxN2EiLAogICJiYXNlVXJsIjogImh0dHBzOi8vYWNjb3VudHMucG9ydGZvbGlvLXBlcmZvcm1hbmNlLmluZm8vb2lkYyIsCiAgImF1dGhFbmRwb2ludCI6ICIvYXV0aCIsCiAgInRva2VuRW5kcG9pbnQiOiAiL3Rva2VuIiwKICAicmV2b2NhdGlvbkVuZHBvaW50IjogIi90b2tlbi9yZXZvY2F0aW9uIiwKICAiYXV0aFNjb3BlIjogIm9wZW5pZCBvZmZsaW5lX2FjY2VzcyIsCiAgImFwaVJlc291cmNlIjogImh0dHBzOi8vYXBpLnBvcnRmb2xpby1wZXJmb3JtYW5jZS5pbmZvIgp9Cgo=' | base64 -d > name.abuchen.portfolio/src/name/abuchen/portfolio/oauth/impl/config.json
}

build() {
    export MAVEN_OPTS="-Xmx4g"
    export JAVA_HOME=$(archlinux-java-run --min 21 --max 21 --java-home)
    export PATH="$srcdir/apache-maven-$_mvnver/bin:$PATH"
    cd $pkgname-$pkgver

    cd portfolio-app
    mvn clean install -Dgenerate-target-platform=true -Dtycho.disableP2Mirrors -Dmaven.repo.local=$srcdir/.mvn
}

package() {
    cd $pkgname-$pkgver/portfolio-product/target/products/name.abuchen.portfolio.product/linux/gtk/$_platform/portfolio/

    install -dm755 ${pkgdir}${_DEST}
    cp -r ./* ${pkgdir}${_DEST}
    chmod a+x ${pkgdir}${_DEST}/PortfolioPerformance

    install -Dm755 "${srcdir}/$pkgname.sh" "${pkgdir}/usr/bin/$pkgname"
    
    install -Dm644 "${srcdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
}
