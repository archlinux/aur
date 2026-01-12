# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname=keystroke
pkgname="$_pkgname-git"
pkgver=r15.gedab945
pkgrel=1
pkgdesc="Keystroke visualizer for Wayland compositors"
arch=(any)
url="https://github.com/linuxmobile/keystroke"
license=(Apache-2.0)
makedepends=(cargo git)
conflicts=(keystroke)
source=(
  "git+$url.git"
  "keystroke.desktop"
)
sha256sums=('SKIP'
            'ceadad765713bf6fc3fbeb5e959ac6ee15cabfdd4215caad0710df1c28bea9a3')

pkgver() {
    cd "${srcdir}/${_pkgname}" || exit
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}" || exit
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${_pkgname}" || exit
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "$srcdir/${_pkgname}.desktop"
  cd "${srcdir}/${_pkgname}" || exit
  install -Dm0755 -t "$pkgdir/usr/bin/" target/release/keystroke
  install -Dm0755 -t "$pkgdir/usr/bin/" target/release/keystroke
  install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" src/assets/logo-symbolic.svg
}
