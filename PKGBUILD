# Maintainer: Taha YVR <taha@noiserandom.com>

_pkgbase=omarchist
pkgname=${_pkgbase}-git
# The pkgver is a placeholder; the pkgver() function will generate the real one.
pkgver=1.0.0
pkgrel=4
pkgdesc="A GUI app for Omarchy (development build from dev branch)."
arch=('x86_64' 'aarch64')
url="https://github.com/tahayvr/omarchist"
license=('MIT')

depends=('webkit2gtk-4.1' 'gtk3' 'libsoup' 'cairo' 'gdk-pixbuf2' 'glib2' 'pango' 'desktop-file-utils' 'hicolor-icon-theme' 'zstd')
makedepends=('git' 'pkgconf' 'cargo' 'rust' 'nodejs' 'npm' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg')
install=${pkgname}.install
provides=("${_pkgbase}")
conflicts=("${_pkgbase}-bin" "${_pkgbase}")
source=("${pkgname}::git+$url.git#branch=dev")
sha256sums=('SKIP')

# This function dynamically generates the pkgver from the Git history.
pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}"
  npm install
}

build() {
  cd "${pkgname}"
  export ZSTD_SYS_USE_PKG_CONFIG=1
  npm run tauri build
}

package() {
  cp -a "${pkgname}/src-tauri/target/release/bundle/deb/"*/data/* "${pkgdir}"
}
