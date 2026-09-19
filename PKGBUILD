# Maintainer: Douglas Moura <doug@douglasmoura.com>
pkgname=winkel-git
_pkgname=winkel
pkgver=0.1.6.r0.g9c239db
pkgrel=1
pkgdesc="A metronome for Omarchy that follows the live theme (latest development version)"
arch=(x86_64 aarch64)
url="https://github.com/DouglasdeMoura/winkel"
license=(MIT)
depends=(quickshell alsa-lib gcc-libs glibc hicolor-icon-theme)
optdepends=('ttf-jetbrains-mono-nerd: the default interface font')
makedepends=(cargo git)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # A pipe hides a failing git describe behind sed's success, so test it
  # first: before the first tag there is nothing to describe.
  if git describe --tags >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  WINKEL_SILENT=1 cargo test --frozen
}

package() {
  cd "$_pkgname"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}
