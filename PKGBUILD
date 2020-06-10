# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=github-cli-git
pkgver=0.9.0.r156.g217998a
pkgrel=1
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


pkgver() {
  cd "cli"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "cli"

  go build \
    -buildmode=pie \
    -ldflags "-extldflags $LDFLAGS" \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    ./cmd/gh
}

check() {
  cd "cli"

  go test \
    -mod=readonly \
    ./...
}

package() {
  cd "cli"

  install -Dm755 "gh" -t "$pkgdir/usr/bin"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/github-cli"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/github-cli"
}
