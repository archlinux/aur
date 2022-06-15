# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=mimir
pkgver=2.1.0
pkgrel=3
pkgdesc='A scalable long-term storage for Prometheus'
arch=('x86_64')
url='https://grafana.com/oss/mimir/'
license=('AGPL3')
depends=('glibc')
makedepends=('git' 'go')
backup=('etc/mimir.yaml')
options=('!lto')
_commit='840c68616a6fa4a4f86cbd581b05c43d0bfee7e0'
source=(
  "$pkgname::git+https://github.com/grafana/mimir.git#commit=$_commit"
  'systemd.service'
  'sysusers.conf'
  'tmpfiles.conf'
  'config.yaml'
)
b2sums=('SKIP'
        'b1220c02c9cebbfbc65869a01dac92438ab87df557c67c27489f005b695303591c729a2c172a5e5254bd03276ac4c3d146498b18b6984595db9dc0ebc2a5e814'
        '5f349b126b5ce6671b00d8482eb8aad71d73e93db983d4b4fe68a430f2902eac3ec7f8460f9f699ba6e76a13bc4b27d9a248e54a550a1849713364c3b84d4ad8'
        'edc4e9e301e889dfa47528e411459a970f97feb9ca07a3fcc33b60c16adb988109543bc746689e82ac688caca0c60b75abe7d0cc80662d22de665712ff650bb8'
        '573a19bda1baa73260364bf31bddcc5cd0fc6dc98f69d8ff8a549187cf7f47ecddb35e7141dd638acdb916579e408e6c9f860889847bbe130ccc7383fc4ba899')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^mimir-//'
}

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir build
}

build() {
  cd "$pkgname"

  # verify dependencies
  go mod verify

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags $LDFLAGS \
    -X github.com/grafana/mimir/pkg/util/version.Branch=main \
    -X github.com/grafana/mimir/pkg/util/version.Revision=$_commit \
    -X github.com/grafana/mimir/pkg/util/version.Version=$pkgver" \
    -o build \
    ./cmd/...
}

check() {
  cd "$pkgname"

  go test -v ./...
}

package() {
  # systemd integration
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -vDm640 config.yaml "$pkgdir/etc/$pkgname.yaml"

  cd "$pkgname"

  install -vDm755 -t "$pkgdir/usr/bin" build/*
}
