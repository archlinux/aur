# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=maiao
pkgver=1.0.1
pkgrel=1
pkgdesc="Seamless GitHub PR management from the command-line, using the git-review command"
arch=('x86_64')
url="https://github.com/adevinta/maiao"
license=('MIT')
depends=('glibc')
makedepends=('go')
conflicts=('git-review')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/adevinta/maiao/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('289d3396dc15f16ba1a987963401bdb594482a691b9b7b497f288656862d7bb6')

build() {
  cd "$pkgname-$pkgver"

  # Recommended settings for Go build
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  # Build binary
  go build \
     -ldflags "-X github.com/adevinta/maiao/pkg/version.Version=${pkgver}" \
     ./cmd/maiao

  # Build shell completion files
  for shell in bash fish zsh; do
    ./maiao completion $shell > git-review.$shell
  done
}

package() {
  cd "$pkgname-$pkgver"

  # Install binary
  install -Dm755 maiao "$pkgdir/usr/bin/git-review"

  # Install shell completion files
  install -Dm644 git-review.bash "$pkgdir/usr/share/bash-completion/completions/git-review"
  install -Dm644 git-review.fish "$pkgdir/usr/share/fish/vendor_completions.d/git-review.fish"
  install -Dm644 git-review.bash "$pkgdir/usr/share/zsh/site-functions/_git-review"
}
