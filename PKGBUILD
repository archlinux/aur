# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=nautilus-ext-git-git
pkgver=1.3.r16.g5389549
pkgrel=7
pkgdesc="Nautilus extension to add important information about the current git directory"
arch=('i686' 'x86_64')
url="https://github.com/bilelmoussaoui/nautilus-git"
license=('GPL3')
depends=('git' 'gtk3' 'gtksourceview3' 'python-nautilus')
makedepends=('meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}"
           'nautilus-folder-icons' 'nautilus-compare')
            # See https://github.com/bilelmoussaoui/nautilus-folder-icons/issues/34
source=("${pkgname%-git}::git+https://github.com/bilelmoussaoui/nautilus-git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  # Disable post_install, not available in meson-options
  sed -i '37,38d' meson.build

  find . -type f -exec sed -i 's|python2|python|g' {} \;
}

build() {
  arch-meson "${pkgname%-git}" build -Dfile_manager=nautilus
  meson compile -C build
}

# No tests defined
#check() {
#  meson test -C build --print-errorlogs
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
