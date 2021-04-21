# Maintainer: Vyacheslav Konovalov <crabvk@protonmail.com>

pkgname=flux
pkgver=0.113.0
pkgrel=1
pkgdesc='Lightweight scripting language for querying databases (like InfluxDB) and working with data'
arch=(i686 x86_64 arm64)
url='https://github.com/influxdata/flux'
license=(MIT)
depends=(gcc-libs)
makedepends=(git go cargo clang)
source=("git+https://github.com/influxdata/flux#tag=v$pkgver")
sha512sums=('SKIP')

build() {
    cd flux

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
    export PKG_CONFIG=$PWD/pkg-config

    go build -o pkg-config github.com/influxdata/pkg-config
    go build ./cmd/flux

    target=$(
        eval $(rustc --print cfg | grep target)
        echo $target_arch-$target_vendor-$target_os-$target_env
    )
    mv libflux/target/$target/release/{libflux.so,fluxdoc} .
}

package() {
    cd flux

    install -Dm775 libflux.so -t "$pkgdir/usr/lib"
    install -Dm775 flux fluxdoc -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/flux"
}
