# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: 0xMRTT <0xMRTT at proton dot me>
pkgname=gnome-shell-extension-valent-git
pkgver=1.0.0.alpha.46.r17.gc1a9b70
pkgrel=2
pkgdesc="GNOME Shell integration for Valent"
arch=('any')
url="https://valent.andyholmes.ca"
license=('GPL-3.0-or-later')
depends=(
  'gnome-shell'
  'valent-git'
)
makedepends=(
  'git'
  'meson'
)
checkdepends=('eslint')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'gnome-shell-extension-gsconnect')
source=('git+https://github.com/andyholmes/gnome-shell-extension-valent.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build -Dtests=true
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
