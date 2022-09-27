# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=workbench-git
_pkgname=Workbench
pkgver=r320.dff12ca
pkgrel=1
pkgdesc="Learn and prototype with GNOME technologies"
arch=('x86_64' 'aarch64')
url="https://github.com/sonnyp/Workbench"
license=('GPL3')
depends=('blueprint-compiler' 'gjs' 'gtksourceview5' 'libadwaita' 'libportal-gtk4' 'vala' 'vte4')
makedepends=('git' 'gobject-introspection' 'meson' 'npm')
checkdepends=('appstream-glib')
optdepends=('gtk4-demos: GTK Demo, GTK Widget Factory, GTK Icon Browser'
            'highlight: syntax highlighting'
            'libadwaita-demos: Adwaita Demo')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/sonnyp/Workbench.git'
        'git+https://gitlab.gnome.org/Teams/Design/icon-development-kit-www.git'
        'git+https://github.com/sonnyp/troll.git')
sha256sums=('SKIP'
            'SKIP'
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
  git config submodule.icon-development-kit-www.url "$srcdir/icon-development-kit-www"
  git config submodule.src/troll.url "$srcdir/troll"
  git submodule update

  # This is not a Flatpak
  sed -i 's|app/share|usr/share|g' src/re.sonny.Workbench
  sed -i '/Flatpak/d' src/about.js
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

  # Scalable action icons conflict with numerous other packages
  # Install to doc folder so they can be copied to user space for use
  install -d "$pkgdir/usr/share/doc/$pkgname/icons/hicolor/scalable"
  mv "$pkgdir/usr/share/icons/hicolor/scalable/actions" \
    "$pkgdir/usr/share/doc/$pkgname/icons/hicolor/scalable/"
}

