# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=commit
pkgver=4.0
pkgrel=2
pkgdesc="Commit message editor."
arch=('any')
url="https://apps.gnome.org/app/re.sonny.Commit"
license=('GPL3')
depends=('libadwaita' 'gjs' 'gtksourceview5')
makedepends=('blueprint-compiler' 'git' 'meson')
checkdepends=('appstream-glib')
optdepends=('git: git support'
            'mercurial: mercurial support'
#            'gspell: spell checking support' # Spell checking has been temporarily removed
            )
_commit=a2dfeddd38ed96bbd0f4ce29fb6a1bc5b215ee44  # tags/v4.0^0
source=("git+https://github.com/sonnyp/Commit.git#commit=$_commit"
        'git+https://github.com/sonnyp/troll.git')
sha256sums=('SKIP'
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
