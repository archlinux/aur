# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Sonny Piers <sonny at fastmail dot net>
pkgname=tangram
pkgver=3.1
pkgrel=1
pkgdesc="Browser for your pinned tabs"
arch=('any')
url="https://apps.gnome.org/Tangram"
license=('GPL-3.0-or-later')
depends=('gjs' 'libadwaita' 'webkitgtk-6.0')
makedepends=('git' 'blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
optdepends=('gst-plugins-bad: May be necessary for some websites')
source=("git+https://github.com/sonnyp/Tangram.git#tag=v$pkgver"
        'git+https://github.com/sonnyp/troll.git')
sha256sums=('b4c98c5d9473a41890fa640cd779a62523fd450df9924b9d149604be45ef26f6'
            'SKIP')

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
