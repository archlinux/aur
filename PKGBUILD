# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sops-git
pkgver=3.7.3.r0.ge1edc0594
pkgrel=1
pkgdesc="Simple and flexible tool for managing secrets"
arch=('i686' 'x86_64')
url="https://github.com/mozilla/sops"
license=('MPL2')
depends=('glibc')
makedepends=('git' 'go')
provides=("sops=$pkgver")
conflicts=('sops')
source=("git+https://github.com/mozilla/sops.git"
        "bash_autocomplete::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/sops/trunk/bash_autocomplete"
        "zsh_autocomplete::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/sops/trunk/zsh_autocomplete")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "sops"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "sops"

  go build \
    ./cmd/sops
}

check() {
  cd "sops"

  #go test \
  #  ./...
}

package() {
  cd "sops"

  install -Dm755 "sops" -t "$pkgdir/usr/bin"
  install -Dm644 "README.rst" -t "$pkgdir/usr/share/doc/sops"

  install -Dm644 "$srcdir/bash_autocomplete" "$pkgdir/usr/share/bash-completion/completions/sops"
  install -Dm644 "$srcdir/zsh_autocomplete" "$pkgdir/usr/share/zsh/site-functions/_sops"
}
