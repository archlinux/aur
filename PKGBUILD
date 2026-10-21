# Maintainer: Martin Kopecký <kopecky@thekrew.app>
pkgname=spot-git
pkgver=0.1.0.r0.g7b06aa4
pkgrel=1
pkgdesc='TOML+CSS dialog runtime for Wayland (layer-shell overlays), built from git'
arch=('x86_64')
url='https://github.com/KopyTKG/spot'
license=('MIT')
depends=('glibc' 'gtk4' 'gtk4-layer-shell')
makedepends=('git' 'go')
provides=('spot')
conflicts=('spot' 'spot-bin')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g' \
    || printf "0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}" CGO_CFLAGS="${CFLAGS}" CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}" GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o spot .
}

package() {
  cd "$pkgname"
  install -Dm755 spot "$pkgdir/usr/bin/spot"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
