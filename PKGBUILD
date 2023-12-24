# -*- sh -*-
# Maintainer: Hristos N. Triantafillou <me@hristos.co>

pkgname=openmw-validator
pkgver=1.8
pkgrel=1
pkgdesc='Validate your OpenMW configuration file by checking it for various errors, also give various useful stats about data file usage.'
arch=('x86_64')
url='https://gitlab.com/modding-openmw/openmw-validator'
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/${pkgver}/openmw-validator-${pkgver}.tar.gz")
sha512sums=('ed64a8e0d7411480eed0c9574485e497b347410d77ad5d939770580b1d706badb11e119cbdd1b809b1d6b0c67b9e65efdafdeb529c86b898de42cdc1018ad111')
# https://gitlab.com/modding-openmw/openmw-validator/-/archive/1.8/openmw-validator-1.8.tar.gz

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
