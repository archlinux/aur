# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=crossdock
pkgver=0.2.0
pkgrel=1
pkgdesc="Publish packages as signed apt, pacman, RPM and GooGet repositories (with server and systemd units)"
arch=('x86_64' 'aarch64')
url="https://github.com/jm2/crossdock"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go')
optdepends=('gnupg: sign with a GnuPG keyring or smartcard (signing.gnupg_home)'
            'firewalld: the bundled crossdock service definition')
backup=('etc/crossdock/crossdock.yaml')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cfbf0ee3f1589c3e95e711c2c0554dc331ec98e3740f6fce32cc65cc07180b2e')

# Arch Go package guidelines: the repository's go, never a downloaded
# toolchain (go.mod pins go1.27.3), modules fetched in prepare(), and a PIE
# build linked externally so makepkg's CFLAGS/LDFLAGS (RELRO, etc.) apply.
_goenv() {
  export GOTOOLCHAIN=local
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
}

prepare() {
  cd "${pkgname}-${pkgver}"
  _goenv
  go mod download
}

build() {
  cd "${pkgname}-${pkgver}"
  _goenv
  mkdir -p build
  go build -ldflags "-linkmode=external -X main.version=v${pkgver}" -o build/crossdock ./cmd/crossdock
}

check() {
  cd "${pkgname}-${pkgver}"
  _goenv
  go test ./...
  ./build/crossdock version | grep -F "crossdock v${pkgver} "
}

package() {
  cd "${pkgname}-${pkgver}"
  # Upstream's installer: binary, server and publish units, sysusers.d and
  # tmpfiles.d entries for the crossdock account and /var/lib/crossdock
  # (applied by pacman's hooks), firewalld service, default config.
  build-aux/linux/install-tree.sh "${pkgdir}" build /usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
