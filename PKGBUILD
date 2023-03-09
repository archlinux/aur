# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=sticky-notes
pkgver=0.1.4
pkgrel=1
pkgdesc="A simple sticky notes app"
arch=('any')
url="https://github.com/vixalien/sticky"
license=('MIT')
depends=('gjs' 'libadwaita')
makedepends=('git' 'gobject-introspection' 'meson' 'yarn')
checkdepends=('appstream-glib')
_commit=5b5d357d29601ab08a7df8b413d01c1f8e1f02b3  # tags/v0.1.4^0
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

  # Correct version
  sed -i 's/0.1.1/0.1.4/g' meson.build
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
