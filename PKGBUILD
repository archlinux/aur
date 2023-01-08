# Maintainer: Hristos N. Triantafillou <me@hristos.co>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=wem
pkgver=0.9.2
pkgrel=1
pkgdesc='Wine Environment Manager: A CLI tool for managing wine "envs" or prefixes.'
arch=('x86_64')
url='https://git.sr.ht/~hristoast/wem'
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha512sums=('0e6cd2bf0f7ae86a52b0434995a0ff14a572b66baeab007719007f335457ecd033414f4883a701579eb7a1ed4d9999eb952b8e97eea33452a3a21b0fda111528')

build() {
    ## From Go package guidelines
    ## https://wiki.archlinux.org/title/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -buildvcs=false -trimpath -mod=readonly -modcacherw"

    cd "$pkgname-$pkgver"
    go build -ldflags="-linkmode=external -X 'git.sr.ht/~hristoast/wem/cfg.WemVersion=${pkgver}_${pkgrel}'" -o wem ./cmd/wem
}

package() {
    cd "$pkgname-$pkgver"
    install -D wem -t "$pkgdir/usr/bin/"
}
