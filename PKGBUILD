# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Sonny Piers <sonny at fastmail dot net>
pkgname=tangram
pkgver=1.4.2
pkgrel=2
pkgdesc="Browser for your pinned tabs"
arch=('any')
url="https://apps.gnome.org/app/re.sonny.Tangram"
license=('GPL3')
depends=('gjs' 'gtk3' 'libsoup' 'webkit2gtk')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
optdepends=('gst-plugins-bad: May be necessary for some websites')
_commit=37e7a820b0646791cec2678eb5808045eb2a6f42
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
  git submodule--helper update
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
