# Maintainer: devnullvoid <devnullvoid.space@gmail.com>

pkgname='pvetui-git'
_pkgname=pvetui
pkgver=v1.0.7.r21.g5ec2f74
pkgrel=1
pkgdesc='A terminal user interface (TUI) for Proxmox VE'
url='https://github.com/devnullvoid/pvetui'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('pvetui')
conflicts=('pvetui-bin' 'pvetui')
depends=('go' 'git')
makedepends=('make')
optdepends=('kitty: Better terminal support' 'alacritty: Better terminal support')
source=("git+https://github.com/devnullvoid/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  go mod download
}

build() {
  cd "${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags="-w -s -linkmode=external -X github.com/devnullvoid/pvetui/internal/version.version=${pkgver}" ./cmd/pvetui
}

package() {
  cd "${_pkgname}"
  install -Dm755 ./pvetui "${pkgdir}/usr/bin/pvetui"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
