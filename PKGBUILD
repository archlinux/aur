# Maintainer: zeakz zeakz@protonmail.com
pkgname=tusk-launcher-git
pkgver=0.1.0.r76.g969b819  # Example version, it will update dynamically
pkgrel=1
pkgdesc="A Rust written gui app launcher for wlroots tiling wms"
arch=('any')
url="https://github.com/padoruuuu/Tusk-Launcher"
license=('GPL-3')  # Confirm license type
depends=('glibc')  # Add runtime dependencies if needed
makedepends=('git' 'rust' 'cargo')  # Only Rust build tools are needed
provides=('tusk-launcher')
conflicts=('tusk-launcher')
options=('!strip' '!debug' 'staticlibs')  # Added staticlibs
source=("git+https://github.com/padoruuuu/Tusk-Launcher.git")
sha256sums=('SKIP')  # SHA256 checksum not needed for git-based source

pkgver() {
  cd "$srcdir/Tusk-Launcher"
  if git rev-parse --verify HEAD >/dev/null 2>&1; then
    git describe --long --tags || echo "0.1.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
  else
    echo "0.1.0.r0.g$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "$srcdir/Tusk-Launcher"
  RUSTFLAGS="-C strip=symbols" cargo build --release
}

package() {
  cd "$srcdir/Tusk-Launcher"
  
  # Install the binary globally to /usr/bin
  install -Dm755 "target/release/Tusk-Launcher" "$pkgdir/usr/bin/tusk-launcher"
  
  # Install other files such as LICENSE and README
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  
  # Create the necessary directory for user configuration in ~/.config/tusk-launcher
  install -dm755 "$pkgdir/usr/share/tusk-launcher"

  # Create directory for the user config if it doesn't exist
  install -dm755 "$pkgdir/etc/xdg/tusk-launcher"  # This will be used for default config
}

post_install() {
  # Create a default configuration directory for the user
  mkdir -p "$HOME/.config/tusk-launcher"
  
  # Tell the user that config files will be generated the first time the app is run
  echo "Tusk Launcher has been installed. The config files (config.toml and app_cache.toml) will be generated after the first run."
}

post_upgrade() {
  # Nothing extra to do here
  post_install
}

post_remove() {
  # Optionally, you can remove the configuration files when the package is removed
  rm -f "$HOME/.config/tusk-launcher/config.toml"
  rm -f "$HOME/.config/tusk-launcher/app_cache.toml"
}
