# Maintainer: Stewart Wong <siwei.wong@gmail.com>
pkgname=hamr
pkgver=0.15.0
pkgrel=1
pkgdesc='Extensible launcher for Hyprland and Niri built with Quickshell'
arch=('any')
url='https://github.com/Stewart86/hamr'
license=('GPL-3.0-or-later')
depends=(
    # Core (quickshell is in extra repo)
    'quickshell'
    'qt6-5compat'

    # Python runtime
    'python'
    'python-click'

    # Thumbnail generation
    'python-loguru'
    'python-tqdm'
    'python-gobject'
    'gnome-desktop-4'

    # Clipboard
    'wl-clipboard'
    'cliphist'

    # File search
    'fd'
    'fzf'

    # Desktop integration
    'xdg-utils'
    'libnotify'
    'gtk3'
    'libpulse'
    'jq'

    # Calculator
    'libqalculate'

    # Fonts
    'ttf-material-symbols-variable'
    'ttf-jetbrains-mono-nerd'
)
optdepends=(
    'hyprland: Hyprland compositor support'
    'niri: Niri compositor support'
    'ttf-readex-pro: Reading font for cards (AUR)'
    'matugen: Material You color generation from wallpapers'
    'tesseract: OCR text extraction for screenshot search'
    'tesseract-data-eng: English OCR language data'
    'imagemagick: Alternative thumbnail generation'
    'bitwarden-cli: Bitwarden password manager integration'
    'python-keyring: Secure session storage for Bitwarden plugin'
    'slurp: Screen region selection for screenshots'
    'wf-recorder: Screen recording'
)
source=("$pkgname-$pkgver::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')
install=hamr.install

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install to /etc/xdg/quickshell/hamr (system-wide quickshell config)
    install -dm755 "$pkgdir/etc/xdg/quickshell/$pkgname"
    cp -r modules services plugins scripts assets defaults "$pkgdir/etc/xdg/quickshell/$pkgname/"
    cp *.qml "$pkgdir/etc/xdg/quickshell/$pkgname/"

    # Install hamr command
    install -Dm755 hamr "$pkgdir/usr/bin/$pkgname"

    # Install systemd user service (for Niri and other systemd-based compositors)
    install -Dm644 hamr.service "$pkgdir/usr/lib/systemd/user/hamr.service"
}
