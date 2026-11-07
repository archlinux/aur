# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=crossdock-git
pkgver=0.2.0.r0.gde4df13
pkgrel=1
pkgdesc="Publish packages as signed apt, pacman, RPM and GooGet repositories (with server and systemd units) (Git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/jm2/crossdock"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('git' 'go')
optdepends=('gnupg: sign with a GnuPG keyring or smartcard (signing.gnupg_home)'
            'firewalld: the bundled crossdock service definition')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
backup=('etc/crossdock/crossdock.yaml')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# Arch Go package guidelines: the repository's go, never a downloaded
# toolchain, modules fetched in prepare(), and a PIE build linked externally
# so makepkg's CFLAGS/LDFLAGS (RELRO, etc.) apply.
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
  cd "${pkgname}"
  _goenv
  go mod download
}

build() {
  cd "${pkgname}"
  _goenv
  mkdir -p build
  go build -ldflags "-linkmode=external -X main.version=$(git describe --tags)" -o build/crossdock ./cmd/crossdock
}

check() {
  cd "${pkgname}"
  _goenv
  go test ./...
  ./build/crossdock version | grep -F "crossdock $(git describe --tags) "
}

package() {
  cd "${pkgname}"
  build-aux/linux/install-tree.sh "${pkgdir}" build /usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
}
