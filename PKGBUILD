# Maintainer: Cobra <najahannah [at] gmail [dot] com>
pkgname=portfolio
pkgver=0.80.4
pkgrel=1
pkgdesc="Track your portfolio performance (finance)"
arch=('i686' 'x86_64')
url="https://github.com/portfolio-performance/portfolio"
license=('EPL-1.0')
depends=('archlinux-java-run' 'java-environment=21' 'webkit2gtk')
makedepends=('gendesk')

_DEST="/usr/share/portfolio"

[ "$CARCH" = "i686" ]   && _platform="x86"
[ "$CARCH" = "x86_64" ] && _platform="x86_64"

_mvnver=3.9.11

source=("https://github.com/buchen/portfolio/archive/$pkgver.tar.gz"
        "https://dlcdn.apache.org/maven/maven-3/$_mvnver/binaries/apache-maven-$_mvnver-bin.tar.gz"
        "portfolio.sh")
sha1sums=('706d5b861336557e473a6a573cec44dd83120d99'
          'c084cde986ba878da4370bde009ab0a0a1936343'
          '044c48a939e20311b27a1bbbd98d4866ee3eff3c')

prepare() {
	gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
		--name="Portfolio Performance" \
		--genericname="Personal finance" \
		--exec="portfolio %f" \
		--categories="Office;Finance" \
		--terminal="False" \
		--startupnotify="False" \
		--custom="Icon=/usr/share/portfolio/icon.xpm"
	sed -i '0,/Icon/{//d}' $pkgname.desktop
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
