# -*- sh -*-
# Maintainer: Hristos N. Triantafillou <me@hristos.co>

pkgname=openmw-validator
pkgver=1.14
pkgrel=1
pkgdesc='Validate your OpenMW configuration file by checking it for various errors, also give various useful stats about data file usage.'
arch=('x86_64')
url='https://gitlab.com/modding-openmw/openmw-validator'
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/${pkgver}/openmw-validator-${pkgver}.tar.gz")
sha512sums=('f1750c0d4a606cf64aa82ddf4b4f8714071c2796b4e9a8b698b13f81207d4b38789bb89727d53ac9fd539cb1db4abcecab61dcfc666c32185a4121c28ebb6aa2')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    cd "$pkgname-$pkgver"
    go build -buildvcs=false -buildmode=pie -trimpath -ldflags="-linkmode=external -s -w -X 'git.sr.ht/~hristoast/openmw-validator/config.Version=$$(git describe --tags)'" -mod=readonly -modcacherw -o openmw-validator ./cmd/openmw-validator
}

package() {
    cd "$pkgname-$pkgver"
    install -D openmw-validator -t "$pkgdir/usr/bin/"
}
