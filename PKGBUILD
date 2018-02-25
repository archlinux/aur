# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Horo <horo@yoitsu.moe>

pkgname=parsoid
pkgver=0.8.0
pkgrel=1
pkgdesc="A bidirectional wikitext parser and runtime"
arch=('any')
url="https://www.mediawiki.org/wiki/Parsoid"
license=('GPL2')
depends=('nodejs' 'npm')
optdepends=(
    'mediawiki: MediaWiki engine'
)
conflicts=('parsoid-git')
replaces=('parsoid-git')
provides=('parsoid')
backup=(usr/share/webapps/parsoid/localsettings.js
	usr/share/webapps/parsoid/config.yaml)
source=("https://github.com/wikimedia/parsoid/archive/v${pkgver}.zip"
        "parsoid.service"
        "parsoid.install")
sha512sums=("c6821d871edf2e23329693ff60eb9d8dd4fc3475982a5edfc4514d3e059a403f9b32e2b695d4074f077eba016f51ecf93c2cfac91961d36c54a77c97897bc1b7"
            "b4f8a2fc5119fa4741d79c66b5bb2282b274018ad548d383c6007fbe66d14ee1de6744a2cdcf1f8453ca055f48716598b42d3faecd29b81f61c06a54df64ed7d"
            "3b6fdba7a211ccfb038cd1fbe38214b439ce873d6c5bf99187e0c2be19052c2f28ebd322ddf5696f676ee426f177fec828399f859bda6cc4592518e9fa5bbdf5")
options=('!strip')
install="parsoid.install"
prepare() {
    cp -R $srcdir/parsoid-${pkgver} $srcdir/parsoid
}
build() { 
    cd $srcdir/parsoid
    npm install
}
package() {
    mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
    cd $srcdir/parsoid
    cp localsettings.example.js localsettings.js    
    cp config.example.yaml config.yaml
    cp -R . "${pkgdir}/usr/share/webapps/${pkgname}/"
    install -Dm644 "${srcdir}/parsoid.service" "${pkgdir}/usr/lib/systemd/system/parsoid.service"
    install -D "COPYING.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

