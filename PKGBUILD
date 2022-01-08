# -*- sh -*-
# Maintainer: Hristos N. Triantafillou <me@hristos.co>

pkgname=openmw-validator
pkgver=1.5
pkgrel=1
pkgdesc='Validate your OpenMW configuration file by checking it for various errors, also give various useful stats about data file usage.'
arch=('x86_64')
url='https://git.sr.ht/~hristoast/openmw-validator'
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha512sums=('3e0c4fd18b5946f2b9ef023b5fde13b3cbf8e18baa13be86e2b549dd32225c1ed75674c8dece2c92eda90ece940bb854c8bee6003a2485c9f97b629eb8d64302')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    cd "$pkgname-$pkgver"
    go build -buildmode=pie -trimpath -ldflags="-linkmode=external -s -w -X 'git.sr.ht/~hristoast/openmw-validator/config.Version=$$(git describe --tags)'" -mod=readonly -modcacherw -o openmw-validator ./cmd/openmw-validator
}

package() {
    cd "$pkgname-$pkgver"
    install -D openmw-validator -t "$pkgdir/usr/bin/"
}
