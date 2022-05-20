# Maintainer: Aiyion <aur@aiyionpri.me>
_pkgname=warpforge
pkgname=$_pkgname-git
pkgver=r261.5be2023
pkgrel=1
pkgdesc="Putting things together. Consistently."
arch=('x86_64')
url="http://warpforge.io"
license=('MIT')
groups=()
depends=()
makedepends=('go' 'git')
checkdepends=()
# TODO optdepends: go-serum-analyzer
optdepends=()
provides=('warpforge-git')
conflicts=('warpforge')
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/warpfork/warpforge.git)
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
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
	go build -o build ./cmd/...
}

#check() {
#	cd "$_pkgname"
#	go test ./...
#}

package() {
        cd "$_pkgname"
	install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

