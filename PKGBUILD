# Maintainer: Tim Falken <tim@timfalken.com>
pkgname=bluegit-runner
pkgver=20261117083310
pkgrel=1
pkgdesc='Separate CI runner for BlueGit (runs jobs in Docker on your own machine)'
arch=('x86_64' 'aarch64')
url='https://git.timfalken.com/timfa/bluegit'
license=('MIT')
depends=('git' 'docker')
makedepends=('go')
options=('!debug')
install=bluegit-runner.install
_commit=8bb15b294407fb15f5c0acceb0d6914e20e9a828
source=("bluegit-${_commit}.tar.gz::https://git.timfalken.com/timfa/bluegit/-/archive/${_commit}/bluegit-${_commit}.tar.gz")
sha256sums=('0020ecb84a63a3d22a51793b32da09ea23ca74c42da97629215289134bdd23f4')

build() {
  cd "$srcdir/bluegit-${_commit}"
  export CGO_ENABLED=0
  # go.mod vraagt Go 1.26; een oudere Arch-go haalt die toolchain zelf op.
  export GOTOOLCHAIN=auto
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
