# Maintainer: G34RZ <g3arz@dockservices.co>
pkgbase=system76-power-gui
pkgname=system76-power-gui
pkgver=0.1.1
pkgrel=1
pkgdesc="GUI application for System76 Power Management"
arch=('x86_64')
url="https://gitea.dockservices.co/G34RZ/system76-power-GUI.git"
license=('MIT')
depends=('system76-power' 'polkit' 'gtk3')
makedepends=('go' 'gcc' 'git')

prepare() {
    mkdir -p "$srcdir/$pkgname-$pkgver"
    cd "$startdir"
    cp -t "$srcdir/$pkgname-$pkgver/" \
        power-gui.go \
        system76-power-gui.desktop \
        90-system76-power.rules \
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
    go build -o system76-power-gui
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install binary
    install -Dm755 system76-power-gui "$pkgdir/usr/bin/system76-power-gui"
    
    # Install for Wayland
    install -Dm644 system76-power-gui.desktop "$pkgdir/usr/share/applications/system76-power-gui.desktop"
    
    # Install polkit rules
    install -Dm644 90-system76-power.rules "$pkgdir/usr/share/polkit-1/rules.d/90-system76-power.rules"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
