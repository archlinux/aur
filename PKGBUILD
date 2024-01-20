# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=commit
pkgver=4.1
pkgrel=1
pkgdesc="Commit message editor."
arch=('any')
url="https://apps.gnome.org/Commit"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'libspelling' 'gjs' 'gtksourceview5')
makedepends=('blueprint-compiler' 'git' 'meson')
checkdepends=('appstream-glib')
optdepends=('git: git support'
            'mercurial: mercurial support')
_commit=c7db2f4140053755689c35862964f9568c5e284b  # tags/v4.1^0
source=("git+https://github.com/sonnyp/Commit.git#commit=$_commit"
        'git+https://github.com/sonnyp/troll.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd Commit
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd Commit
  git submodule init
  git config submodule.src/troll.url "$srcdir/troll"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson Commit build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
