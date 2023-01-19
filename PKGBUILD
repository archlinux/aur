# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Sonny Piers <sonny at fastmail dot net>
pkgname=tangram
pkgver=2.0
pkgrel=2
pkgdesc="Browser for your pinned tabs"
arch=('any')
url="https://apps.gnome.org/app/re.sonny.Tangram"
license=('GPL3')
depends=('gjs' 'libadwaita' 'webkit2gtk-5.0')
makedepends=('git' 'blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
optdepends=('gst-plugins-bad: May be necessary for some websites')
_commit=d2e9ecf74ba2e7348799f4e89cd80e18bb68a7fd  # tags/v2.0
source=("git+https://github.com/sonnyp/Tangram.git#commit=${_commit}"
        'git+https://github.com/sonnyp/troll.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/Tangram"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$srcdir/Tangram"
  git submodule init
  git config submodule.src/troll.url "$srcdir/troll"
  git -c protocol.file.allow=always submodule update

  # use system blueprint-compiler
  sed -i 's|../blueprint-compiler/blueprint-compiler.py|/usr/bin/blueprint-compiler|g' src/meson.build
}

build() {
  arch-meson Tangram build
  meson compile -C build
}

check() {
  meson test  -C build --print-errorlogs || :
}

package(){
  meson install -C build --destdir "$pkgdir"

# Conflicts with tangram-bin binary
#  ln -s /usr/bin/re.sonny.Tangram "$pkgdir/usr/bin/$pkgname"
}
