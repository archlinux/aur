# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=nemo-ext-git-git
pkgver=1.3.r16.g5389549
pkgrel=6
pkgdesc="Nemo extension to add important information about the current git directory"
arch=('x86_64')
url="https://github.com/bilelmoussaoui/nautilus-git"
license=('GPL-3.0-or-later')
depends=('git' 'gtk3' 'gtksourceview3' 'nemo-python')
makedepends=('meson')
provides=("${pkgname%-git}" 'nautilus-git')
conflicts=("${pkgname%-git}" 'nautilus-git' 'nemo-folder-icons')
            # See https://github.com/bilelmoussaoui/nautilus-folder-icons/issues/34
source=("${pkgname%-git}::git+https://github.com/bilelmoussaoui/nautilus-git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # Disable post_install, not available in meson-options
  sed -i '37,38d' meson.build

  # Use Python 3
  find . -type f -exec sed -i 's|python2|python|g' {} \;
}

build() {
  arch-meson "${pkgname%-git}" build -Dfile_manager=nemo
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
