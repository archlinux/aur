# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=upterm-git
pkgver=0.10.0.r20.g9449cf0
pkgrel=1
pkgdesc="Secure terminal sharing"
arch=('i686' 'x86_64')
url="https://upterm.dev/"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
provides=("upterm=$pkgver")
conflicts=('upterm')
source=("git+https://github.com/owenthereal/upterm.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "upterm"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "upterm"

  make build docs
}

check() {
  cd "upterm"

  go test \
    ./...
}

package() {
  cd "upterm"

  GOBIN="$pkgdir/usr/bin" \
    go install ./cmd/...
  rm "$pkgdir/usr/bin/gendoc"

  install -dm755 "$pkgdir/usr/share/man"
  cp -a "etc/man/." "$pkgdir/usr/share/man"
  install -Dm644 "etc/completion/upterm.bash_completion.sh" "$pkgdir/usr/share/bash-completion/completions/upterm"
  install -Dm644 "etc/completion/upterm.zsh_completion" "$pkgdir/usr/share/zsh/site-functions/_upterm"
  install -Dm644 "systemd/uptermd.service" -t "$pkgdir/usr/lib/systemd/system"
}
