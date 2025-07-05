# Maintainer: Musagy <diegomusagy@gmail.com>
pkgname=hypremoji
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern emoji picker for Hyprland, written in Rust + GTK4"
arch=('x86_64')
url="https://github.com/Musagy/hypremoji"
license=('ISC')
depends=(
  'gtk4'
  'noto-fonts-emoji'
  'wl-clipboard'  # provides wl-copy, wl-paste
  'hyprland'      # needed for hyprctl
)
makedepends=('git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')
provides=("$pkgname")
conflicts=("$pkgname")
options=(!debug)
install=$pkgname.install

prepare() {
  cd "$pkgname"
  
  # Check if rustc is available
  if ! command -v rustc &> /dev/null; then
    echo "================================================"
    echo ">   Rust is required to compile this package   <"
    echo "================================================"
    echo ""
    echo "How would you like to install Rust?"
    echo ""
    echo "1. Rustup (official script from rust-lang.org) - RECOMMENDED [default]"
    echo "2. Pacman (official Arch repository)"
    echo ""
    echo "NOTE: Rustup is recommended for development because:"
    echo "- Supports multiple Rust versions"
    echo "- Better compatibility with rust-analyzer"
    echo "- More frequent updates"
    echo "- Fewer conflicts with development tools"
    echo ""
    read -p "Choose an option (1/2) [1]: " rust_option
    
    # Default to option 1 if input is empty
    rust_option=${rust_option:-1}
    
    case $rust_option in
      1)
        echo "Installing Rust using rustup..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        source ~/.cargo/env
        echo "Rust successfully installed."
        ;;
      2)
        echo "Installing Rust using pacman..."
        sudo pacman -S rust cargo
        ;;
      *)
        echo "Invalid option. Exiting..."
        exit 1
        ;;
    esac
    
    echo ""
    echo "Verifying installation..."
    if ! command -v rustc &> /dev/null; then
      echo "Error: Rust was not installed correctly."
      echo "You may need to restart your terminal or run:"
      echo "source ~/.cargo/env"
      exit 1
    fi
  fi
  
  echo "✓ Rust found: $(rustc --version)"
  echo "✓ Cargo found: $(cargo --version)"
  
  # Check that we have a recent version of Rust
  rust_version=$(rustc --version | grep -oE '[0-9]+\.[0-9]+' | head -1)
  echo "✓ Using Rust $rust_version"
}

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"

  install -Dm755 "target/release/hypremoji" "$pkgdir/usr/bin/hypremoji"

  install -d "$pkgdir/usr/share/hypremoji/assets"
  cp -r assets/* "$pkgdir/usr/share/hypremoji/assets/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "setting_in_hyprland_config.sh" "$pkgdir/usr/share/hypremoji/setting_in_hyprland_config.sh"
}

