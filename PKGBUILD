# Maintainer: Cobra <najahannah [at] gmail [dot] com>
pkgname=portfolio
pkgver=0.65.3
pkgrel=1
pkgdesc="Track your portfolio performance (finance)"
arch=('i686' 'x86_64')
url="https://github.com/portfolio-performance/portfolio"
license=('EPL')
#depends=('java-runtime>=11' 'java-runtime<15' 'webkit2gtk')
depends=('java-runtime=17' 'webkit2gtk')
#makedepends=('maven' 'java-runtime>=11' 'archlinux-java-run' 'gendesk')
makedepends=('maven' 'archlinux-java-run' 'gendesk')

_DEST="/usr/share/portfolio"

[ "$CARCH" = "i686" ]   && _platform="x86"
[ "$CARCH" = "x86_64" ] && _platform="x86_64"

_mvnver=3.9.4

source=("https://github.com/buchen/portfolio/archive/$pkgver.tar.gz"
        "https://dlcdn.apache.org/maven/maven-3/$_mvnver/binaries/apache-maven-$_mvnver-bin.tar.gz")
sha1sums=('e064ad7809fe1940ef76c73b55be96f360d45f86'
          'fcc62d61598c48425061ee9eb6549cd412a1fa10')

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
    #export JAVA_HOME=/usr/lib/jvm/default-runtime
    #export JAVA_HOME=$(archlinux-java-run --min 11 --max 14 --java-home)
    export JAVA_HOME=$(archlinux-java-run --min 17 --max 17 --java-home)
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
