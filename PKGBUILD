# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Yosef Or Boczko <yoseforb@gnome.org>
# Contributor: emersion <contact@emersion.fr>

pkgname=gnome-music-git
pkgver=3.36.0.r85.g4976f447
pkgrel=1
pkgdesc="Music player and management application"
url="https://wiki.gnome.org/Apps/Music"
arch=(i686 x86_64 armv7h aarch64)
license=(GPL)
depends=(grilo grilo-plugins tracker-miners libdmapsharing libmediaart gvfs
         python-gobject python-cairo gst-plugins-base python-requests libdazzle)
makedepends=(gobject-introspection git meson yelp-tools appstream-glib)
optdepends=('gst-plugins-good: Extra media codecs'
            'gst-plugins-ugly: Extra media codecs'
            'gst-plugins-bad: Extra media codecs'
            'gst-libav: Extra media codecs')
conflicts=(gnome-music)
provides=(gnome-music)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/gnome-music.git"
        "git+https://gitlab.gnome.org/GNOME/libgd.git"
        "git+https://gitlab.gnome.org/mschraal/gfm.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd gnome-music
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd gnome-music

  git submodule init
  git submodule set-url subprojects/libgd "$srcdir/libgd"
  git submodule set-url subprojects/gfm "$srcdir/gfm"
  git submodule update
}

build() {
  arch-meson gnome-music build
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}
