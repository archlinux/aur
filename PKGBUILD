pkgname=gnome-shell-extensions-git
_pkgname=gnome-shell-extensions
pkgver=40.0+7+ge094dea
pkgrel=1
pkgdesc="Extensions for GNOME shell, including classic mode"
url="https://wiki.gnome.org/Projects/GnomeShell/Extensions"
arch=(any)
license=(GPL)
makedepends=('meson' 'git' 'sassc' 'js78')
optdepends=('gnome-menus: applications menu extension')
provides=('gnome-shell-extensions')
conflicts=('gnome-shell-extensions')
source=("git+https://gitlab.gnome.org/GNOME/gnome-shell-extensions.git"
        "git+https://gitlab.gnome.org/GNOME/gnome-shell-sass.git")
b2sums=('SKIP'
        'SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname

  git submodule init
  git config --local submodule.data/gnome-shell-sass.url "$srcdir/gnome-shell-sass"
  git submodule update
}

build() {
  arch-meson $_pkgname build -D extension_set=all -D classic_mode=true
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  depends=(gnome-shell)

  DESTDIR="$pkgdir" meson install -C build
}
