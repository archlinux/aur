# Maintainer: Robert Schiele <rschiele@gmail.com>

pkgname=structurizr
pkgver=2026.04.19
pkgrel=1
pkgdesc="Software architecture models as code"
arch=('any')
url="https://structurizr.com/"
license=('Apache-2.0')
depends=('java-runtime')
makedepends=('git' 'maven')
conflicts=('structurizr-git')
options=('!strip')
source=("git+https://github.com/structurizr/structurizr.git#tag=v$pkgver"
	"structurizr.sh")
sha256sums=('a681b7158cc42151965ac229dc4b900be54be60886e2cb7b2145c1e0f110ed04'
            '72122d16c7cfe32cef4e63267e461fefb60c893b87349d539e016645b0403698')

build() {
    cd structurizr
    mvn -DexcludedGroups=IntegrationTest package -Dapp.revision=$pkgver
}

package() {
    cd structurizr
    install -D -m644 -t "$pkgdir/usr/share/java/${pkgname}" structurizr-application/target/structurizr-${pkgver}.war
    mkdir -p "$pkgdir/usr/share/${pkgname}"
    cp -a structurizr-themes "$pkgdir/usr/share/${pkgname}/themes"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mkdir -p "$pkgdir/usr/bin"
    sed -e "s|/structurizr/|/${pkgname}/|g;s|1\.0\.0|${pkgver}|" "$srcdir/structurizr.sh" > "$pkgdir/usr/bin/structurizr"
    chmod 755 "$pkgdir/usr/bin/structurizr"
}
