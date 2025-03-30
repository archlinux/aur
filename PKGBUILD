# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Contributor: Sam Whited <sam@samwhited.com>
# Contributor: Brian Clemens <brian@tiuxo.com>
# Contributor: Přemysl Janouch <p.janouch@gmail.com>

pkgname=hugo-git
pkgver=0.145.0.r29.gc15ebce2f
pkgrel=1
pkgdesc="A fast and flexible static site generator"
arch=('i686' 'x86_64')
url="https://gohugo.io/"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('git' 'go')
optdepends=('dart-sass: required to transpile Sass to CSS'
            'python-docutils: required for reStructuredText support')
provides=("hugo=$pkgver")
conflicts=('hugo')
source=("git+https://github.com/gohugoio/hugo.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "hugo"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "hugo"

  go build \
    -tags extended,withdeploy
  ./hugo gen man
}

check() {
  cd "hugo"

  #go test \
  #  ./...
}

package() {
  cd "hugo"

  GOBIN="$pkgdir/usr/bin" \
    go install \
      -tags extended,withdeploy

  install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1"

  install -d \
    "$pkgdir/usr/share/bash-completion/completions" \
    "$pkgdir/usr/share/fish/vendor_completions.d" \
    "$pkgdir/usr/share/zsh/site-functions"

  "$pkgdir/usr/bin/hugo" completion bash > "$pkgdir/usr/share/bash-completion/completions/hugo"
  "$pkgdir/usr/bin/hugo" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/hugo.fish"
  "$pkgdir/usr/bin/hugo" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_hugo"
}
