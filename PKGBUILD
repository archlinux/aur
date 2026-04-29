# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=promtool
pkgver=3.11.3
pkgrel=1
pkgdesc='Tooling for the Prometheus monitoring system'
arch=('x86_64' 'aarch64')
url='https://github.com/prometheus/prometheus'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
conflicts=('prometheus')
source=("prometheus-v$pkgver.tar.gz::https://github.com/prometheus/prometheus/archive/v$pkgver.tar.gz")
sha256sums=('37bb17f10ec8c36be21452b2efbbc51fc2a94c3d75569c02b8ea0c8cf8ffcfb0')
options=(!lto)

build() {
    cd prometheus-$pkgver

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    LDFLAGS="-extldflags '$LDFLAGS' \
        -X github.com/prometheus/common/version.Version=$pkgver \
        -X github.com/prometheus/common/version.Revision=$pkgver \
        -X github.com/prometheus/common/version.Branch=tarball \
        -X github.com/prometheus/common/version.BuildUser=makepkg \
        -X github.com/prometheus/common/version.BuildDate=$(date -u '+%Y%m%d-%H:%M:%S' --date=@${SOURCE_DATE_EPOCH})"

    go build \
        -buildmode=pie \
        -trimpath \
        -mod=readonly \
        -modcacherw \
        -ldflags "-compressdwarf=false -linkmode external $LDFLAGS" \
        ./cmd/$pkgname
}

check() {
    cd prometheus-$pkgver
    ./$pkgname --version
}

package() {
    cd prometheus-$pkgver
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
