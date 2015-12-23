# Maintainer: Cobra <cobra [at] go-linux [dot] info>
pkgname=portfolio
pkgver=0.20.3
pkgrel=1
pkgdesc="Track your portfolio performance (finance)"
arch=('i686' 'x86_64')
url="http://buchen.github.io/portfolio/"
license=('GPL3')
depends=('jre8-openjdk')
makedepends=('maven')

_DEST="/usr/share/portfolio"

[ "$CARCH" = "i686" ]   && _platform="x86"
[ "$CARCH" = "x86_64" ] && _platform="x86_64"

source=("https://github.com/buchen/portfolio/archive/$pkgver.tar.gz")
sha1sums=("f4ced544e9e1fc85bca37084f8703fe887f8c40c")

build() {
    export MAVEN_OPTS="-Xmx1g"
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/jre
    cd $pkgname-$pkgver
    cd portfolio-app
    mvn clean install -Dgenerate-target-platform=true
}

package() {
    cd $pkgname-$pkgver/portfolio-product/target/products/name.abuchen.portfolio.product/linux/gtk/$_platform/portfolio/

    install -dm755 ${pkgdir}${_DEST}
    cp -r * ${pkgdir}${_DEST}
    chmod a+x ${pkgdir}${_DEST}/PortfolioPerformance

    msg2 "Symlink /usr/bin/portfolio -> ${_DEST}/PortfolioPerformance"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "${_DEST}/PortfolioPerformance" "${pkgdir}/usr/bin/portfolio"
}

