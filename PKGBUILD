# Maintainer: Blumenwagen
pkgname=synx-git
pkgver=v25.faaa664
pkgrel=1
pkgdesc="A fast and easy CLI tool for managing dotfiles with git-based version control"
arch=('x86_64')
url="https://github.com/Blumenwagen/synx"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('git' 'go')
provides=('synx')
conflicts=('synx')
source=("git+https://github.com/Blumenwagen/synx.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/synx"
  local _count=$(git rev-list HEAD -- . ":(exclude)*.md" | wc -l | tr -d ' ')
  local _hash=$(git rev-parse --short HEAD)
  printf "v%s.%s" "$_count" "$_hash"
}

build() {
  cd "$srcdir/synx/synx-go"
  
  # Set up a clean environment for reproducible builds
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  # We use the build.sh version extraction, as they did originally
  # Must run from repo root to match pkgver() count
  pushd "$srcdir/synx" >/dev/null
  COM_COUNT=$(git rev-list HEAD -- . ":(exclude)*.md" | wc -l | tr -d ' ')
  COM_HASH=$(git rev-parse --short HEAD)
  popd >/dev/null
  VERSION="v${COM_COUNT}-${COM_HASH}"

  go build -ldflags="-X 'github.com/Blumenwagen/synx/cmd.Version=$VERSION' -linkmode external" \
           -o synx .
}

package() {
  cd "$srcdir/synx/synx-go"
  install -Dm755 synx "$pkgdir/usr/bin/synx"
  
  cd "$srcdir/synx"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
