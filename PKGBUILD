# Maintainer: Lysec
pkgname=swiftfetch
pkgver=0.1.2
pkgrel=5
pkgdesc="A fast and efficient fetch utility written in Rust"
arch=('x86_64')
url="https://github.com/Ly-sec/swiftfetch"
license=('MIT')
depends=()
makedepends=('rust' 'cargo' 'git')
source=("$pkgname::git+https://github.com/Ly-sec/swiftfetch.git#tag=v0.1.2-5")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"
  # Install the binary
  install -Dm755 target/release/swiftfetch "$pkgdir/usr/bin/swiftfetch"

  # Install the default config file to a temporary location
  install -Dm644 config/config.toml "$pkgdir/usr/share/$pkgname/config.toml"

  # Install the license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install the README
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

post_install() {
  echo "Setting up configuration for swiftfetch..."

  config_dir="$HOME/.config/swiftfetch"
  config_file="$config_dir/config.toml"
  default_config="/usr/share/$pkgname/config.toml"

  if [[ ! -f $config_file ]]; then
    mkdir -p "$config_dir"
    cp "$default_config" "$config_file"
    echo "Default configuration copied to $config_file."
  else
    echo "Configuration already exists in $config_file. Skipping."
  fi
}
