# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=sysc-greet-hyprland
pkgver=1.0.7
pkgrel=1
pkgdesc="Graphical console greeter for greetd with ASCII art and themes (Hyprland compositor)"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysc-greet"
license=('MIT')
depends=('greetd' 'kitty' 'hyprland' 'swww')
optdepends=(
    'gslapper: Video wallpaper support'
)
makedepends=('go>=1.21')
provides=('sysc-greet')
conflicts=('sysc-greet-niri' 'sysc-greet-sway' 'sysc-greet')
source=("${pkgname%-*}-${pkgver}.tar.gz::https://github.com/Nomadcxx/sysc-greet/archive/v${pkgver}.tar.gz")
sha256sums=('2e7354d6096b36bcd4a2d19668a97c859624c654c74b07eb83d41a2fdc5df36f')
backup=('etc/greetd/config.toml' 'etc/greetd/hyprland-greeter-config.conf')
install=sysc-greet-hyprland.install

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
    install -Dm644 /dev/stdin "${pkgdir}/etc/greetd/hyprland-greeter-config.conf" <<'EOF'
# SYSC-Greet Hyprland config for greetd greeter session
# Monitors auto-detected by Hyprland at runtime

# No animations for faster greeter startup
animations {
    enabled = false
}

# Minimal decorations
decoration {
    rounding = 0
    blur {
        enabled = false
    }
}

# Greeter doesn't need gaps
general {
    gaps_in = 0
    gaps_out = 0
    border_size = 0
}

# CHANGED 2025-10-18 - Disable Hyprland wallpaper/logo for greeter
misc {
    disable_hyprland_logo = true
    disable_splash_rendering = true
    background_color = rgb(000000)
}

# Input configuration
input {
    kb_layout = us
    repeat_delay = 400
    repeat_rate = 40

    touchpad {
        tap-to-click = true
    }
}

# Disable all keybindings (security for greeter)
# No binds = no user control

# Window rules for kitty greeter
windowrulev2 = fullscreen, class:^(kitty)$
windowrulev2 = opacity 1.0 override, class:^(kitty)$

# Layer rules for wallpaper daemon
layerrule = blur, wallpaper

# Startup applications
exec-once = swww-daemon
exec-once = XDG_CACHE_HOME=/tmp/greeter-cache HOME=/var/lib/greeter kitty --start-as=fullscreen --config=/etc/greetd/kitty.conf /usr/local/bin/sysc-greet && hyprctl dispatch exit
EOF

    # Create cache directory
    install -dm755 "${pkgdir}/var/cache/sysc-greet"
    install -dm755 "${pkgdir}/var/lib/greeter/Pictures/wallpapers"

    # Install README
    install -Dm644 README.md "${pkgdir}/usr/share/doc/sysc-greet/README.md"
}
