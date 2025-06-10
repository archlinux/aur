# Maintainer: Cobra <najahannah [at] gmail [dot] com>
pkgname=portfolio
pkgver=0.77.1
pkgrel=1
pkgdesc="Track your portfolio performance (finance)"
arch=('i686' 'x86_64')
url="https://github.com/portfolio-performance/portfolio"
license=('EPL')
depends=('java-environment=21' 'webkit2gtk')
makedepends=('maven' 'archlinux-java-run' 'gendesk')

_DEST="/usr/share/portfolio"

[ "$CARCH" = "i686" ]   && _platform="x86"
[ "$CARCH" = "x86_64" ] && _platform="x86_64"

_mvnver=3.9.10

source=("https://github.com/buchen/portfolio/archive/$pkgver.tar.gz"
        "https://dlcdn.apache.org/maven/maven-3/$_mvnver/binaries/apache-maven-$_mvnver-bin.tar.gz")
sha1sums=('6d4fa50d41a2d02d1a1367f3c47dba9c307461eb'
          'b06edaf09ae03e77d65a9fa6ffc2f6db311b8334')

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

    #msg2 "Symlink /usr/bin/portfolio -> ${_DEST}/PortfolioPerformance"
    
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "${_DEST}/PortfolioPerformance" "${pkgdir}/usr/bin/portfolio"
    
    install -Dm644 "${srcdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
}
