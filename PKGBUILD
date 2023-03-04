# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Abs3nt <abs3nt@asdf.cafe>

pkgname=realize-git
pkgver=3.0.0.r0.gaa3f576
pkgrel=1
pkgdesc=''
arch=('x86_64')
url="https://github.com/abs3ntdev/realize"
license=('GPL')
provides=(realize)
conflicts=(realize)
makedepends=('go')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd realize
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd realize
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
  ./realize completion zsh > realize_zsh
  ./realize completion bash > realize_bash
  ./realize completion fish > realize_fish
}

package() {
  cd realize
  install -Dm755 realize "$pkgdir"/usr/bin/realize
  install -Dm644 realize_zsh "$pkgdir"/usr/share/zsh/site-functions/_realize
  install -Dm644 realize_bash "$pkgdir"/usr/share/bash-completion/completions/realize
  install -Dm644 realize_fish "$pkgdir"/usr/share/fish/vendor_completions.d/realize.fish
}
