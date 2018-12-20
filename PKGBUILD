# Maintainer: Cobra <najahannah [at] gmail [dot] com>
pkgname=portfolio
pkgver=0.36.1
pkgrel=1
pkgdesc="Track your portfolio performance (finance)"
arch=('i686' 'x86_64')
url="http://buchen.github.io/portfolio/"
license=('EPL')
#depends=('java-runtime>=8' 'webkit2gtk')
depends=('java-runtime=8' 'webkit2gtk')
makedepends=('maven' 'gendesk')

_DEST="/usr/share/portfolio"

[ "$CARCH" = "i686" ]   && _platform="x86"
[ "$CARCH" = "x86_64" ] && _platform="x86_64"

source=("https://github.com/buchen/portfolio/archive/$pkgver.tar.gz")
sha1sums=("10f587cb7171497bb494274e84622161430905a0")

#JRE_VERSION=$(archlinux-java status | grep default | awk '{print $1}')

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
    export MAVEN_OPTS="-Xmx1g"
    #export JAVA_HOME=/usr/lib/jvm/$JRE_VERSION/jre
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/jre
    cd $pkgname-$pkgver
    cd portfolio-app
    mvn clean install -Dgenerate-target-platform=true -Dtycho.disableP2Mirrors  -Dmaven.repo.local=$srcdir/.mvn
}

package() {
    cd $pkgname-$pkgver/portfolio-product/target/products/name.abuchen.portfolio.product/linux/gtk/$_platform/portfolio/

    install -dm755 ${pkgdir}${_DEST}
    cp -r * ${pkgdir}${_DEST}
    chmod a+x ${pkgdir}${_DEST}/PortfolioPerformance

    msg2 "Symlink /usr/bin/portfolio -> ${_DEST}/PortfolioPerformance"
    
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "${_DEST}/PortfolioPerformance" "${pkgdir}/usr/bin/portfolio"
    
    install -Dm644 "${srcdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
}
