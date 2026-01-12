# Maintainer: Gumieri <seu-email@dominio.com>
pkgname=p-gumieri-git
_pkgname=p
pkgver=r30.b1f603a
pkgrel=1
pkgdesc="p(roject): Collection of helping commands for the management of projects using git."
arch=('x86_64' 'aarch64')
url="https://github.com/gumieri/p"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go' 'make')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  make build
}

package() {
  cd "$_pkgname"

  install -Dm755 p "$pkgdir/usr/bin/p"

  if [ -f "LICENSE" ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi

  if [ -f "zsh/p.plugin.zsh" ]; then
    install -Dm644 "zsh/p.plugin.zsh" "$pkgdir/usr/share/zsh/plugins/$_pkgname/$_pkgname.plugin.zsh"
  fi
}
