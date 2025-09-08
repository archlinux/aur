# Maintainer: Bart Libert <bart plus aur at libert dot email>
_pkgname=waybar-niri-windows
pkgname=$_pkgname-git
pkgver=r5.048bf64
pkgrel=1
pkgdesc='Niri focus indicator for Waybar'
arch=('x86_64')
url="https://github.com/calico32/waybar-niri-windows"
license=('MIT')
makedepends=('go' 'git')
depends=('waybar' 'niri>=25.08' 'glibc')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "$_pkgname"
  mkdir -p build/
}

build() {
  cd "$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./...
}

check() {
  cd "$_pkgname"
  go test ./...
}

package() {
  cd "$_pkgname"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
