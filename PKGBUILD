# Maintainer: Bart Libert <bart plus aur at libert dot email>
_pkgname=waybar-niri-workspaces-enhanced
pkgname=${_pkgname}-git
pkgver=r9.2f4cd8f
pkgrel=1
pkgdesc="Enhanced niri workspaces module for waybar with window icons."
arch=(x86_64)
url="https://github.com/justbuchanan/waybar-niri-workspaces-enhanced"
license=('MIT')
depends=('niri' 'ttf-font-nerd' 'glibc' 'gcc-libs' 'glib2' 'pango' 'gtk3' 'cairo' 'gdk-pixbuf2')
makedepends=(cargo git)
provides=(${_pkgname})
source=("$_pkgname::git+${url}.git")
sha256sums=('SKIP')
install="${pkgname}.install"
optdepends=('zenity: for workspace rename script')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${_pkgname}"
    install -Dm755 "target/release/libwaybar_niri_workspaces_enhanced.so" "$pkgdir/usr/lib/waybar/libwaybar_niri_workspaces_enhanced.so"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
