# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gum-git
pkgver=0.2.0.r8.g378a000
pkgrel=2
pkgdesc="A tool for glamorous shell scripts"
arch=('i686' 'x86_64')
url="https://github.com/charmbracelet/gum"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=("gum=$pkgver")
conflicts=('gum')
source=("git+https://github.com/charmbracelet/gum.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "gum"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "gum"

  go build \
    ./

  ./gum man > "gum.1"

  for shell in bash fish zsh; do
    ./gum completion "$shell" > "$shell-completion"
  done
}

check() {
  cd "gum"

  #go test \
  #  ./...
}

package() {
  cd "gum"

  install -Dm755 "gum" -t "$pkgdir/usr/bin"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/gum"
  install -Dm644 "gum.1" -t "$pkgdir/usr/share/man/man1"

  install -Dm644 "bash-completion" "$pkgdir/usr/share/bash-completion/completions/gum"
  install -Dm644 "fish-completion" "$pkgdir/usr/share/fish/vendor_completions.d/gum.fish"
  install -Dm644 "zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_gum"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/gum"
}
