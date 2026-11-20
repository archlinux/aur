# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
#
# vtium's console built from a release tag (ADR-1500 D3). Its terminfo
# entry comes from the vtium-terminfo package, which a recipe of its own
# builds (ADR-1500 D8). The maintainer signs the tag with the PGP key in
# validpgpkeys, and makepkg checks the tag's signature before it builds.
# Import the key once: gpg --import keys/pgp/*.asc, or
# gpg --recv-keys 33F9B54FD2A4B6A4110749B3BA464FC9847A832A.
# The console is built for an ordinary desktop or laptop, with the features
# images logind gpu bidi libseat and hwaccel on (ADR-1500 D8), and
# VTIUM_FEATURES in makepkg's environment names other features (below).
#
# pkgver is the tag without its v and without the hyphen before a
# pre-release: v0.1.0-alpha.1 is 0.1.0alpha.1, which pacman sorts before
# 0.1.0 (vercmp).

pkgbase=vtium
pkgname=vtium
_tag=v0.1.0-alpha.10
pkgver=0.1.0alpha.10
pkgrel=1
pkgdesc='Terminal for the Linux console, drawn through KMS/DRM'
arch=('x86_64')
url='https://github.com/vtium/vtium'
# vtium is MIT. The console also builds in tables made from Unicode's data
# (Unicode-3.0), X.Org's color names (MIT-open-group and MIT) and
# tiny-skia (BSD-3-Clause), which COPYING lists. The package installs the
# Terminus and Unifont font files (OFL-1.1), Cullet Mono, whose icon sets
# add the MIT, Apache-2.0 and CC-BY-4.0 licenses its notices name, and
# color schemes under the MIT and Apache-2.0 licenses.
license=('MIT' 'OFL-1.1' 'Unicode-3.0' 'MIT-open-group' 'BSD-3-Clause'
         'Apache-2.0' 'CC-BY-4.0')
# fontforge runs Nerd Fonts' font patcher, which builds Cullet Mono for a
# tag from 0.1.0-alpha.10 on.
makedepends=('cargo' 'git' 'libxkbcommon' 'seatd' 'systemd-libs' 'fontforge')
options=('!debug')
# vtium's own source, then the font sources vtium pins in
# tools/fonts/pins.tsv and tools/cullet-mono/pins.tsv from 0.1.0-alpha.10
# on, at the SHA-256 each pin names: Terminus 4.49.1's release archive,
# Terminus (TTF) 4.49.3 and Nerd Fonts' font patcher 3.4.0. prepare() hands
# them to vtium's tools whole, so makepkg leaves them packed. An earlier
# tag uses none of them.
source=("vtium::git+https://github.com/vtium/vtium.git#tag=${_tag}?signed"
        'https://downloads.sourceforge.net/project/terminus-font/terminus-font-4.49/terminus-font-4.49.1.tar.gz'
        'https://files.ax86.net/terminus-ttf/files/4.49.3/terminus-ttf-4.49.3.zip'
        'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FontPatcher.zip')
noextract=('terminus-font-4.49.1.tar.gz' 'terminus-ttf-4.49.3.zip' 'FontPatcher.zip')
sha256sums=('SKIP'
            'd961c1b781627bf417f9b340693d64fc219e0113ad3a3af1a3424c7aa373ef79'
            '0ead921d98d99a4590ffe6cd66dc037fc0a2ceea1c735d866ba73fe058257577'
            'a8f11e511ed7c69e96680858c06b50a643ea7752e26d5cd13dd5e5cc53ab1760')
validpgpkeys=('33F9B54FD2A4B6A4110749B3BA464FC9847A832A') # Aaron Bockelie <aaronsb@gmail.com>

package_vtium() {
  # seatd holds libseat.so, which the console links with libseat; installing
  # it enables no seatd daemon.
  depends=('bash' 'glibc' 'libgcc' 'libglvnd' 'libxkbcommon' 'mesa' 'seatd'
           'systemd-libs' 'vtium-terminfo')
  optdepends=("vtium-fonts: the rest of vtium's catalog of font sets, and the fonts they draw with"
              "kbd: console fonts, which vconsole.conf's FONT= and vtium.conf's font-name can name"
              'kmscon-terminfo: the terminfo entry kmscon, for sessions run with term=kmscon')
  # The other console packages, so a machine holds one at a time. Each of
  # them provides vtium, so a package that depends on vtium is met by any.
  conflicts=('vtium-git' 'vtium-minspec' 'vtium-minspec-git'
             'vtium-minspec-gpu' 'vtium-minspec-gpu-git')
  # Seat mode's PAM file, and the frits that make install stages by default
  # for this tag, which keep a user's edits across an upgrade (ADR-1500 D8).
  backup=('etc/pam.d/vtium'
          'etc/vtium/fonts/console/cullet-mono.vtfrit'
          'etc/vtium/fonts/console/terminus.vtfrit'
          'etc/vtium/fonts/code/jetbrains-mono.vtfrit'
          'etc/vtium/fonts/small/unifont-icons.vtfrit'
          'etc/vtium/fonts/small/unscii-icons.vtfrit'
          'etc/vtium/fonts/layers/nerd-symbols.vtlayer'
          'etc/vtium/fonts/layers/nerd-symbols-small.vtlayer'
          'etc/vtium/fonts/layers/noto-emoji.vtlayer'
          'etc/vtium/fonts/layers/noto-emoji-small.vtlayer'
          'etc/vtium/fonts/layers/unifont.vtlayer')
  install=vtium.install
  _package_console
}

# The console's features while VTIUM_FEATURES is unset, and the default of
# hwaccel, the same as vtium-git's: the build for an ordinary desktop or
# laptop, with right-to-left text, seat mode through libseat and logind, and
# the GPU path on by default (ADR-1500 D8).
_features='images logind gpu bidi libseat filters'
_hwaccel=on

