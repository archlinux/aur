# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Horo <horo@yoitsu.moe>

pkgname=parsoid-git
_pkgname=parsoid
pkgver=v0.3.0.r975.g2e0b30e
pkgrel=1
pkgdesc="A bidirectional wikitext parser and runtime"
arch=('any')
url="https://www.mediawiki.org/wiki/Parsoid"
license=('GPL2')
depends=('nodejs')
makedepends=('git' 'npm')
optdepends=(
    'mediawiki: MediaWiki engine'
)
conflicts=('parsoid')
replaces=('parsoid')
provides=('parsoid')
backup=(usr/share/webapps/parsoid/localsettings.js
	usr/share/webapps/parsoid/config.yaml)
source=("git+https://gerrit.wikimedia.org/r/p/mediawiki/services/parsoid"
        "parsoid.service"
        "parsoid.install")
sha512sums=("SKIP"
            "b4f8a2fc5119fa4741d79c66b5bb2282b274018ad548d383c6007fbe66d14ee1de6744a2cdcf1f8453ca055f48716598b42d3faecd29b81f61c06a54df64ed7d"
            "3b6fdba7a211ccfb038cd1fbe38214b439ce873d6c5bf99187e0c2be19052c2f28ebd322ddf5696f676ee426f177fec828399f859bda6cc4592518e9fa5bbdf5")
options=('!strip')
install="parsoid.install"
pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' 
}
build() { 
    cd $srcdir/parsoid
    npm install
}
package() {
    cd $srcdir/parsoid
    cp localsettings.example.js localsettings.js    
    cp config.example.yaml config.yaml
    mkdir -p "${pkgdir}/usr/share/webapps/${_pkgname}"
    tar c --exclude=.git . | tar x -C "${pkgdir}/usr/share/webapps/${_pkgname}/"
    install -Dm644 "${srcdir}/parsoid.service" "${pkgdir}/usr/lib/systemd/system/parsoid.service"
    install -D "COPYING.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

