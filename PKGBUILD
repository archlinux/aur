# Maintainer: Madko <madko77 at gmail.com>
pkgname=swaync-widgets-git
_pkgname=swaync-widgets
pkgver=r25.5352701
pkgrel=1
pkgdesc="A tool for dynamically updating swaync config files based on states."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/luiz734/swaync-widgets/"
options=()
license=('MIT')
depends=(
)
optdepends=(
)
makedepends=('go>=1.21')
provides=('swaync-widgets')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
            || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd $_pkgname
    git checkout main
}

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$_pkgname"
  ./install.sh
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "build/swaync-widgets" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
