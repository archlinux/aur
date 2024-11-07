# -*- sh -*-
# Maintainer: Hristos N. Triantafillou <me@hristos.co>

pkgname=openmw-validator
pkgver=1.12
pkgrel=1
pkgdesc='Validate your OpenMW configuration file by checking it for various errors, also give various useful stats about data file usage.'
arch=('x86_64')
url='https://gitlab.com/modding-openmw/openmw-validator'
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/${pkgver}/openmw-validator-${pkgver}.tar.gz")
sha512sums=('fa66b927185f09d5a53f9b6727233768905b803b8d3cdeda5727bc767064c2b9b1553caada289e2a95397a77123f01cbfa4f89fb0b472e944ba1c3a5871b1226')

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
