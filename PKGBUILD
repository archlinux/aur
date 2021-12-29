# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=prometheus-nut-exporter
_pkgname=nut_exporter
pkgver=2.3.1
pkgrel=1
pkgdesc="Prometheus exporter for Network UPS Tools metrics"
arch=('x86_64')
url="https://github.com/DRuggeri/nut_exporter"
license=('Apache')
depends=('glibc')
makedepends=('go' 'git')
optdepends=('nut: for monitoring a local NUT server')
_commit='bc355546a6498934d785aff53ee608a5ec330b6a'
source=(
  "$pkgname::git+$url.git#commit=$_commit"
  'systemd.service'
  'sysusers.conf'
)
b2sums=('SKIP'
        'c37fea15866ccc283ca0aca7ac47edf746b3281bbdc9bb92edde41d110b459d55272aff30b963cda5d3165c9ea27f2cc82b48b0f340900531cc125dd0d719c97'
        'f14c79da6b3efeb0843853e5772bcc021bd6041b76a39952ad45638ce27f143b41f6a491d528992250db9b2d9fd133b76ad8f6f6da9df4c6fb0865766d49d991')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^[vV]//;s/-/+/g'
}

prepare() {
  cd "$pkgname"

  # create folder for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X main.Version=$pkgver" \
    -o build .
}

check() {
  cd "$pkgname"
  # ensure tests have access to built binary
  PATH="$(pwd)/build:$PATH" go test ./...
}

package() {
  # systemd integration
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "$pkgname/build/$_pkgname"
}
