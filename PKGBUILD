# Maintainer: Robert Schiele <rschiele@gmail.com>

pkgname=structurizr-git
pkgver=6.0.0.r27.ge48b883
pkgrel=2
pkgdesc="Software architecture models as code"
arch=('any')
url="https://structurizr.com/"
license=('Apache-2.0')
depends=('java-runtime')
makedepends=('git' 'maven')
conflicts=('structurizr')
options=('!strip')
source=("git+https://github.com/structurizr/structurizr.git"
	"structurizr.sh")
sha256sums=('SKIP'
            '72122d16c7cfe32cef4e63267e461fefb60c893b87349d539e016645b0403698')

pkgver() {
    cd structurizr
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd structurizr
    mvn -DexcludedGroups=IntegrationTest package
}

package() {
    cd structurizr
    install -D -m644 -t "$pkgdir/usr/share/java/${pkgname}" structurizr-application/target/structurizr-*.war
    mkdir -p "$pkgdir/usr/share/${pkgname}"
    cp -a structurizr-themes "$pkgdir/usr/share/${pkgname}/themes"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mkdir -p "$pkgdir/usr/bin"
    sed -e "s|/structurizr/|/${pkgname}/|g" "$srcdir/structurizr.sh" > "$pkgdir/usr/bin/structurizr"
    chmod 755 "$pkgdir/usr/bin/structurizr"
}
