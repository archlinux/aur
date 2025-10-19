# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=sysc-greet-sway
pkgver=1.0.4
pkgrel=4
pkgdesc="Graphical console greeter for greetd with ASCII art and themes (Sway compositor)"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysc-greet"
license=('MIT')
depends=('greetd' 'kitty' 'sway' 'swww')
optdepends=(
    'gslapper: Video wallpaper support'
)
makedepends=('go>=1.21')
provides=('sysc-greet')
conflicts=('sysc-greet-niri' 'sysc-greet-hyprland' 'sysc-greet')
source=("${pkgname%-*}-${pkgver}.tar.gz::https://github.com/Nomadcxx/sysc-greet/archive/v${pkgver}.tar.gz")
sha256sums=('a65a7e058559d81487f05d81aff2c672eff0bc7acc0b6c754165a6741ebf32dd')
backup=('etc/greetd/config.toml' 'etc/greetd/sway-greeter-config')
install=sysc-greet-sway.install

build() {
    cd "${srcdir}/sysc-greet-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -buildvcs=false -o sysc-greet ./cmd/sysc-greet/
}

package() {
    cd "${srcdir}/sysc-greet-${pkgver}"

    # Install binary
    install -Dm755 sysc-greet "${pkgdir}/usr/local/bin/sysc-greet"

    # Install ASCII configs
    install -dm755 "${pkgdir}/usr/share/sysc-greet/ascii_configs"
    cp -r ascii_configs/* "${pkgdir}/usr/share/sysc-greet/ascii_configs/"

    # Install fonts
    install -dm755 "${pkgdir}/usr/share/sysc-greet/fonts"
    cp -r fonts/* "${pkgdir}/usr/share/sysc-greet/fonts/"

    # Install kitty config
    install -Dm644 config/kitty-greeter.conf "${pkgdir}/etc/greetd/kitty.conf"

    # Install Assets if present
    if [ -d "Assets" ]; then
        install -dm755 "${pkgdir}/usr/share/sysc-greet/Assets"
        cp -r Assets/* "${pkgdir}/usr/share/sysc-greet/Assets/" 2>/dev/null || true
    fi

    # Install wallpapers
    if [ -d "wallpapers" ]; then
        install -dm755 "${pkgdir}/usr/share/sysc-greet/wallpapers"
        cp -r wallpapers/* "${pkgdir}/usr/share/sysc-greet/wallpapers/" 2>/dev/null || true
    fi

    # Install greetd configs
    install -Dm644 /dev/stdin "${pkgdir}/etc/greetd/sway-greeter-config" <<'EOF'
# SYSC-Greet Sway config for greetd greeter session
# Monitors auto-detected by Sway at runtime

# Disable window borders
default_border none
default_floating_border none

# No gaps needed for greeter
gaps inner 0
gaps outer 0

# Input configuration
input * {
    xkb_layout "us"
    repeat_delay 400
    repeat_rate 40
}

input type:touchpad {
    tap enabled
}

# Disable all keybindings (security)
# Empty config = no keys work

# Window rules for kitty
for_window [app_id="kitty"] fullscreen enable

# Startup applications
exec swww-daemon
exec "XDG_CACHE_HOME=/tmp/greeter-cache HOME=/var/lib/greeter kitty --start-as=fullscreen --config=/etc/greetd/kitty.conf /usr/local/bin/sysc-greet; swaymsg exit"
EOF

    # Create cache directory
    install -dm755 "${pkgdir}/var/cache/sysc-greet"
    install -dm755 "${pkgdir}/var/lib/greeter/Pictures/wallpapers"

    # Install README
    install -Dm644 README.md "${pkgdir}/usr/share/doc/sysc-greet/README.md"
}
