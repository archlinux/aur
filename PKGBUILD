# Maintainer: Cobra <najahannah [at] gmail [dot] com>
pkgname=portfolio
pkgver=0.55.0
pkgrel=2
pkgdesc="Track your portfolio performance (finance)"
arch=('i686' 'x86_64')
url="http://buchen.github.io/portfolio/"
license=('EPL')
#depends=('java-runtime>=11' 'java-runtime<15' 'webkit2gtk')
depends=('java-runtime=11' 'webkit2gtk')
#makedepends=('maven' 'java-runtime>=11' 'archlinux-java-run' 'gendesk')
makedepends=('maven' 'java-runtime=11' 'archlinux-java-run' 'gendesk')

_DEST="/usr/share/portfolio"

[ "$CARCH" = "i686" ]   && _platform="x86"
[ "$CARCH" = "x86_64" ] && _platform="x86_64"

source=("https://github.com/buchen/portfolio/archive/$pkgver.tar.gz"
        "https://github.com/buchen/portfolio/commit/72a46918b2bb84c452ff6935e6b24e69353b72e0.patch"
        "https://github.com/buchen/portfolio/commit/2baffd30def8d746538a34e2bc5e942c7e61a85e.patch")
sha1sums=('46a2b6f510f60411f412369fe26c0d2ffc020ec5'
          '9af2c0db31f3e18e711d3a73abc951ba49b58bae'
          '41a6663754fdbb40326878565ea8c4594442a5de')

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

	# Update Eclipse base to support Java 17
	cd $pkgname-$pkgver
	patch -p1 < "${srcdir}"/72a46918b2bb84c452ff6935e6b24e69353b72e0.patch
	patch -p1 < "${srcdir}"/2baffd30def8d746538a34e2bc5e942c7e61a85e.patch
	patch -R -F3 -p1 < "${srcdir}"/72a46918b2bb84c452ff6935e6b24e69353b72e0.patch
}

build() {
    export MAVEN_OPTS="-Xmx1g"
    #export JAVA_HOME=/usr/lib/jvm/default-runtime
    #export JAVA_HOME=$(archlinux-java-run --min 11 --max 14 --java-home)
    export JAVA_HOME=$(archlinux-java-run --min 11 --max 11 --java-home)
    cd $pkgname-$pkgver

    cd portfolio-app
    mvn clean install -Dgenerate-target-platform=true -Dtycho.disableP2Mirrors -Dmaven.repo.local=$srcdir/.mvn
}

package() {
    cd $pkgname-$pkgver/portfolio-product/target/products/name.abuchen.portfolio.product/linux/gtk/$_platform/portfolio/

    install -dm755 ${pkgdir}${_DEST}
    cp -r ./* ${pkgdir}${_DEST}
    chmod a+x ${pkgdir}${_DEST}/PortfolioPerformance

    msg2 "Symlink /usr/bin/portfolio -> ${_DEST}/PortfolioPerformance"
    
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "${_DEST}/PortfolioPerformance" "${pkgdir}/usr/bin/portfolio"
    
    install -Dm644 "${srcdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
}
