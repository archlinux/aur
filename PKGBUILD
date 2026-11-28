# Maintainer: Martin Kopecký <kopecky@thekrew.app>
pkgname=spot-git
pkgver=0.10.0.r0.g7a45500
pkgrel=1
pkgdesc='TOML+CSS dialog runtime for Wayland (layer-shell overlays), built from git'
arch=('x86_64')
url='https://github.com/KopyTKG/spot'
license=('MIT')
depends=('glibc' 'gtk4' 'gtk4-layer-shell')
optdepends=('wl-clipboard: submit.copy')
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
  go build -ldflags "-X main.version=$pkgver" -o spot .
  # Static, and so not pie: the mod host's sandbox grants it nothing but itself.
  CGO_ENABLED=0 GOFLAGS="-trimpath -mod=readonly -modcacherw" go build -buildmode=exe -o spot-mod-host ./cmd/spot-mod-host
}

package() {
  cd "$pkgname"
  install -Dm755 spot "$pkgdir/usr/bin/spot"
  install -Dm755 spot-mod-host "$pkgdir/usr/bin/spot-mod-host"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/spot/README.md"
  # examples/ has a demo/ subdirectory, which `install -t ... examples/*` would refuse
  cp -r examples "$pkgdir/usr/share/doc/spot/"
  [ ! -d docs ] || cp -r docs "$pkgdir/usr/share/doc/spot/"   # absent before v0.2.1
  [ ! -f packaging/systemd/spot.service ] ||   # absent before v0.4.1
    install -Dm644 packaging/systemd/spot.service "$pkgdir/usr/lib/systemd/user/spot.service"
}
