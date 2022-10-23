# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: ELmoussaoui Bilal <bil dot elmoussaoui at gmail.com>
pkgname=nemo-folder-icons
pkgver=3.0.1
pkgrel=3
pkgdesc="Nemo extension that makes changing folders icons easy!"
arch=('any')
url="https://github.com/bilelmoussaoui/nautilus-folder-icons"
license=('GPL3')
depends=('gtk3' 'nemo-python')
makedepends=('git' 'meson')
checkdepends=('appstream-glib' 'libcanberra')
conflicts=('nemo-ext-git' 'nemo-compare')
            # See https://github.com/bilelmoussaoui/nautilus-folder-icons/issues/34
_commit=b0ae536292177cbdb8c26d8fdb4981959aee3ab4
source=("git+https://github.com/bilelmoussaoui/nautilus-folder-icons.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/nautilus-folder-icons"

  # Fix for 'Function does not take positional arguments'
  sed -e '3d' -i data/meson.build
}

build() {
  arch-meson nautilus-folder-icons build -Dfile_manager=nemo
  meson compile -C build
}

check() {
  export NO_AT_BRIDGE=1
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
