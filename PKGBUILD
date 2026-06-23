# Maintainer: schultz-dev0
pkgname=cloudyy-hcm-git
pkgver=0.1.0.r1.1434d83
pkgrel=1
pkgdesc="Hyprland config manager for Cloud Center (cloudyy-linux)"
arch=('x86_64' 'aarch64')
url="https://github.com/schultz-dev0/hcm"
license=('MIT')
depends=()
makedepends=('cargo' 'git')
provides=('hcm')
conflicts=('hcm')
source=("${pkgname}::git+https://github.com/schultz-dev0/hcm.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local ver
  if ver="$(git describe --long --tags 2>/dev/null)"; then
    sed 's/\([^-]*-g\)/r\1/;s/-/./g' <<<"$ver"
  else
    printf '0.1.0.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --locked
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/hcm "$pkgdir/usr/bin/hcm"
  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
