# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=sticky-notes
pkgver=0.1.8
pkgrel=1
pkgdesc="A simple sticky notes app"
arch=('any')
url="https://github.com/vixalien/sticky"
license=('MIT')
depends=('gjs' 'libadwaita')
makedepends=('git' 'gobject-introspection' 'meson' 'yarn')
checkdepends=('appstream-glib')
_commit=c13dc0cb99e30fe17bbc64b254edf3cd13cd9099  # tags/v0.1.8^0
source=("git+https://github.com/vixalien/sticky.git#commit=$_commit"
        'git+https://gitlab.gnome.org/BrainBlasted/gi-typescript-definitions.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/sticky"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$srcdir/sticky"
  git submodule init
  git config submodule.gi-types.url "$srcdir/gi-typescript-definitions"
  git -c protocol.file.allow=always submodule update
}

build() {
  yarn config set cache-folder "$srcdir/yarn-cache"
  yarn install
  arch-meson sticky build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd "$srcdir/sticky"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"

  ln -s /usr/bin/com.vixalien.sticky "$pkgdir/usr/bin/$pkgname"
}
