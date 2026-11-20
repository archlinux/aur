# Maintainer: SpeeNotPee <heckingmaster666@gmail.com>
pkgname=pigment-launcher-git
_pkgname=pigment-launcher
pkgver=0.2.2.r0.gfd47704
pkgrel=1
pkgdesc="Roblox launcher and manager for Linux (drives the Sober runtime) — latest git"
#sober dropped arm in sept 2026, so x86_64 is the only arch that can actually run roblox
arch=('x86_64')
url="https://github.com/SpeeNotPee/Pigment"
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('cargo' 'git')
provides=('pigment-launcher')
conflicts=('pigment-launcher')
optdepends=('flatpak: required to install and run the Sober runtime'
            'xdg-utils: to set Pigment as the default roblox:// handler'
            'kservice: kbuildsycoca6, refreshes KDE menus after a handler change')
options=('!lto')
install=pigment-launcher-git.install
source=("$pkgname::git+https://github.com/SpeeNotPee/Pigment.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Prefer the newest tag (e.g. v0.1.0) → 0.1.0.rNN.gHASH; fall back to a
  # tagless commit count if the repo has no tags.
  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
  || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --workspace
}

check() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --workspace
}

package() {
  cd "$srcdir/$pkgname"
  #CARGO=true so make install dont rerun cargo under fakeroot, build() already did it
  make install PREFIX=/usr DESTDIR="$pkgdir" CARGO=true
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
