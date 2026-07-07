# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=sysc-greet-cagebreak
pkgver=1.1.8
pkgrel=1
pkgdesc="Graphical console greeter for greetd with ASCII art and themes (Cagebreak compositor)"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysc-greet"
license=('GPL-3.0-only')
depends=('greetd' 'kitty' 'cagebreak' 'socat' 'gslapper')
optdepends=(
    'swww: Legacy wallpaper support (fallback)'
)
makedepends=('go>=1.25')
provides=('sysc-greet')
conflicts=('sysc-greet' 'sysc-greet-hyprland' 'sysc-greet-sway')
source=("${pkgname%-*}-${pkgver}.tar.gz::https://github.com/Nomadcxx/sysc-greet/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9ae9d12b0bde987250df96dd60ebdfcc0bba104b7352ec1ed1fad44b6975e24b')
# NOTE: config.toml intentionally NOT in backup - must be replaced when switching compositor variants
backup=('etc/greetd/cagebreak-greeter-config' 'etc/polkit-1/rules.d/85-greeter.rules')
install=sysc-greet-cagebreak.install

build() {
    cd "${srcdir}/sysc-greet-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -buildvcs=false -ldflags "-X main.Version=v${pkgver}" -o sysc-greet ./cmd/sysc-greet/
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

    # Install assets if present
    if [ -d "assets" ]; then
        install -dm755 "${pkgdir}/usr/share/sysc-greet/Assets"
        cp -r assets/* "${pkgdir}/usr/share/sysc-greet/Assets/" 2>/dev/null || true
    fi

    # Install wallpapers
    if [ -d "wallpapers" ]; then
        install -dm755 "${pkgdir}/usr/share/sysc-greet/wallpapers"
        cp -r wallpapers/* "${pkgdir}/usr/share/sysc-greet/wallpapers/" 2>/dev/null || true
    fi

    # Install greetd configs
    install -Dm644 config/cagebreak-greeter-config "${pkgdir}/etc/greetd/cagebreak-greeter-config"

    # Install polkit rule to allow greeter user to shutdown/reboot
    install -Dm644 /dev/stdin "${pkgdir}/etc/polkit-1/rules.d/85-greeter.rules" <<'EOF'
polkit.addRule(function(action, subject) {
    if ((action.id == "org.freedesktop.login1.power-off" ||
         action.id == "org.freedesktop.login1.reboot") &&
        subject.user == "greeter") {
        return polkit.Result.YES;
    }
});
EOF

    # Create cache directory
    install -dm755 "${pkgdir}/var/cache/sysc-greet"
    install -dm755 "${pkgdir}/var/lib/greeter/Pictures/wallpapers"

    # Install README
    install -Dm644 README.md "${pkgdir}/usr/share/doc/sysc-greet/README.md"
}
