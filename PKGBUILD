# Maintainer: ZokuTe <zokute@zlinux.live>
# AUR: pw-mpris-visualcard-git
#
# Upstream builds with plain make; every dependency is a distribution library
# (cairo / pango / gdk-pixbuf / PipeWire / sdbus-c++ / libcurl), no language
# package manager is involved.

_pkgname=pw-mpris-visualcard
pkgname=$_pkgname-git
pkgver=r8.2f1aeba
pkgrel=1
pkgdesc='Render the currently playing MPRIS track as a PipeWire video node (album art, progress ring, synced lyrics)'
arch=('x86_64' 'aarch64')
url='https://github.com/zlinux-live-util/pw-mpris-visualcard'
license=('MIT')
depends=('cairo' 'pango' 'gdk-pixbuf2' 'glib2' 'libpipewire' 'sdbus-cpp' 'curl' 'pipewire')
makedepends=('git')
optdepends=(
  'obs-pwvideo: OBS source plugin able to pick this PipeWire node (the bundled linux-pipewire plugin cannot)'
  'noto-fonts-cjk: CJK glyphs for titles and lyrics (any font covering the text works)'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$pkgname.install"
source=("$pkgname::git+$url.git"
        "pw-video-simple-interface::git+https://github.com/zlinux-live-util/pw-video-simple-interface.git")
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "$pkgname"
  # Upstream keeps the PipeWire video node in a separate repository and references it as a git
  # submodule. makepkg's git+ sources are not recursive, so the second source is placed at the
  # submodule path for the Makefile to find it.
  rm -rf "lib/pw-video-simple-interface"
  mkdir -p lib
  cp -r "$srcdir/pw-video-simple-interface" "lib/pw-video-simple-interface"
  rm -rf "lib/pw-video-simple-interface/.git"
}

pkgver() {
  cd "$pkgname"
  local _desc
  if _desc=$(git describe --long --tags --abbrev=7 2>/dev/null); then
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' <<<"$_desc"
  else
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cd "$pkgname"
  # PORTABLE=1 drops -march=native: the default flags bind the binary to the
  # builder's instruction set, which must not happen for a distributed package.
  # CXXFLAGS/LDLIBS are passed through the environment rather than as make
  # arguments, because command-line variables would suppress the Makefile's own
  # appends (-std=c++20, -Wall, pkg-config --cflags/--libs).
  CXXFLAGS="$CXXFLAGS -O3 -funroll-loops" LDLIBS="$LDFLAGS" make PORTABLE=1
}

package() {
  cd "$pkgname"

  install -Dm755 pw-mpris-visualcard-native "$pkgdir/usr/bin/pw-mpris-visualcard-native"

  install -Dm644 LICENSE README.md README.zh-CN.md docs/internals.md docs/*.png \
    -t "$pkgdir/usr/share/doc/$_pkgname/"

  # Ship the upstream systemd user unit rendered. It is a template carrying
  # @REPO@ / @ARGS@ placeholders, and systemd refuses to load it unrendered
  # ("WorkingDirectory= path is not absolute"). For a packaged binary there is no
  # checkout to point at, so the template-comment header (which only documents
  # rendering it by hand), WorkingDirectory, and the checkout-relative ExecStart
  # are replaced by a /usr/bin invocation; @REPO@ is then only meaningful in the
  # Documentation= lines.
  install -d "$pkgdir/usr/lib/systemd/user"
  sed -n '/^\[Unit\]/,$p' pw-mpris-visualcard.service |
    sed -e '/^WorkingDirectory=/d' \
      -e 's|^ExecStart=.*|ExecStart=/usr/bin/pw-mpris-visualcard-native @ARGS@|' \
      -e "s|@REPO@|/usr/share/doc/$_pkgname|g" \
      -e 's|@ARGS@|--node pw-mpris-visualcard --size 460x690 --fps 30 --lyrics 3|' \
      >"$pkgdir/usr/lib/systemd/user/pw-mpris-visualcard.service"
}
