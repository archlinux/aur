# Maintainer Kaleb Klein <apollyon156@proton.me>
# Contributor Adria Arrufat <swiftscythe@gmail.com>
# Contributor Limao Luo <luolimao+AUR@gmail.com>
# Contributor Thomas Dziedzic <gostrc@gmail.com>
# Contributor Jan de Groot <jgc@archlinux.org>
# Contributor Giovanni Scafora <giovanni@archlinux.org>

_pkgname=rhythmbox
pkgname=$_pkgname-git
pkgver=3.4.8+r22+ge73b5eb24
pkgrel=1
pkgdesc="Music playback and management application"
arch=(i686 x86_64)
license=(GPL)
url="https://wiki.gnome.org/Apps/Rhythmbox"
depends=(
  dconf
  grilo
  gst-plugins-base
  gst-plugins-good
  json-glib
  libgudev
  libnotify
  libpeas
  libsoup3
  media-player-info
  python-gobject
  tdb
  totem-pl-parser
)
optdepends=(
  'gst-plugins-ugly: Extra media codecs'
  'gst-plugins-bad: Extra media codecs'
  'gst-libav: Extra media codecs'
  'brasero: Audio CD Recorder plugin'
  'grilo-plugins: Grilo media browser plugin'
  'gvfs-mtp: Portable players - Android plugin'
  'libdmapsharing: DAAP Music Sharing plugin'
  'libgpod: Portable Players - iPod plugin'
  'libmtp: Portable Players - MTP plugin'
  'lirc: LRC plugin'
)
makedepends=(
  brasero
  git
  gobject-introspection
  gtk-doc
  libdmapsharing
  libgpod
  libmtp
  lirc
  meson
  vala
  yelp-tools
  zeitgeist
)
checkdepends=(check xorg-server-xvfb)
options=('!emptydirs')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
source=($pkgname::git+https://gitlab.gnome.org/GNOME/$_pkgname)
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/+/g'
}

prepare() {
  cd "$srcdir/$pkgname"
}

build() {
  local meson_options=(
    -D daap=enabled
    -D gtk_doc=true
  )

  arch-meson $pkgname build "${mesa_options[@]}"
  meson compile -C build
}

check() {
  xvfb-run -s '-nolisten local' \
    meson test -C build --print-errorlogs -t 3
}

package() {
    meson install -C build --destdir "$pkgdir"

    python -m compileall -d /usr/lib "$pkgdir/usr/lib"
    python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}
