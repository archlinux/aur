# Maintainer: executter <executter at hotmail dot com>

pkgname=anicraft-bin
_pkgname=anicraft
pkgver=0.3.0
pkgrel=1
pkgdesc='Open-source native 2D animation studio, Adobe Animate alternative (binary release)'
arch=('x86_64' 'aarch64')
url='https://getartcraft.com/apps/anicraft'
_repo='https://github.com/storytold/anicraft'
# The upstream binaries are Rust programs: every crate is linked
# statically. Inventory: the crates whose source paths the binaries
# embed, with their crates.io licenses, completed from Cargo.lock for
# the crates that leave no path (Linux targets, non-dev dependencies),
# and the fonts and icons compiled into anicraft (anicraft-cli has only
# the app icon). Upstream's docs/legal/third-party-inventory.txt
# predates v0.2.0. A crate that offers MIT or Apache-2.0 adds nothing;
# only the other terms are listed. Left out: clipboard-win and
# error-code (BSL-1.0, Windows only), webpki-root-certs
# (CDLA-Permissive-2.0, wasm builds only), boa_engine (test tooling
# only). The update check (Help > Check for Updates, craft-update)
# brings an HTTPS client and signature checks. Embedded fonts: egui's
# Ubuntu Light and Hack, egui-icons (five glyphs of emoji-icon-font),
# and Noto Sans Georgian and Noto Sans Hebrew from craft-fonts; egui no
# longer embeds Noto Emoji. Inter and JetBrains Mono, named in NOTICE,
# are not in these builds, nor the other fonts whose OFL texts upstream
# ships in share/doc/anicraft. No ArtCraft brand mark is embedded; the
# app icon is (MIT OR Apache-2.0, assets/app-icon/LICENSE.txt).
license=(
  # AniCraft, and the craft-libs crates it builds on (git dependencies)
  'MIT OR Apache-2.0'
  # Crates with no choice: MIT only, or Apache-2.0 only (winit, cpal,
  # glutin, accesskit_winit, codespan-reporting, unicode-general-category,
  # ring); the ALAC decoder of craft-audio, ported from Apple's reference
  # code (Apache-2.0)
  'MIT'
  'Apache-2.0'
  # exr, lebe (OpenEXR images); alloc-no-stdlib, alloc-stdlib
  # (brotli-decompressor, JPEG XL metadata); the WHATWG tables of
  # encoding_rs; subtle (rustls), verifysign (update signatures)
  'BSD-3-Clause'
  # libloading; ring, rustls-webpki, untrusted (update check); Lucide
  # icons
  'ISC'
  # foldhash (hashbrown, glifo), slotmap, zlib-rs (flate2's Deflate)
  'Zlib'
  # unicode-ident (naga's WGSL parser), unicode-properties (epaint); ICU
  # crates of idna (update check); plural rules restated from the
  # Unicode CLDR (src/i18n/plural.rs)
  'Unicode-3.0'
  # symphonia and its sub-crates (sound decoding, through craft-audio),
  # unmodified; NOTICE says where their source code is
  'MPL-2.0'
  # jpeg-encoder (JPEG export, through craft-image-codecs): its forward
  # DCT comes from libjpeg-turbo; NOTICE makes the statement IJG asks for
  'IJG'
  # Noto Sans Georgian, Noto Sans Hebrew (craft-fonts)
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
  'ffmpeg: import video, export video (WebM, MP4)'
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
# The version of jpeg-encoder in upstream's Cargo.lock, and its commit
_jpegenc=0.6.1
_jpegenc_commit=d85bc4c329b1d9060e1c87ac8fff79a48cc4c734
# License texts that the tarball lacks: the fonts embedded by egui, the
# Lucide icons (ISC, some derived from Feather, MIT), and the IJG terms,
# which jpeg-encoder only states in the header of its fdct.rs
source=(
  "$_pkgname-$pkgver-UFL-1.0-Ubuntu-font.txt::$_raw/licenses/fonts/UFL-1.0-Ubuntu-font.txt"
  "$_pkgname-$pkgver-LICENSE-Hack.txt::$_raw/licenses/fonts/LICENSE-Hack.txt"
  "$_pkgname-$pkgver-LICENSE-emoji-icon-font.txt::$_raw/licenses/fonts/LICENSE-emoji-icon-font.txt"
  "$_pkgname-$pkgver-LICENSE-lucide.txt::$_raw/licenses/icons/LICENSE-lucide.txt"
  "jpeg-encoder-$_jpegenc-fdct.rs::https://raw.githubusercontent.com/vstroebel/jpeg-encoder/$_jpegenc_commit/src/fdct.rs"
)
# Upstream signs the tarballs, but its key is on no keyserver: the
# signatures are checked on each update, not by makepkg
source_x86_64=("$_repo/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$_repo/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
sha256sums=('2f0015108d68627bd788d313f529c21ff4da2c2c42a5e1f3883acc83480f9002'
            '47c0cccbeec7e8614548cc485588b28149e7874188df5f41b36efebcee285c87'
            'b9d2c1d909aa149996fd4c91dcb92b2362a04431640c1d200959da94caf8cde1'
            'b495047bd93a9b06913511076f504daba17d5bbeb3e0650f3bb53a4220329c57'
            '0b59244bbd05b2593ded252ecf0d010a8a4c6ec1d4713b3caeb6fb724586e4d6')
sha256sums_x86_64=('c83b78c1293bf37920aefe8bdca4443cf1d53fec450499872fc7fe5243eb114d')
sha256sums_aarch64=('3244bd8b26ffd96602559524a9f3a068777a0f421ce870d5c57dd578a6d30e82')

package() {
  cd "$_pkgname-$pkgver-linux-$CARCH"

  # The tarball is already an FHS tree (bin/, share/); cp -r keeps its
  # modes (755 binaries, 644 data), without the build user as owner.
  # The anicraft-portable file beside them is left out: AniCraft looks
  # for it above bin/, and would then keep its settings in /usr/data
  # instead of ~/.config/anicraft.
  install -d "$pkgdir/usr"
  cp -r bin share "$pkgdir/usr/"

  # Licenses that are not plain common texts (copyright notices, font
  # and icon licenses). The Apache-2.0 and MPL-2.0 texts come with the
  # licenses package.
  local _lic="$pkgdir/usr/share/licenses/$pkgname"
  local _doc="share/doc/$_pkgname"
  install -Dm644 -t "$_lic" "$_doc/"{LICENSE-MIT,NOTICE} \
    "$_doc/"OFL-noto-sans-{georgian,hebrew}.txt

  cd "$srcdir"
  local _file
  for _file in UFL-1.0-Ubuntu-font.txt LICENSE-Hack.txt \
    LICENSE-emoji-icon-font.txt LICENSE-lucide.txt; do
    install -Dm644 "$_pkgname-$pkgver-$_file" "$_lic/$_file"
  done
  # The IJG notice, without the comment markers of the Rust source
  sed -n '/Ported from mozjpeg/,/assumed by the product vendor/s/^ \*[ ]\{0,1\}//p' \
    "jpeg-encoder-$_jpegenc-fdct.rs" > "$_lic/IJG-jpeg-encoder.txt"
}
