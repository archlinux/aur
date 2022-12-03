# -*- sh -*-
# Maintainer: Hristos N. Triantafillou <me@hristos.co>

pkgname=openmw-validator
pkgver=1.7
pkgrel=1
pkgdesc='Validate your OpenMW configuration file by checking it for various errors, also give various useful stats about data file usage.'
arch=('x86_64')
url='https://git.sr.ht/~hristoast/openmw-validator'
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha512sums=('333e83a3de9047d7fc6c4220c9c2361691d153dae8ba89736a6e9b5d59e5f864312d33d84554325e4d5c463e12f0e5ca31141cbf459e1d284cdd4394b34e23a1')

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
