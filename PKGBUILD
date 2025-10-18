# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=sysc-greet
pkgver=1.0.3
pkgrel=1
pkgdesc="Graphical console greeter for greetd with ASCII art and themes"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysc-greet"
license=('MIT')
depends=('greetd' 'kitty' 'niri' 'swww')
optdepends=(
    'gslapper: Video wallpaper support'
)
makedepends=('go>=1.21')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nomadcxx/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('701f76b33782199d3a8e9c4d6b72e9421821af5176e54fa4a7ec2db7b661f3f8')
backup=('etc/greetd/config.toml' 'etc/greetd/niri-greeter-config.kdl')
install=${pkgname}.install

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -buildvcs=false -o sysc-greet ./cmd/sysc-greet/
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

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
    install -Dm644 /dev/stdin "${pkgdir}/etc/greetd/niri-greeter-config.kdl" <<'EOF'
// SYSC-Greet Niri config for greetd greeter session
// Monitors auto-detected by niri at runtime

hotkey-overlay {
    skip-at-startup
}

input {
    keyboard {
        xkb {
            layout "us"
        }
        repeat-delay 400
        repeat-rate 40
    }

    touchpad {
        tap;
    }
}

layer-rule {
    match namespace="^wallpaper$"
    place-within-backdrop true
}

layout {
    gaps 0
    center-focused-column "never"

    focus-ring {
        off
    }

    border {
        off
    }
}

animations {
    off
}

window-rule {
    match app-id="kitty"
    opacity 0.90
}

spawn-at-startup "swww-daemon"

spawn-sh-at-startup "XDG_CACHE_HOME=/tmp/greeter-cache HOME=/var/lib/greeter kitty --start-as=fullscreen --config=/etc/greetd/kitty.conf /usr/local/bin/sysc-greet; niri msg action quit --skip-confirmation"

binds {
}
EOF

    # Create cache directory
    install -dm755 "${pkgdir}/var/cache/sysc-greet"
    install -dm755 "${pkgdir}/var/lib/greeter/Pictures/wallpapers"

    # Install README
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
