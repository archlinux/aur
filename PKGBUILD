# Maintainer: Jon Kinney <jon@headway.io>
pkgname=hyprcorrect-bin
_pkgname=hyprcorrect
pkgver=0.3.0
pkgrel=1
pkgdesc="Keyboard-driven desktop spelling and typo corrector (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/jondkinney/hyprcorrect"
license=('MIT' 'Apache-2.0')
options=(!debug)
depends=(
    'fontconfig'
    'freetype2'
    'hyprland'
    'libglvnd'
    'libsecret'
    'libxkbcommon'
    'wayland'
    'wtype'
)
optdepends=(
    'wl-clipboard: enables the clipboard / selection fallback when the keystroke buffer is empty'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::https://github.com/jondkinney/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::https://github.com/jondkinney/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64.tar.gz")
sha256sums_x86_64=('fda18b76b78b0f5a30f315efa807d28fffe25cfb61507aa80fafa2ebf63e3ad1')
sha256sums_aarch64=('07e6953ae8890d64a63303a97b3e9a2ff21926ded5f51290bee1fa8c11d47c5e')

package() {
    # The release tarball is named after the host arch — $CARCH is set
    # by makepkg so we pick the right one whether we're packaging on
    # x86_64 or aarch64.
    cd "$srcdir/$_pkgname-$pkgver-$CARCH"

    install -Dm755 hyprcorrect "$pkgdir/usr/bin/hyprcorrect"
    install -Dm644 hyprcorrect.desktop "$pkgdir/usr/share/applications/hyprcorrect.desktop"

    # The release tarball ships the pre-rendered hicolor icon tree under
    # icons/ (see release.yml) — without installing it the .desktop's
    # Icon=hyprcorrect resolves to nothing and launchers (walker, etc.)
    # show a blank entry.
    install -Dm644 icons/hicolor/scalable/apps/hyprcorrect.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/hyprcorrect.svg"
    for size in 16 22 24 32 48 64 128 256 512; do
        install -Dm644 "icons/hicolor/${size}x${size}/apps/hyprcorrect.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/hyprcorrect.png"
    done

    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
