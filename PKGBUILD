# Maintainer: G34RZ <g3arz@dockservices.co>
pkgbase=system76-power-gui-x11
pkgname=system76-power-gui-x11
pkgver=0.2.1
pkgrel=0
pkgdesc="GUI application for System76 Power Management"
arch=('x86_64')
url="https://gitea.dockservices.co/G34RZ/system76-power-GUI-x11.git"
license=('MIT')
depends=('system76-power' 'polkit' 'gtk3')
makedepends=('go' 'gcc' 'git')

prepare() {
  mkdir -p "$srcdir/$pkgname-$pkgver"
  cd "$startdir"
  cp -t "$srcdir/$pkgname-$pkgver/" \
    power-gui.go \
    system76-power-gui-x11.desktop \
    90-system76-power-gui-x11.rules \
    LICENSE \
    go.mod \
    go.sum \
    2>/dev/null || true
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export MAKEFLAGS="-j$(nproc)"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOMAXPROCS=$(nproc)
  go build -o system76-power-gui-x11
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install binary
  install -Dm755 system76-power-gui-x11 "$pkgdir/usr/bin/system76-power-gui-x11"

  # Install X11 desktop entry
  install -Dm644 system76-power-gui-x11.desktop "$pkgdir/usr/share/applications/system76-power-gui-x11.desktop"

  # Install polkit rules
  install -Dm644 90-system76-power-gui-x11.rules "$pkgdir/usr/share/polkit-1/rules.d/90-system76-power-gui-x11.rules"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
