# Maintainer: Blallo <blallo@autistici.org>

pkgname="savvy-git"
pkgver="0.16.0.r1.g0e3533d"
pkgrel="1"
pkgdesc="Command line tool for savvy services services (built from master)"
arch=("x86_64")
url="https://getsavvy.so"
license=("MIT")
depends=("go")
provides=("savvy")
conflicts=("savvy")
source=("savvy-cli::git+https://github.com/getsavvyinc/savvy-cli")
sha256sums=('SKIP')

pkgver() {
  cd savvy-cli
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p "$pkgname-$pkgver/build/"
}

build() {
  cd savvy-cli
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags="-linkmode=external -s -w -X github.com/getsavvyinc/savvy-cli/config.version=${pkgver}" \
    -o ../$pkgname-$pkgver/build \
    ./
}

package() {
  mkdir -p completions
  cp "$pkgname-$pkgver/build/savvy-cli" ./savvy
  chmod +x ./savvy
  ./savvy completion bash > completions/savvy
  ./savvy completion zsh > completions/_savvy
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  mkdir -p "$pkgdir/usr/share/zsh/site-functions"
  install -m755 savvy "$pkgdir/usr/bin"
  install -m644 completions/savvy "$pkgdir/usr/share/bash-completion/completions"
  install -m644 completions/_savvy "$pkgdir/usr/share/zsh/site-functions"
}

# vim:et ts=2 sts=0 sw=0:
