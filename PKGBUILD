# Maintainer: krforshey
pkgname=cosmic-applet-manager-git
_pkgname=cosmic-applet-manager
pkgver=0.3.0
pkgrel=1
pkgdesc='Browse, install, update and remove community COSMIC extensions'
arch=('x86_64' 'aarch64')
url='https://github.com/kevinRForshey/CosmicAppletManager'
license=('Apache-2.0')
# git, just and a Rust toolchain are needed at runtime: extensions are built from source.
depends=('git' 'just' 'rust' 'libxkbcommon' 'wayland' 'vulkan-icd-loader' 'fontconfig')
optdepends=('flatpak: sandboxed installs (the default)' 'flatpak-builder: sandboxed installs (the default)' 'python: sandboxed installs and Flatpak packaging')
makedepends=('cargo' 'just' 'git' 'pkgconf')
# Rust + C deps (ring) break under makepkg's default LTO flags.
options=('!lto')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf '%s.r%s.%s' "$(grep -m1 '^version' Cargo.toml | cut -d'"' -f2)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

package() {
  cd "$_pkgname"
  just rootdir="$pkgdir" prefix=/usr install
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
