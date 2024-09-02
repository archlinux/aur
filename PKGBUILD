# Maintainer:
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Cédric Bellegarde
# Contributor: robertfoster
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: Ian Brunelli (brunelli) <ian@brunelli.me>

_pkgname="lollypop"
pkgname="$_pkgname-git"
pkgver=1.4.40.r4.g1a97fbe
pkgrel=1
pkgdesc="Music player for GNOME"
arch=(any)
url="https://gitlab.gnome.org/World/lollypop"
license=(GPL-3.0-or-later)
depends=(
  'gst-plugins-base-libs'
  'gst-python'
  'gtk3'
  'libhandy'
  'libsoup3'
  'python'
  'python-beautifulsoup4'
  'python-cairo'
  'python-gobject'
  'python-pillow'
  'totem-plparser'
)
makedepends=(
  'appstream-glib'
  'git'
  'gobject-introspection'
  'intltool'
  'itstool'
  'meson'
)
optdepends=(
  'gst-libav: FFmpeg plugin for GStreamer'
  'gst-plugins-bad: "Bad" plugin libraries'
  'gst-plugins-base: "Base" plugin libraries'
  'gst-plugins-good: "Good" plugin libraries'
  'gst-plugins-ugly: "Ugly" plugin libraries'
  'kid3-qt: Store covers in tags'
  'libsecret: Last.FM support'
  'python-pylast: Last.FM support'
  'python-textblob: View lyrics' # AUR
  'yt-dlp: YouTube support'
)

conflicts=("$_pkgname")
provides=("$_pkgname")

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+https://gitlab.gnome.org/World/lollypop.git"
  "lollypop-po"::"git+https://gitlab.gnome.org/gnumdk/lollypop-po.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"
  git submodule init
  git config submodule.subprojects/po.url "${srcdir}/lollypop-po"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson "$_pkgsrc" build \
    --libexecdir='lib/lollypop'
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
