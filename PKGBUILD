# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=promscale
pkgver=0.11.0
pkgrel=1
pkgdesc='An analytical platform for Prometheus metrics'
arch=('x86_64')
url='https://github.com/timescale/promscale'
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
depends=('promscale_extension')
optdepends=('prometheus: for a local prometheus instance')
backup=('etc/promscale.conf')
options=('!lto')
_commit='f49197aac5f58755942fcbeb673271b7def122b2'
source=(
  "$pkgname::git+$url.git#commit=$_commit"
  'systemd.service'
  'sysusers.conf'
)
sha512sums=('SKIP'
            '28a4f7b02c7ba36887c4b3906048fc7574d0c66424d20aad5c5c191954c7416adf19d14d6ac7dbb0fef7ff2f4457ed1014c324e9a56f9d08fc47257d8d915ddd'
            'ec5e6ec6b967119722d8fdaaaaf1a4d8dea9ad0b78707a1ddd6b55da524b571c7ecd4c2b97776c6ce9f49d4549d760482a2346c11ab287650469448d9c662726')
b2sums=('SKIP'
        '00c948fad197fcedcb4171d253b430304673681dd5761f25a6ee545a3c146e37e00f89c4f9d44fdd5ffafcfee5d5eaa5bc3cacd43a0cf46467a9eb7a7f82a281'
        '1e720f8e453d9acad5f0ed39a51b59c429322b9e9e885f3d71d0e2fd37276268e639422f8d39ca9fca14e0e5ccf646d717fbe89e0dd696980d03467cfb7d3e0f')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir build_output

  # download dependencies
  go mod download

  cd migration-tool
  go mod download
}

build() {
  cd "$pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  # generate
  go generate ./...

  # build promscale
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X github.com/timescale/promscale/pkg/version.CommitHash=$_commit \
    -X github.com/timescale/promscale/pkg/version.Branch=master \
    -X github.com/timescale/promscale/pkg/telemetry.BuildPlatform=archlinux" \
    -o build_output ./cmd/...

  # build prom-migrator
  cd migration-tool
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
    -o ../build_output ./cmd/...
}

package() {
  # systemd integration
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  # documentation
  cd "$pkgname"
  install -vDm644 migration-tool/cmd/prom-migrator/README.md "$pkgdir/usr/share/doc/$pkgname/prom-migrator.md"
  install -vDm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  cp -vr docs "$pkgdir/usr/share/doc/$pkgname"

  # binaries
  install -vDm755 -t "$pkgdir/usr/bin" \
    "build_output/$pkgname" \
    build_output/prom-migrator

  # configuration
  install -vDm644 -t "$pkgdir/etc" build/conf/promscale.conf
}
