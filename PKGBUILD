# Maintainer: zeakz zeakz@protonmail.com
pkgname=tusk-launcher-git
pkgver=0.1.0.r77.g3678d86
pkgrel=1
pkgdesc="A Rust written gui app launcher for wlroots tiling wms"
arch=('x86_64')
url="https://github.com/padoruuuu/Tusk-Launcher"
license=('GPL-3')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'rust' 'cargo')
provides=('tusk-launcher')
conflicts=('tusk-launcher')
options=('!strip' '!debug')
source=("git+https://github.com/padoruuuu/Tusk-Launcher.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/Tusk-Launcher"
    if git describe --long --tags 2>/dev/null; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

prepare() {
    cd "$srcdir/Tusk-Launcher"
    # Create default config files
    mkdir -p default-config
    cat > default-config/config.toml << EOF
# Default Tusk Launcher configuration
# Edit your personal config at ~/.config/tusk-launcher/config.toml

[general]
theme = "dark"
# Add other default configurations here
EOF

    cat > default-config/app_cache.toml << EOF
# Default app cache configuration
# This file will be automatically populated
EOF
}

build() {
    cd "$srcdir/Tusk-Launcher"
    cargo build --release
}

package() {
    cd "$srcdir/Tusk-Launcher"
    
    # Install the binary
    install -Dm755 "target/release/Tusk-Launcher" "$pkgdir/usr/bin/tusk-launcher"
    
    # Install default config files
    install -Dm644 default-config/config.toml "$pkgdir/etc/tusk-launcher/config.toml"
    install -Dm644 default-config/app_cache.toml "$pkgdir/etc/tusk-launcher/app_cache.toml"
    
    # Install documentation
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

post_install() {
    echo "Tusk Launcher has been installed."
    echo "Default configuration files are located in /etc/tusk-launcher/"
    echo "To configure Tusk Launcher, copy the default config files to ~/.config/tusk-launcher/:"
    echo "mkdir -p ~/.config/tusk-launcher"
    echo "cp /etc/tusk-launcher/config.toml ~/.config/tusk-launcher/"
    echo "cp /etc/tusk-launcher/app_cache.toml ~/.config/tusk-launcher/"
}

post_upgrade() {
    post_install
}

post_remove() {
    echo "Tusk Launcher has been removed."
    echo "Your personal configuration in ~/.config/tusk-launcher/ has been preserved."
    echo "Remove it manually if you don't plan to use Tusk Launcher anymore."
}
