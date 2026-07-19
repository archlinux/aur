# Maintainer: zyvxi <>
pkgname=grovebox
pkgver=1.0.0
pkgrel=2
pkgdesc='Standalone Roblox Studio launcher for Linux (Wine + DXVK + WebView2)'
arch=('x86_64')
url='https://github.com/zyvxi/grovebox'
license=('MIT')
depends=(
    'python'
    'wine'
    'cabextract'
    'vulkan-icd-loader'
    'xdg-utils'
)
optdepends=(
    'python-cryptography: browser cookie auto-detection and v10 cookie encryption'
    'mangohud: FPS overlay'
    'nvidia-utils: NVIDIA GPU support'
    'lib32-nvidia-utils: NVIDIA GPU 32-bit support'
    'mesa: AMD/Intel GPU support'
    'lib32-mesa: AMD/Intel 32-bit GPU support'
)
makedepends=()
install=grovebox.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/zyvxi/grovebox/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 src/bootstrap.py "$pkgdir/usr/share/grovebox/bootstrap.py"
    install -Dm644 src/dpapi_helper.cs "$pkgdir/usr/share/grovebox/dpapi_helper.cs"
    install -Dm755 src/grovebox-auth-handler "$pkgdir/usr/share/grovebox/grovebox-auth-handler"

    install -Dm644 grovebox.desktop "$pkgdir/usr/share/applications/grovebox.desktop"
    install -Dm644 grovebox-auth-handler.desktop "$pkgdir/usr/share/applications/grovebox-auth-handler.desktop"
    install -Dm644 icons/grovebox.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/grovebox.svg"

    install -d "$pkgdir/usr/bin"
    printf '#!/bin/sh\nexec python3 /usr/share/grovebox/bootstrap.py "$@"\n' \
        > "$pkgdir/usr/bin/grovebox"
    chmod 755 "$pkgdir/usr/bin/grovebox"

    printf '#!/bin/sh\nexec python3 /usr/share/grovebox/grovebox-auth-handler "$@"\n' \
        > "$pkgdir/usr/bin/grovebox-auth-handler"
    chmod 755 "$pkgdir/usr/bin/grovebox-auth-handler"
}
