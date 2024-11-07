# Maintainer: Hristos N. Triantafillou <me@hristos.co>

pkgname=momw-configurator
pkgver=1.1
pkgrel=1
pkgdesc='Generates a fully functional openmw.cfg for any mod list from Modding-OpenMW.com and runs modding tools with appropriate handling for your selected mod list. Intended to be used alongside umomwd.'
arch=('x86_64')
url='https://gitlab.com/modding-openmw/momw-configurator'
license=('MIT')
depends=('glibc')
makedepends=('go') # https://gitlab.com/modding-openmw/momw-configurator/-/archive/1.1/momw-configurator-1.1.tar.gz
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('dd022ea1dee7113f458cef5d221c259aaffc9be01ba584d7139983e4aa29fb469aeec1dccf4981b0fc870efbea152c426b2175e7ba86421963bd6e14672bd15b')

build() {
    ## From Go package guidelines
    ## https://wiki.archlinux.org/title/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -buildvcs=false -trimpath -mod=readonly -modcacherw"

    cd "$pkgname-$pkgver"
    go build -ldflags="-linkmode=external -X 'gitlab.com/modding-openmw/momw-configurator/cfg.Version=${pkgver}_${pkgrel}'" -o momw-configurator ./cmd/momw-configurator
}

package() {
    cd "$pkgname-$pkgver"
    install -D momw-configurator -t "$pkgdir/usr/bin/"
}
