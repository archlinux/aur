# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=winrm-cli-git
pkgver=r23.af1d5d0
pkgrel=1
pkgdesc="Command-line tool to remotely execute commands on Windows machines through WinRM"
arch=('x86_64')
url='https://github.com/masterzen/winrm-cli'
license=('Apache')
provides=("${pkgname%-git}")
depends=('glibc')
makedepends=('git' 'go')
source=("winrm-cli::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/winrm-cli"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/winrm-cli"
  mkdir -p build/
}

build() {
  cd "${srcdir}/winrm-cli"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  go get -d -v ./...
  go build -o build ./...
}

package() {
  cd "${srcdir}/winrm-cli"
  install -Dm755 build/winrm-cli "${pkgdir}/usr/bin/winrm-cli"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/winrm-cli/README.md"
}