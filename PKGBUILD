# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=commit
pkgver=4.1
pkgrel=2
pkgdesc="Commit message editor."
arch=('any')
url="https://apps.gnome.org/Commit"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'libspelling' 'gjs' 'gtksourceview5')
makedepends=('blueprint-compiler' 'git' 'meson')
checkdepends=('appstream-glib')
optdepends=('git: git support'
            'mercurial: mercurial support')
source=("git+https://github.com/sonnyp/Commit.git#tag=v$pkgver"
        'git+https://github.com/sonnyp/troll.git')
sha256sums=('805b79e8866523c22d29905cb00521734d72ff57c8131f483c58698e19c884ab'
            'SKIP')

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
