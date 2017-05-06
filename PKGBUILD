# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Horo <horo@yoitsu.moe>

pkgname=restbase-git
_pkgname=restbase
pkgver=v0.16.5.r43.gd033c67
pkgrel=1
pkgdesc="A a caching / storing API proxy backing the Wikimedia REST API"
arch=('any')
url="https://www.mediawiki.org/wiki/RESTBase"
license=('Apache')
depends=('nodejs')
makedepends=('git' 'npm')
optdepends=(
    'mediawiki: MediaWiki engine'
)
conflicts=('restbase')
replaces=('restbase')
provides=('restbase')
backup=(usr/share/webapps/restbase/config.yaml)
source=("git+https://github.com/wikimedia/restbase"
        "restbase.service"
        "restbase.install")
sha512sums=("SKIP"
            "SKIP"
            "SKIP")
options=('!strip')
install="restbase.install"
pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' 
}
build() { 
    cd $srcdir/restbase
    npm install
}
package() {
    cd $srcdir/restbase
    cp config.example.yaml config.yaml
    mkdir -p "${pkgdir}/usr/share/webapps/${_pkgname}"
    tar c --exclude=.git . | tar x -C "${pkgdir}/usr/share/webapps/${_pkgname}/"
    install -Dm644 "${srcdir}/restbase.service" "${pkgdir}/usr/lib/systemd/system/restbase.service"
    install -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

