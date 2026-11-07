# Maintainer: Aether <https://github.com/clague/aether-shell/issues>

pkgname=aether-shell-git
_pkgname=aether-shell
pkgver=2.5.0.r1142.g1334e23
pkgrel=1
pkgdesc='Quickshell desktop shell for Hyprland, merging MiDnight Shell and OP-Caelestia'
arch=('x86_64')
url='https://github.com/clague/aether-shell'
license=('GPL-3.0-only')
depends=(
    # Shell runtime
    'quickshell-git'
    'glibc'
    'gcc-libs'
    'hyprland'
    'xkeyboard-config'

    # In-tree command surface (bin/aether): scheme, wallpaper, screenshots, recording
    'python'
    'python-materialyoucolor'
    'python-pillow'
    'python-dbus'
    'python-gobject'
    'ffmpeg'
    'grim'
    'slurp'
    'swappy'
    'wl-clipboard'
    'gpu-screen-recorder'
    'dart-sass'
    'dconf'

    # Services and hardware
    'networkmanager'
    'lm_sensors'
    'power-profiles-daemon'
    'ddcutil'
    'brightnessctl'
    'libcava'
    'libpipewire'
    'libqalculate'
    'aubio'
    'protobuf'
    'openssl'

    # Qt modules
    'qt6-base'
    'qt6-declarative'
    'qt6-imageformats'
    'qt6-multimedia'
    'qt6-m3shapes-git'

    # Small helpers the QML calls by name
    'bash'
    'fish'
    'lua'
    'cliphist'
    'fuzzel'
    'libnotify'
    'libsecret'
    'libxml2'
    'unzip'
    'procps-ng'
    'xdg-utils'
    'fontconfig'

    # Fonts the defaults name
    'ttf-material-symbols-variable'
    'ttf-cascadia-code-nerd'
)
optdepends=(
    'hyprmoncfg: save and restore monitor layouts from the Display page'
    'bluez: Bluetooth devices and the pairing agent'
    'fprintd: fingerprint unlock on the lock screen'
    'howdy-next: face unlock on the lock screen'
    'asdbctl: brightness for Apple Studio Displays'
    'xdg-desktop-portal-hyprland: screen sharing and file pickers'
    'python-playwright: web search/read tools in the AI assistant (then run playwright install chromium)'
    'ttf-rubik-vf: alternative UI font for older configs'
)
makedepends=('git' 'cmake' 'ninja' 'qt6-shadertools')
provides=('aether-shell')
conflicts=('aether-shell')
install=aether-shell.install
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    # A fork does not always push its tags. Fall back to the commit count rather than failing
    # the build with "No names found, cannot describe anything".
    if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
        git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

build() {
    cd "$srcdir/$pkgname"

    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/ \
        -DDISTRIBUTOR="AUR (package: $pkgname)"
    cmake --build build
}

package() {
    cd "$srcdir/$pkgname"

    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    # The Hyprland side of the shell is not read at runtime. Ship it as a reference so the
    # post-install message can point at real keybinds and variables instead of a wiki.
    install -d "$pkgdir/usr/share/$_pkgname"
    cp -a hypr "$pkgdir/usr/share/$_pkgname/hypr"
}
