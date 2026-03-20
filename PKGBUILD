
# Maintainer: Sankalp <contact@sankalptharu.com.np>
pkgname=lapctl-git
_pkgname=lapctl
pkgver=0.1.r15.g2733215
pkgrel=1
pkgdesc="Control Linux laptop hardware (Graphics, Battery, Power, Cooling, Display) with Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/S4NKALP/lapctl"
license=('MIT')
depends=('gcc-libs' 'systemd')
optdepends=('xrandr: for GPU switching on X11'
            'nvidia-settings: for NVIDIA GPU switching on X11')
makedepends=('rust' 'cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=lapctl-git.install
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # Generates version based on latest tag + distance + hash
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "0.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$_pkgname"

  # Install binary
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # Install License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Extract and install udev rules automatically from source
  # This ensures the rules are always in sync with the binary logic
  echo "Extracting udev rules from source..."
  awk '/const LAPCTL_UDEV_RULES: &str = r#"/{flag=1; next} /"#;/{flag=0} flag' src/commands/install_rules.rs > 99-lapctl.rules

  install -Dm644 99-lapctl.rules "$pkgdir/usr/lib/udev/rules.d/99-lapctl.rules"

  # Install README
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
