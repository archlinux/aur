# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=adwdialog-git
pkgver=r6.b2e9309
pkgrel=1
pkgdesc="Display GTK4/libadwaita dialogs from terminal and scripts."
arch=('any')
url="https://github.com/Vanilla-OS/AdwDialog"
license=('GPL3')
depends=('libadwaita' 'python')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
