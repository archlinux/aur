# Maintainer: Hristos N. Triantafillou <me@hristos.co>

pkgname=momw-configurator
pkgver=1.6
pkgrel=1
pkgdesc="Generates fully functional openmw.cfg and settings.cfg for any mod list from Modding-OpenMW.com and runs modding tools with appropriate handling for your selected mod list. Intended to be used alongside umo for the website's Automatic Install Guide."
arch=('x86_64')
url='https://gitlab.com/modding-openmw/momw-configurator'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('f537208ab0bfe19ea58fb7a7e847803e68d265a5e019c3b6281c930005f7d5c8b0f5f590074f6358a2d67e09070fc4364d16a716141e2510d82c82ccd122ecf6')

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
