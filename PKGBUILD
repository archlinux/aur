# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=workbench-git
_pkgname=Workbench
pkgver=r175.b86cdfb
pkgrel=1
pkgdesc="Learn and prototype with GNOME technologies"
arch=('any')
url="https://github.com/sonnyp/Workbench"
license=('GPL3')
depends=('gjs' 'gtksourceview5' 'libadwaita' 'libportal-gtk4' 'vte4-git')
makedepends=('git' 'meson' 'npm')
optdepends=('gtk4-demos: GTK Demo, GTK Widget Factory, GTK Icon Browser'
            'highlight: syntax highlighting'
            'libadwaita-demos: Adwaita Demo')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/sonnyp/Workbench.git'
        'git+https://github.com/sonnyp/troll.git')
sha256sums=('SKIP'
            'SKIP')
            
pkgver() {
  cd "${_pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
prepare() {
  cd "$srcdir/Workbench"
  git submodule init
  git config submodule.src/troll.url "$srcdir/troll"
  git submodule update

  sed -i 's|app/share|usr/share|g' src/re.sonny.Workbench
}

build() {
  cd "$srcdir/Workbench"
  export npm_config_cache="$srcdir/npm_cache"
  npm install

  arch-meson . build
  meson compile -C build
}

check() {
  cd "$srcdir/Workbench"
  meson test -C build --print-errorlogs || :
}

package() {
  cd "$srcdir/Workbench"
  meson install -C build --destdir "$pkgdir"
}
