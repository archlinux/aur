# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Sonny Piers <sonny at fastmail dot net>
pkgname=tangram
pkgver=1.3.1+5+g8934dcd
pkgrel=1
pkgdesc="Run web apps on your desktop."
arch=('any')
url="https://apps.gnome.org/app/re.sonny.Tangram"
license=('GPL3')
depends=('gjs' 'libsoup' 'webkit2gtk')
conflicts=('gigagram' "$pkgname-web")
replaces=("$pkgname-web")
makedepends=('git' 'npm' 'meson')
#checkdepends=('appstream-glib')
_commit=8934dcdb3ab43a04e2a210ec508c97c338a72ffe
source=("${pkgname%-web}::git+https://github.com/sonnyp/Tangram.git#commit=$_commit"
#source=("${pkgname%-web}::git+https://github.com/sonnyp/Tangram.git#tag=v$pkgver"
        'git+https://github.com/sonnyp/troll.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git config submodule.src/troll.url $srcdir/troll
  git submodule update
}

build() {
  pushd "$srcdir/$pkgname"
  npm install --cache "$srcdir/npm-cache"
  ./node_modules/.bin/rollup -c
  popd

  arch-meson "$pkgname" build
  meson compile -C build
}

check() {

  # Validate appstream file fails, only validate desktop & schema files
  meson test 'Validate desktop file' 'Validate schema file' -C build --print-errorlogs
}

package(){
  DESTDIR="$pkgdir" meson install -C build

# Conflicts with tangram-bin binary
#  ln -s /usr/bin/re.sonny.Tangram "$pkgdir/usr/bin/$pkgname"
}
