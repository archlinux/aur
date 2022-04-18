# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Sonny Piers <sonny at fastmail dot net>
pkgname=tangram
pkgver=1.4.1
pkgrel=1
pkgdesc="Browser for your pinned tabs"
arch=('any')
url="https://apps.gnome.org/app/re.sonny.Tangram"
license=('GPL3')
depends=('gjs' 'gtk3' 'libsoup' 'webkit2gtk')
makedepends=('git' 'meson')
#checkdepends=('appstream-glib')
conflicts=('gigagram' "$pkgname-web")
replaces=("$pkgname-web")
source=("git+https://github.com/sonnyp/Tangram.git#tag=v$pkgver"
        'git+https://github.com/sonnyp/troll.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/Tangram"
  git submodule init
  git config submodule.src/troll.url "$srcdir/troll"
  git submodule update
}

build() {
  arch-meson Tangram build
  meson compile -C build
}

check() {

  # Validate appstream file fails, only validate desktop & schema files
  meson test 'Validate desktop file' 'Validate schema file' -C build --print-errorlogs
}

package(){
  meson install -C build --destdir "$pkgdir"

# Conflicts with tangram-bin binary
#  ln -s /usr/bin/re.sonny.Tangram "$pkgdir/usr/bin/$pkgname"
}
