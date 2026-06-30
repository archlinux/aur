# Maintainer: Your Name <your.email@example.com>
pkgname=kanarenshu-git
_pkgname=kanarenshu
pkgver=r41.78d296d # This will auto-update when you run makepkg
pkgrel=1
pkgdesc="A minimal TUI application to practise Japanese from the terminal."
arch=('x86_64')
url="https://github.com/nuixyz/kanarenshu"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/nuixyz/kanarenshu.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # Generates a version based on total commits and latest commit hash
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgname"

  # Arch Linux Go packaging standard flags for secure and optimized binaries
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v -o "$_pkgname" ./cmd/kanarenshu
}

package() {
  cd "$_pkgname"

  # Install the executable binary
  install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin/"

  # Install documentation
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"

  # Install the license file (if present in the repo)
  if [ -f "LICENSE" ]; then
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
  fi
}
