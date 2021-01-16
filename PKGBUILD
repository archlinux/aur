pkgname=gnome-music-git
_pkgname=gnome-music
pkgver=3.38.0+39+g95f7bf58
pkgrel=1
epoch=1
pkgdesc="Music player and management application"
url="https://wiki.gnome.org/Apps/Music"
arch=(x86_64)
license=(GPL)
depends=('grilo' 'grilo-plugins' 'tracker3-miners' 'libdmapsharing' 'libmediaart' 'gtk3'
         'gvfs' 'python-gobject' 'python-cairo' 'gst-plugins-base' 'python-requests'
         'libdazzle')
makedepends=('gobject-introspection' 'git' 'meson' 'yelp-tools' 'appstream-glib')
optdepends=('gst-plugins-good: Extra media codecs'
            'gst-plugins-ugly: Extra media codecs'
            'gst-plugins-bad: Extra media codecs'
            'gst-libav: Extra media codecs')
provides=('gnome-music')
conflicts=('gnome-music')
source=("git+https://gitlab.gnome.org/GNOME/gnome-music.git"
        "git+https://gitlab.gnome.org/GNOME/libgd.git"
        "git+https://gitlab.gnome.org/mschraal/gfm.git")
b2sums=('SKIP'
        'SKIP'
        'SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname

  git submodule init
  git submodule set-url subprojects/libgd "$srcdir/libgd"
  git submodule set-url subprojects/gfm "$srcdir/gfm"
  git submodule update
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}
