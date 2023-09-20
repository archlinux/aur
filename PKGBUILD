# Maintainer: xiota / aur.chaotic.cx
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Cédric Bellegarde
# Contributor: robertfoster
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: Ian Brunelli (brunelli) <ian@brunelli.me>

_pkgname=lollypop
pkgname=lollypop-git
pkgver=1.4.37.r5.gb1c5fe1b3
pkgrel=1
pkgdesc="Music player for GNOME"
arch=(any)
url="https://gitlab.gnome.org/World/lollypop"
license=(GPL3)
depends=(
  'gst-plugins-base-libs'
  'gst-python'
  'gtk3'
  'libhandy'
  'libsoup'
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
  'easytag: Modify tags'
  'gst-libav: FFmpeg plugin for GStreamer'
  'gst-plugins-bad: "Bad" plugin libraries'
  'gst-plugins-base: "Base" plugin libraries'
  'gst-plugins-good: "Good" plugin libraries'
  'gst-plugins-ugly: "Ugly" plugin libraries'
  'kid3-qt: Store covers in tags'
  'libsecret: Last.FM support'
  'python-pylast: Last.FM support'
  'youtube-dl: YouTube support'
  'yt-dlp: YouTube support'
)

conflicts=(
  "$_pkgname"
)
provides=(
  "$_pkgname"
)

source=(
  "$_pkgname"::"git+https://gitlab.gnome.org/World/lollypop.git"
  "lollypop-po"::"git+https://gitlab.gnome.org/gnumdk/lollypop-po.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"

  _regex='^\s+version: '\''([0-9]+\.[0-9]+(\.[0-9]+)?)'\''.*$'
  _file='meson.build'

  _line=$(
    grep -E "$_regex" "$_file" | head -1
  )
  _version=$(
    printf '%s\n' "$_line" \
      | sed -E "s@$_regex@\1@"
  )
  _commit=$(
    git log -G "$_line" -1 --pretty=oneline --no-color | sed 's@\ .*$@@'
  )
  _revision=$(
    git rev-list --count $_commit..HEAD
  )
  _hash=$(
    git rev-parse --short HEAD
  )

  printf '%s.r%s.g%s' \
    "$_version" \
    "$_revision" \
    "$_hash"
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git config submodule.subprojects/po.url "${srcdir}/lollypop-po"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson "$_pkgname" build \
    --libexecdir='lib/lollypop'
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
