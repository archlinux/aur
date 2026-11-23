# Maintainer: Gigas002 <gigas002@pm.me>

_pkgname=gaki
pkgname=gaki-git
pkgver=r534.g9712da6
pkgrel=1
pkgdesc='Headless Steam launcher and library manager: CLI and TUI'
arch=('x86_64' 'aarch64')
url='https://github.com/Gigas002/gaki'
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'dbus')
makedepends=('cargo' 'git' 'pkgconf')
optdepends=('steam: the Steam client gaki works alongside'
            'gnome-keyring: Secret Service provider for the session tokens'
            'keepassxc: alternative Secret Service provider'
            'xdg-utils: open store and community links')
provides=('gaki')
conflicts=('gaki')
# makepkg's LTO puts GCC bytecode in ring's C objects, which rust-lld can't link
options=('!lto')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

# Extra cargo features for both binaries, e.g. ('--features' 'store,social')
# or ('--all-features'); empty builds the upstream defaults.
_features=()

pkgver() {
  cd "$_pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --frozen -p gaki-cli -p gaki-tui "${_features[@]}"
}

package() {
  cd "$_pkgname"

  install -Dm755 target/release/gaki-cli target/release/gaki-tui -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md docs/*.md -t "$pkgdir/usr/share/doc/$pkgname/"
  cp -r examples "$pkgdir/usr/share/doc/$pkgname/"
}
