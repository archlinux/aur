# Maintainer: Tim Falken <tim@timfalken.com>
pkgname=bluegit-runner
pkgver=20261025205431
pkgrel=1
pkgdesc='Separate CI runner for BlueGit (runs jobs in Docker on your own machine)'
arch=('x86_64' 'aarch64')
url='https://git.timfalken.com/timfa/bluegit'
license=('MIT')
depends=('git' 'docker')
makedepends=('go')
options=('!debug')
install=bluegit-runner.install
_commit=e8cd3d7b16457433d2211eca6c17849945399ae5
source=("bluegit-${_commit}.tar.gz::https://git.timfalken.com/timfa/bluegit/-/archive/${_commit}/bluegit-${_commit}.tar.gz")
sha256sums=('f3112d7aff56db30040a4b913f79ecb6eec3609163110cd95e198fc03f311037')

build() {
  cd "$srcdir/bluegit-${_commit}"
  export CGO_ENABLED=0
  export GOFLAGS='-trimpath'
  export GOCACHE="${BUILDDIR:-$srcdir}/gocache"
  export GOPATH="${BUILDDIR:-$srcdir}/gopath"
  go build -ldflags="-s -w -X main.version=${pkgver}" -o bluegit-runner ./cmd/bluegit-runner
}

package() {
  cd "$srcdir/bluegit-${_commit}"
  install -Dm755 bluegit-runner "$pkgdir/usr/bin/bluegit-runner"
  install -Dm644 packaging/runner/bluegit-runner.service "$pkgdir/usr/lib/systemd/system/bluegit-runner.service"
  install -Dm644 packaging/runner/sysusers.conf "$pkgdir/usr/lib/sysusers.d/bluegit-runner.conf"
  install -Dm644 packaging/runner/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/bluegit-runner.conf"
  install -Dm644 packaging/runner/config.yml.example "$pkgdir/usr/share/bluegit-runner/config.yml.example"
  install -Dm644 docs/runner.md "$pkgdir/usr/share/doc/bluegit-runner/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
