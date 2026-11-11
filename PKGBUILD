# Maintainer: executter <executter at hotmail dot com>

pkgname=anicraft-bin
_pkgname=anicraft
pkgver=0.2.0
pkgrel=1
pkgdesc='Open-source native 2D animation studio, Adobe Animate alternative (binary release)'
arch=('x86_64' 'aarch64')
url='https://getartcraft.com/apps/anicraft'
_repo='https://github.com/storytold/anicraft'
# The upstream binaries are Rust programs: every crate is linked
# statically. Inventory: the crates whose source paths the binaries
# embed, with their crates.io licenses, completed from Cargo.lock for
# the crates that leave no path (Linux targets, non-dev dependencies),
# and the fonts and icons compiled into anicraft (anicraft-cli has
# none). Upstream's docs/legal/third-party-inventory.txt predates
# v0.2.0. A crate that offers MIT or Apache-2.0 adds nothing; only the
# other terms are listed. Left out: clipboard-win and error-code
# (BSL-1.0, Windows only), boa_engine and its ICU crates (Unicode-3.0,
# test tooling only). Only egui's four fonts are embedded: Inter and
# JetBrains Mono, named in NOTICE, are not in these builds, nor the
# fonts whose OFL texts upstream ships in share/doc/anicraft. No
# ArtCraft brand mark is embedded (eframe's default icon is).
license=(
  # AniCraft
  'MIT OR Apache-2.0'
  # Crates with no choice: MIT only, or Apache-2.0 only (winit, cpal,
  # glutin, accesskit_winit, codespan-reporting, unicode-general-category)
  'MIT'
  'Apache-2.0'
  # ogg (lewton's Ogg reader)
  'BSD-3-Clause'
  # libloading; Lucide icons
  'ISC'
  # foldhash (hashbrown, glifo), slotmap
  'Zlib'
  # unicode-ident (naga's WGSL parser); plural rules restated from the
  # Unicode CLDR (src/i18n/plural.rs)
  'Unicode-3.0'
  # Noto Emoji (egui)
  'OFL-1.1'
  # Ubuntu Light (egui)
  'Ubuntu-font-1.0'
  # Hack (egui): MIT, with the glyphs of Bitstream Vera Sans Mono
  'Bitstream-Vera'
)
# The binaries link glibc and libgcc_s, and anicraft libasound (ELF
# NEEDED). Windowing, GPU and D-Bus libraries are dlopen'd, which
# namcap cannot see: this list follows the library names found in the
# binaries. D-Bus is for the file dialogs (rfd's portal backend).
depends=(
  'alsa-lib'
  'dbus'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libglvnd'  # libEGL, libGL: OpenGL fallback of wgpu, and glow
  'libx11'
  'libxcb'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'  # the window cannot open on X11 without it
  'vulkan-icd-loader'
  'wayland'
)
optdepends=(
  'ffmpeg: export video (WebM, MP4)'
  'pipewire-alsa: play sound through PipeWire'
  'pulseaudio-alsa: play sound through PulseAudio'
  'vulkan-driver: Vulkan rendering (falls back to OpenGL/EGL without one)'
  'xdg-desktop-portal: native open and save dialogs'
  'xdg-utils: open links with xdg-open'
  'zenity: open and save dialogs without a desktop portal'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
# Keep the upstream binaries as released (already stripped, no debug info)
options=('!strip' '!debug')
_raw="https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver"
# License texts that the tarball lacks: the fonts embedded by egui, and
# the Lucide icons (ISC, some derived from Feather, MIT)
source=(
  "$_pkgname-$pkgver-UFL-1.0-Ubuntu-font.txt::$_raw/licenses/fonts/UFL-1.0-Ubuntu-font.txt"
  "$_pkgname-$pkgver-LICENSE-Hack.txt::$_raw/licenses/fonts/LICENSE-Hack.txt"
  "$_pkgname-$pkgver-OFL-1.1-NotoEmoji.txt::$_raw/licenses/fonts/OFL-1.1-NotoEmoji.txt"
  "$_pkgname-$pkgver-LICENSE-emoji-icon-font.txt::$_raw/licenses/fonts/LICENSE-emoji-icon-font.txt"
  "$_pkgname-$pkgver-LICENSE-lucide.txt::$_raw/licenses/icons/LICENSE-lucide.txt"
)
# Upstream signs the tarballs, but its key is on no keyserver: the
# signatures are checked on each update, not by makepkg
source_x86_64=("$_repo/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$_repo/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
sha256sums=('2f0015108d68627bd788d313f529c21ff4da2c2c42a5e1f3883acc83480f9002'
            '47c0cccbeec7e8614548cc485588b28149e7874188df5f41b36efebcee285c87'
            '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2'
            'b9d2c1d909aa149996fd4c91dcb92b2362a04431640c1d200959da94caf8cde1'
            'b495047bd93a9b06913511076f504daba17d5bbeb3e0650f3bb53a4220329c57')
sha256sums_x86_64=('fdf1958ea485fca6e58b3ef4e3f59173ed4c09d4ca00567b69244cd93ccc81cb')
sha256sums_aarch64=('cedc72dddd0efa7dbcd034f2b568b23d8bac5e21378514a76721b34f11a29161')

package() {
  cd "$_pkgname-$pkgver-linux-$CARCH"

  # The tarball is already an FHS tree (bin/, share/); cp -r keeps its
  # modes (755 binaries, 644 data), without the build user as owner
  install -d "$pkgdir/usr"
  cp -r bin share "$pkgdir/usr/"

  # Licenses that are not plain common texts (copyright notices, font
  # and icon licenses). The Apache-2.0 text comes with the licenses
  # package.
  local _lic="$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 -t "$_lic" "share/doc/$_pkgname/"{LICENSE-MIT,NOTICE}

  cd "$srcdir"
  local _file
  for _file in UFL-1.0-Ubuntu-font.txt LICENSE-Hack.txt \
    OFL-1.1-NotoEmoji.txt LICENSE-emoji-icon-font.txt LICENSE-lucide.txt; do
    install -Dm644 "$_pkgname-$pkgver-$_file" "$_lic/$_file"
  done
}
