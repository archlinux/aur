# Maintainer: OGIOS <ogios@foxmail.com>
_pkgname=way-edges
pkgname=way-edges-git
pkgver=r677.12f81fc
pkgrel=1
pkgdesc="Hidden widget on screen edges"
arch=('x86_64' 'aarch64')
url="https://github.com/way-edges/way-edges"
license=('MIT')

provides=(way-edges)
conflicts=("$_pkgname"-bin)

depends=(
  'cairo'
  'wayland'
  'libpulse'
)
optdepends=(
  'hyprland: A C++ Compositor'
  'niri: A Rust Compositor based on smithay'
)
makedepends=(cargo git)

source=("git+$url.git")
options=(!debug)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  # printf "%s" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"

  export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src --cfg tokio_unstable -C target-cpu=native"
  cargo build --release --frozen
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"

  # bash completion
  mkdir -p "$pkgdir"/usr/share/bash-completion/completions/
  install -m 0644 way-edges-bash-complete.bash "$pkgdir"/usr/share/bash-completion/completions/$_pkgname
}
