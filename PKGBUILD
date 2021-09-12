# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=drone-runner-ssh
pkgver=1.0.1
pkgrel=2
pkgdesc="Drone runner that executes a pipeline on a remote machine"
arch=('x86_64')
url="https://github.com/drone-runners/drone-runner-ssh"
license=('custom:Polyform-Small-Business-1.0.0' 'custom:Polyform-Free-Trial-1.0.0' 'custom:Polyform-Noncommercial-1.0.0')
makedepends=('go' 'git')
optdepends=('drone: for a local Drone instance')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  'systemd.service'
  'sysusers.conf'
  'tmpfiles.conf'
)
b2sums=('9bc1c3382b615769399417b03e5f20893d7720dc138879029ad23597aaa7fc986e33b3f19b64888682142e862d9a8bc8731c564949075a6ef7956d22f3c7f72c'
        '90d868e9f6932eedc814473e160c661da7cf06a3cf1adf0709b462e388130f3f149120cf36dc6bb9f6bffbca8fce7c8624aa8a0b2511ea64d9b72dc950eea746'
        '8459bbc51dd5006159041de20fc8288bed444e9ba8b48d8a95d2f6ea5a89e38e4d1f5db816c2b35f29b3219aba396bff509157a8b234105041d61c3f4504fef6'
        'f2742d5c60a3b68ecf7dab2d602b442bafcc619d838fcc74f5f186113778719797f9fa3975643c0925def2acf282c09120c186abc90b1ee5a34a7796b38f00fd')

prepare() {
  cd "$pkgname-$pkgver"

  # create directory for build output
  mkdir -p build

  # download dependencies
  go mod vendor
}

build() {
  cd "$pkgname-$pkgver"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o build \
    .
}

check() {
  cd "$pkgname-$pkgver"
  go test -v ./...
}

package() {
  # systemd integration
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/*

  # licenses
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" licenses/* LICENSE.md

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md CHANGELOG.md
}