# Everything below is the same in vtium-git/PKGBUILD and vtium/PKGBUILD;
# aur-publish refuses a package whose copy differs from the other's.

prepare() {
  cd vtium
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
  if _installs_fonts; then
    _cache_pinned tools/fonts/pins.tsv fonts
    _cache_pinned tools/cullet-mono/pins.tsv cullet-mono
    _make font-files
  fi
}

# Whether vtium's tree installs font files of its own: Terminus's BDF files,
# Unifont's .hex file and Cullet Mono's two faces. From 0.1.0-alpha.10 on,
# make install checks each of them against its pin and stops when one is
# missing. An earlier tag installs no font file.
_installs_fonts() {
  grep -q '^font-files-check:' "$srcdir/vtium/Makefile"
}

# _cache_pinned PINS DIR links each source that vtium's pin file PINS names
# into $srcdir/cache/vtium/DIR. vtium's tools look for their sources in
# $XDG_CACHE_HOME/vtium/DIR, and _make points XDG_CACHE_HOME at
# $srcdir/cache, so the tools find every source there and download nothing.
# makepkg has already checked each source's SHA-256, and the tools check it
# again against the pin. When the tree pins a source this recipe does not
# download, the build stops here and names it.
_cache_pinned() {
  local file cache=$srcdir/cache/vtium/$2
  mkdir -p "$cache"
  for file in $(awk -F'\t' '$1 == "source" { print $2 }' "$1"); do
    if [[ ! -f $srcdir/$file ]]; then
      printf "vtium's %s pins %s, which this recipe does not download\n" "$1" "$file" >&2
      return 1
    fi
    ln -sf "$srcdir/$file" "$cache/$file"
  done
}

# vtium's Makefile builds and stages every file the packages ship, so which
# file goes where lives in vtium's tree (ADR-1500 D1, D3). Each call names
# the same build, so make install in package() finds the build that build()
# made, and builds nothing again:
#
#   - PREFIX=/usr, so the console starts its glyph helper at
#     /usr/bin/vtium-config and its image helper at /usr/bin/vtium-image.
#   - FEATURES, the console's features: _features, set above, while
#     VTIUM_FEATURES is unset in makepkg's environment (ADR-1500 D2, D8).
#     VTIUM_FEATURES names other features, such as
#     VTIUM_FEATURES='images logind', and set but empty, as in
#     VTIUM_FEATURES= makepkg, it names none, so the console is the minspec
#     build. Whatever it names, the package's dependencies and the two
#     settings below stay those of the default build.
#   - HWACCEL, the default the console and vtium-config read for hwaccel:
#     _hwaccel, set above (ADR-1500 D8). With hwaccel on, the console draws
#     on the GPU path unless a line no-hwaccel in /etc/vtium/vtium.conf
#     turns it off. With hwaccel off, it draws on the CPU until a line
#     hwaccel turns the GPU path on.
#   - DISPLAY_BUFFERS=3, the default of display-buffers: the console keeps
#     three buffers for each display.
#   - --frozen, because prepare() fetched the crates.
#   - XDG_CACHE_HOME, the cache that prepare() fills with the pinned font
#     sources, where make font-files and make cullet-mono look for them.
#
# The recipe names no FRITS, so make install stages the font sets and
# layers that vtium's Makefile names for a console package into
# /etc/vtium/fonts.
_make() {
  CARGO_TARGET_DIR=target XDG_CACHE_HOME="$srcdir/cache" \
    make -C "$srcdir/vtium" PREFIX=/usr \
    FEATURES="${VTIUM_FEATURES-$_features}" HWACCEL="$_hwaccel" \
    DISPLAY_BUFFERS=3 CARGO_BUILD_FLAGS=--frozen "$@"
}

# The console, built with vtium's minspec profile, its glyph helper and,
# with images, its image helper. For a tree that installs its own font
# files, make cullet-mono first builds Cullet Mono's two faces with
# FontForge from the pinned sources in the cache, and checks each face
# against the SHA-256 that vtium pins for it.
build() {
  if _installs_fonts; then
    _make cullet-mono
  fi
  _make install-build
}

# The console, its helper, its units vtium@.service and vtium-getty@.service,
# the example configuration /etc/vtium/vtium.conf.example, the font sets in
# /etc/vtium/fonts, the example udev rules and hwdb fragment, and LICENSE.
# From 0.1.0-alpha.10 on, also the font files in /usr/share/vtium/fonts,
# with Cullet Mono's notices in the package's license directory.
# With images, also the image helper /usr/bin/vtium-image, the sysusers file
# that creates its account, and the picture gallery tool
# /usr/bin/vtium-gallery, a bash script. With libseat and logind, also seat
# mode's unit vtium-seat@.service and the PAM file /etc/pam.d/vtium, which
# opens vtium's own session in seat mode (ADR-1400 D3).
# The recipe installs COPYING and the two license texts it points to beside
# LICENSE itself, so that a package built from a tag whose make install
# stages LICENSE alone still carries them. COPYING holds the notices for the
# third-party code and data vtium builds in, such as Unicode's data tables,
# whose license asks that its notice go with every copy. OFL-1.1.txt is the
# SIL Open Font License of the Unifont font, which asks that its text go
# with the font, and rgb-license.txt is the license of X.Org's color names.
_package_console() {
  _make install DESTDIR="$pkgdir" PKGNAME="$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/vtium/COPYING" \
    "$srcdir/vtium/crates/vtium-font/data/OFL-1.1.txt" \
    "$srcdir/vtium/crates/vtium-term/gen-color-names/src/rgb-license.txt"
}
