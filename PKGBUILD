# Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=kubesolo
pkgver=1.1.3
pkgrel=1
pkgdesc="Single-node Kubernetes with the clustering machinery removed"
arch=('x86_64')
url="https://github.com/portainer/kubesolo"
license=('MIT')
depends=(
    glibc
)
makedepends=(
    crane
    git
    go
    jq
)
options=(!lto !debug)
source=("git+$url.git#tag=v${pkgver}"
        "kubesolo.service"
        "kubesolo.env"
        "kubesolo-tmpfiles.conf")

b2sums=('e8c1b36932b82442de43822524a33c6454eeb76dbef3761e47eee6a1da0194096828babe2ec099193e3eddf00f150a3f5fe0953c5c8ffd6603666e7098323067'
        '8ce2722e9531e46d7b43ee2cf048922481cc08fb6ae588dab064db6fc6f7d209fa6a0cc68ec6217a130d12c8f99ad8dd44249d617362316aaae1327787b4fa3c'
        'cfc7ed43ee592fee01698b1693763abae73fe6d34318d24aca2e4998b8513ec6bff914a47c0cf86da8c08b7cb26b81cb3aa1e240b61734206d8dbdcb708c7034'
        'acf7394e461b245b22d7d339d3c6e016b5c92a226adbdfb390c0c2a7f33ccf5c840aefeeb1af740ea9375fa3db50ddd43fb3f6be469f36ba4571d2b28d1ecfbb')

prepare() {
  cd "$pkgname"
  ./build/download-deps.sh
}

build() {
    cd "$pkgname"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS} -DSQLITE_ENABLE_DBSTAT_VTAB"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    local k8s_version="$(go list -m -f '{{.Version}}' k8s.io/kubernetes)"
    local ld_flags=" \
      -compressdwarf=false \
      -linkmode=external \
      -X main.Version=v${pkgver} \
      -X main.Commit=$(git rev-parse --short HEAD) \
      -X k8s.io/component-base/version.gitVersion=${k8s_version}+kubesolo-v${pkgver}
    "

    go build -v -ldflags="${ld_flags}" -o kubesolo ./cmd/kubesolo/main.go
}

package() {
    install -Dm755 $pkgname/kubesolo "$pkgdir/usr/bin/kubesolo"
    install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 kubesolo.service "$pkgdir/usr/lib/systemd/system/kubesolo.service"
    install -Dm644 kubesolo.env "$pkgdir/etc/default/kubesolo"
    install -Dm644 kubesolo-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/kubesolo.conf"
}
