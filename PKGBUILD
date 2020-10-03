# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=github-cli-git
pkgver=1.0.0.r115.g72eeae9d
pkgrel=2
pkgdesc="The GitHub CLI tool"
arch=('i686' 'x86_64')
url="https://github.com/cli/cli"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
optdepends=("git: To interact with repositories")
provides=('github-cli')
conflicts=('github-cli')
source=("git+https://github.com/cli/cli.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "cli"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "cli"

  go build \
    ./cmd/gh
  make manpages
}

check() {
  cd "cli"

  go test \
    ./...
}

package() {
  cd "cli"

  install -Dm755 "gh" -t "$pkgdir/usr/bin"
  cp -r "share" "$pkgdir/usr"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/github-cli"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/github-cli"
}
