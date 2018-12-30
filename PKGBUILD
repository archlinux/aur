# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Yosef Or Boczko <yoseforb@gnome.org>
# Contributor: emersion <contact@emersion.fr>

pkgname=gnome-music-git
pkgver=3.31.1.r63.gd2587147
pkgrel=1
pkgdesc="Music player and management application"
url="https://wiki.gnome.org/Apps/Music"
arch=(x86_64)
license=(GPL)
depends=(grilo grilo-plugins tracker-miners libdmapsharing libmediaart gtk3 gvfs python-gobject
         python-cairo gst-plugins-base python-requests libdazzle)
makedepends=(gobject-introspection git meson yelp-tools appstream-glib)
optdepends=('gst-plugins-good: Extra media codecs'
            'gst-plugins-ugly: Extra media codecs'
            'gst-plugins-bad: Extra media codecs'
            'gst-libav: Extra media codecs')
conflicts=(gnome-music)
provides=(gnome-music)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/gnome-music.git"
        "git+https://gitlab.gnome.org/GNOME/libgd.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd gnome-music
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd gnome-music

  git submodule init
  git config --local submodule.subprojects/libgd.url "$srcdir/libgd"
  git submodule update
}

build() {
  arch-meson gnome-music build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}
