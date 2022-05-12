# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=workbench
pkgver=1.2.0
pkgrel=2
pkgdesc="Learn and prototype with GNOME technologies"
arch=('any')
url="https://github.com/sonnyp/Workbench"
license=('GPL3')
depends=('gjs' 'gtksourceview5' 'libadwaita' 'libportal-gtk4' 'vte4-git')
makedepends=('git' 'meson' 'npm')
checkdepends=('appstream-glib')
optdepends=('gtk4-demos: GTK Demo, GTK Widget Factory, GTK Icon Browser'
            'highlight: syntax highlighting'
            'libadwaita-demos: Adwaita Demo')
source=("git+https://github.com/sonnyp/Workbench.git#tag=v$pkgver"
        'git+https://github.com/sonnyp/troll.git')
sha256sums=('SKIP'
            'SKIP')

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
