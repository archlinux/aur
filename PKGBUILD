# Maintainer: Hristos N. Triantafillou <me@hristos.co>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=wem
pkgver=0.9.5
pkgrel=1
pkgdesc='Wine Environment Manager: A CLI tool for managing wine "envs" or prefixes.'
arch=('x86_64')
url='https://git.sr.ht/~hristoast/wem'
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha512sums=('06288099ea8281fe571a8cc6ba09427cc45fc344116b3c7d0de3a5da7bc6cb6d908838c82e31183f9e58f09baea5b97ff3df272be0603405793731bd9e14d90b')

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
