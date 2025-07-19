# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: ELmoussaoui Bilal <bil dot elmoussaoui at gmail.com>
pkgname=nemo-folder-icons
pkgver=3.0.1
pkgrel=5
pkgdesc="Nemo extension that makes changing folders icons easy!"
arch=('any')
url="https://github.com/bilelmoussaoui/nautilus-folder-icons"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'nemo-python'
)
makedepends=(
  'git'
  'meson'
)
checkdepends=(
  'appstream-glib'
  'libcanberra'
)
conflicts=('nemo-ext-git' 'nemo-compare')
            # See https://github.com/bilelmoussaoui/nautilus-folder-icons/issues/34
_commit=b0ae536292177cbdb8c26d8fdb4981959aee3ab4  # v3.0.1
source=("git+https://github.com/bilelmoussaoui/nautilus-folder-icons.git#commit=${_commit}")
sha256sums=('9038c7eb21c03ddaf86049e9a100b8ec8fbfd5b5cf169efe9fdae7333775439c')

prepare() {
  cd nautilus-folder-icons

  # Fix for 'Function does not take positional arguments'
  # https://github.com/bilelmoussaoui/nautilus-folder-icons/issues/37
  git cherry-pick -n b7bb22d139c0ed56a830fc556ff6cbbbb21561ff
}

build() {
  arch-meson nautilus-folder-icons build -Dfile_manager=nemo
  meson compile -C build
}

check() {
  export NO_AT_BRIDGE=1
  meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
