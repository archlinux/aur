# Maintainer: Robert Schiele <rschiele@gmail.com>

pkgname=structurizr
pkgver=2026.03.06
pkgrel=2
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
sha256sums=('fd18f230498d65fed40c6ed784f466bfdb581d42b5e1e33e8427650ca0dd3f48'
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
