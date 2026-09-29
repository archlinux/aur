# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=promtool
pkgver=3.15.0
pkgrel=2
_commit=5241a27fe3c6983549fccc32f6e65917408c63cd
pkgdesc='Tooling for the Prometheus monitoring system'
arch=('x86_64' 'aarch64')
url='https://github.com/prometheus/prometheus'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
conflicts=('prometheus')
source=("prometheus-v$pkgver-${_commit}.tar.gz::https://github.com/prometheus/prometheus/archive/${_commit}.tar.gz")
sha256sums=('eee7ec029ffdba7d9ee59171cad5ddaff10e71514b0bae1a6fde6dc1ae99e181')
options=(!lto)

build() {
    cd prometheus-${_commit}

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
    cd prometheus-${_commit}
    ./$pkgname --version
}

package() {
    cd prometheus-${_commit}
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
