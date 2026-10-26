# Maintainer: YummierGravy

pkgname=teamcity-cli-git
pkgver=1.6.0.r1.g4ef45b2
pkgrel=1
pkgdesc='Command-line interface for JetBrains TeamCity (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/JetBrains/teamcity-cli'
license=('Apache-2.0')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  export GOFLAGS="-mod=readonly"
  go mod download
}

build() {
  cd "$pkgname"
  export CGO_ENABLED=0 DO_NOT_TRACK=1
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build \
    -ldflags "-s -w -X github.com/JetBrains/teamcity-cli/internal/version.Version=${pkgver}" \
    -o teamcity ./tc

  ./teamcity completion bash > teamcity.bash
  ./teamcity completion zsh > teamcity.zsh
  ./teamcity completion fish > teamcity.fish
}

check() {
  cd "$pkgname"
  go test ./internal/config ./internal/output
}

package() {
  cd "$pkgname"
  install -Dm755 teamcity -t "$pkgdir/usr/bin"
  install -Dm644 teamcity.bash "$pkgdir/usr/share/bash-completion/completions/teamcity"
  install -Dm644 teamcity.zsh "$pkgdir/usr/share/zsh/site-functions/_teamcity"
  install -Dm644 teamcity.fish "$pkgdir/usr/share/fish/vendor_completions.d/teamcity.fish"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
