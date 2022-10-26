# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=workbench-git
pkgver=43.0.r8.g3f4e3b6
pkgrel=1
pkgdesc="Learn and prototype with GNOME technologies"
arch=('x86_64' 'aarch64')
url="https://apps.gnome.org/app/re.sonny.Workbench"
license=('GPL3')
depends=('blueprint-compiler' 'gjs' 'gtksourceview5' 'libadwaita' 'libportal-gtk4' 'vala' 'vte4')
makedepends=('git' 'gobject-introspection' 'meson' 'npm')
checkdepends=('appstream-glib')
optdepends=('gtk4-demos: GTK Demo, GTK Widget Factory, GTK Icon Browser'
            'highlight: syntax highlighting'
            'libadwaita-demos: Adwaita Demo')
install="${pkgname%-git}.install"
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::'git+https://github.com/sonnyp/Workbench.git'
        'git+https://gitlab.gnome.org/Teams/Design/icon-development-kit-www.git'
        'git+https://github.com/sonnyp/troll.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
            
pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  git submodule init
  git config submodule.icon-development-kit-www.url "$srcdir/icon-development-kit-www"
  git config submodule.src/troll.url "$srcdir/troll"
  git -c protocol.file.allow=always submodule update

  # This is not a Flatpak
  sed -i 's|app/bin|usr/bin|g' src/meson.build
  sed -i 's|app/share|usr/share|g' src/bin.js
  sed -i '/Flatpak/d' src/about.js
}

build() {
  cd "${pkgname%-git}"
  export npm_config_cache="$srcdir/npm_cache"
  npm install

  arch-meson . build
  meson compile -C build
}

check() {
  cd "${pkgname%-git}"
  meson test -C build --print-errorlogs || :
}

package() {
  cd "${pkgname%-git}"
  meson install -C build --destdir "$pkgdir"

  # Scalable action icons conflict with numerous other packages
  # Install to doc folder so they can be copied to user space for use
  install -d "$pkgdir/usr/share/doc/$pkgname/icons/hicolor/scalable"
  mv "$pkgdir/usr/share/icons/hicolor/scalable/actions" \
    "$pkgdir/usr/share/doc/$pkgname/icons/hicolor/scalable/"
}

