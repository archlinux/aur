# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=github-cli-git
pkgver=2.18.1.r33.g9ea76237
pkgrel=2
pkgdesc="The GitHub CLI tool"
arch=('i686' 'x86_64')
url="https://github.com/cli/cli"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
checkdepends=("openssh")
optdepends=("git: To interact with repositories")
provides=("github-cli=$pkgver")
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

  make manpages
}

check() {
  cd "cli"

  go test \
    ./...
}

package() {
  cd "cli"

  GOBIN="$pkgdir/usr/bin" \
    go install ./cmd/gh

  install -d \
    "$pkgdir/usr/share/bash-completion/completions" \
    "$pkgdir/usr/share/fish/vendor_completions.d" \
    "$pkgdir/usr/share/zsh/site-functions"

  "$pkgdir/usr/bin/gh" completion -s bash > "$pkgdir/usr/share/bash-completion/completions/gh"
  "$pkgdir/usr/bin/gh" completion -s fish > "$pkgdir/usr/share/fish/vendor_completions.d/gh.fish"
  "$pkgdir/usr/bin/gh" completion -s zsh > "$pkgdir/usr/share/zsh/site-functions/_gh"

  cp -r "share" "$pkgdir/usr"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/github-cli"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/github-cli"
}
