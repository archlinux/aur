# Maintainer: ZokuTe <zokute@zlinux.live>
# AUR: pw-live-danmaku-git
#
# Upstream builds with plain make; every dependency is a distribution library
# (cairo / pango / gdk-pixbuf / PipeWire / libcurl / OpenSSL / brotli / zlib),
# no language package manager is involved.

_pkgname=pw-live-danmaku
pkgname=$_pkgname-git
pkgver=r24.6070b8a
pkgrel=1
pkgdesc='Render a Bilibili live chat as a transparent PipeWire video node for OBS'
arch=('x86_64' 'aarch64')
url='https://github.com/zlinux-live-util/pw-live-danmaku'
license=('MIT')
depends=('cairo' 'pango' 'gdk-pixbuf2' 'glib2' 'libpipewire' 'curl' 'openssl' 'brotli'
         'zlib' 'pipewire')
makedepends=('git')
optdepends=(
  'obs-pwvideo: OBS source plugin able to pick this PipeWire node (the bundled linux-pipewire plugin cannot)'
  'noto-fonts-cjk: CJK glyphs for the chat, which is mostly Chinese'
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
  # PORTABLE=1 stops the Makefile from *adding* -march=native, but it cannot stop
  # a builder's makepkg.conf from already having it: the Makefile spells its
  # default `CXXFLAGS ?=`, and ?= does not assign when the variable came in from
  # the environment, so the flag survives either way. Arch's stock makepkg.conf
  # does not add it, but a customised one can -- and then this package installs a
  # binary bound to the CPU that built it, which dies with SIGILL on an older one.
  # Strip it, and keep the rest of the builder's flags (lto, fortify, ...).
  CXXFLAGS="${CXXFLAGS//-march=native/}" LDLIBS="$LDFLAGS" make PORTABLE=1
}

package() {
  cd "$pkgname"

  install -Dm755 pw-live-danmaku "$pkgdir/usr/bin/pw-live-danmaku"

  install -Dm644 LICENSE README.md README.zh-CN.md docs/*.md docs/*.png \
    -t "$pkgdir/usr/share/doc/$_pkgname/"

  # Ship the upstream systemd user unit rendered. It is a template carrying
  # @REPO@ / @ARGS@ placeholders, and systemd refuses to load it unrendered
  # (ExecStart= would not be absolute). For a packaged binary there is no checkout
  # to point at, so the template-comment header (which only documents rendering it
  # by hand) and the checkout-relative ExecStart are replaced by a /usr/bin
  # invocation; @REPO@ is then only meaningful in the Documentation= line, which is
  # already an absolute URL.
  #
  # The comment header is rebuilt rather than kept, because upstream's explains how
  # to render the template by hand and that is not what happened here. The two
  # things a user of this unit actually needs are the argument list and the %h
  # rule for the cookie file.
  install -d "$pkgdir/usr/lib/systemd/user"
  {
    echo "# Rendered by the $pkgname package from pw-live-danmaku.service."
    echo "#"
    echo "# Arguments are upstream's Makefile defaults: the room is upstream's own, so"
    echo "# change it. Everything is an ExecStart= argument:"
    echo "#"
    echo "#   systemctl --user edit pw-live-danmaku"
    echo "#"
    echo "# A cookie file belongs in \$HOME/.config/pw-live-danmaku/cookie (chmod 600)."
    echo "# Write the path with systemd's %h, never with ~ -- systemd does not expand it,"
    echo "# and the unit would then fail and restart every 3 seconds:"
    echo "#"
    echo "#   --cookie-file %h/.config/pw-live-danmaku/cookie"
    echo ""
    sed -n '/^\[Unit\]/,$p' pw-live-danmaku.service |
      sed -e '/^WorkingDirectory=/d' \
        -e 's|^ExecStart=.*|ExecStart=/usr/bin/pw-live-danmaku @ARGS@|' \
        -e "s|@REPO@|/usr/share/doc/$_pkgname|g" \
        -e 's|@ARGS@|--room 1746707149 --node pw-live-danmaku --size 480x1080 --fps 30 --history 60|'
  } >"$pkgdir/usr/lib/systemd/user/pw-live-danmaku.service"
}