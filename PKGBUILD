# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: ELmoussaoui Bilal <bil dot elmoussaoui at gmail.com>
pkgname=nautilus-folder-icons
pkgver=3.0.1
pkgrel=5
pkgdesc="Nautilus extension that makes changing folders icons easy!"
arch=('any')
url="https://github.com/bilelmoussaoui/nautilus-folder-icons"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'python-nautilus'
)
makedepends=(
  'git'
  'meson'
)
checkdepends=(
  'appstream-glib'
  'libcanberra'
)
conflicts=('nautilus-ext-git' 'nautilus-compare')
            # See https://github.com/bilelmoussaoui/nautilus-folder-icons/issues/34
_commit=b0ae536292177cbdb8c26d8fdb4981959aee3ab4  # v3.0.1
source=("git+https://github.com/bilelmoussaoui/nautilus-folder-icons.git#commit=${_commit}")
sha256sums=('9038c7eb21c03ddaf86049e9a100b8ec8fbfd5b5cf169efe9fdae7333775439c')

prepare() {
  cd "$pkgname"

  # Fix for 'Function does not take positional arguments'
  sed -e '3d' -i data/meson.build
}

build() {
  arch-meson build "$pkgname" -Dfile_manager=nautilus
  meson compile -C build
}

check() {
  export NO_AT_BRIDGE=1
  meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
