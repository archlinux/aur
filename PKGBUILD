# Maintainer: Kleshzz <vasyapulopapik@gmail.com>
pkgname=stutter-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Focus-aware process priority daemon for Hyprland"
arch=('x86_64')
url="https://github.com/Kleshzz/stutter"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=('stutter')
conflicts=('stutter' 'stutter-daemon')
source=("stutter::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/stutter"
  git describe --long --tags 2>/dev/null \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/stutter"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/stutter"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$srcdir/stutter"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$srcdir/stutter"

  # binary
  install -Dm755 "target/release/stutter" "$pkgdir/usr/bin/stutter"

  # systemd user service
  install -Dm644 "stutter.service" "$pkgdir/usr/lib/systemd/user/stutter.service"

  # license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # post-install hint about CAP_SYS_NICE
  install -Dm644 /dev/stdin "$pkgdir/usr/share/doc/$pkgname/README.capabilities" << 'EOF'
stutter needs CAP_SYS_NICE to adjust process priorities without root.
Run once after install:
  sudo setcap cap_sys_nice+ep /usr/bin/stutter
Or enable the systemd user service (it will work without root via polkit on some setups).
EOF
}