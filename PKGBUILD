# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Sonny Piers <sonny at fastmail dot net>
pkgname=tangram
pkgver=3.0
pkgrel=3
pkgdesc="Browser for your pinned tabs"
arch=('any')
url="https://apps.gnome.org/Tangram"
license=('GPL-3.0-or-later')
depends=('gjs' 'libadwaita' 'webkitgtk-6.0')
makedepends=('git' 'blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
optdepends=('gst-plugins-bad: May be necessary for some websites')
_commit=eb563e9147df9eb759ec7b1355c3286fa7c3fd87  # tags/v3.0
source=("git+https://github.com/sonnyp/Tangram.git#commit=${_commit}"
        'git+https://github.com/sonnyp/troll.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd Tangram
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd Tangram
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
