# Maintainer: executter <executter at hotmail dot com>

pkgname=mailcraft-bin
_pkgname=mailcraft
pkgver=0.11.1
pkgrel=1
pkgdesc='Open-source native mail, calendar, contacts and tasks app, Outlook alternative (binary release)'
arch=('x86_64' 'aarch64')
url='https://github.com/UCS-Care-Group/mailcraft'
# The upstream binaries are Rust programs: every crate is linked
# statically. Inventory: the crates whose source paths the binaries
# embed, with their crates.io licenses, completed from Cargo.lock for
# the crates that leave no path (Linux targets, non-dev dependencies),
# and the fonts compiled into mailcraft (mailcraft-cli has none). A
# crate that offers MIT or Apache-2.0 adds nothing; only the other
# terms are listed. Left out: webpki-root-certs (CDLA-Permissive-2.0,
# browser and Android builds only), clipboard-win and error-code
# (BSL-1.0, Windows only), colored (MPL-2.0, test tooling only).
license=(
  # MailCraft
  'MIT OR Apache-2.0'
  # Crates with no choice: MIT only, or Apache-2.0 only (accesskit_winit,
  # codespan-reporting, unicode-general-category, ring)
  'MIT'
  'Apache-2.0'
  # tiny-skia, encoding_rs (WHATWG data), subtle
  'BSD-3-Clause'
  # arrayref (tiny-skia)
  'BSD-2-Clause'
  # ring, rustls-webpki, untrusted, libloading
  'ISC'
  # foldhash (hashbrown, glifo)
  'Zlib'
  # Windows time zone names restated from the Unicode CLDR (crates/time);
  # yoke and zerofrom (read-fonts)
  'Unicode-3.0'
  # Inter, Source Sans 3, JetBrains Mono, and Noto Emoji (egui)
  'OFL-1.1'
  # Ubuntu Light (egui)
  'Ubuntu-font-1.0'
  # Hack (egui): MIT, with the glyphs of Bitstream Vera Sans Mono
  'Bitstream-Vera'
)
# The binaries link only glibc and libgcc_s (ELF NEEDED). Windowing,
# GPU and D-Bus libraries are dlopen'd, which namcap cannot see: this
# list follows the library names found in the binaries (same on x86_64
# and aarch64). No libXrandr among them, unlike upstream's nfpm.yaml.
depends=(
  'dbus'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libglvnd'  # libEGL: OpenGL fallback of wgpu
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
  'org.freedesktop.secrets: remember sign-ins between sessions (e.g. gnome-keyring)'
  'vulkan-driver: Vulkan rendering (falls back to OpenGL/EGL without one)'
  'xdg-desktop-portal: native open and save dialogs'
  'xdg-utils: open attachments with xdg-open'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
# Keep the upstream binaries as released (already stripped, no debug info)
options=('!strip' '!debug')
_raw="https://raw.githubusercontent.com/UCS-Care-Group/$_pkgname/v$pkgver"
# egui's font crate as pinned by Cargo.lock at v$pkgver: only used for
# the license texts of the fonts it compiles into mailcraft.
_epaint_fonts=0.37.0
source=(
  "$_pkgname-$pkgver-NOTICE::$_raw/NOTICE"
  "$_pkgname-$pkgver-OFL-Inter.txt::$_raw/assets/fonts/OFL-Inter.txt"
  "$_pkgname-$pkgver-OFL-SourceSans3.txt::$_raw/assets/fonts/OFL-SourceSans3.txt"
  "$_pkgname-$pkgver-OFL-JetBrainsMono.txt::$_raw/assets/fonts/OFL-JetBrainsMono.txt"
  "epaint_default_fonts-$_epaint_fonts.tar.gz::https://static.crates.io/crates/epaint_default_fonts/epaint_default_fonts-$_epaint_fonts.crate"
)
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
sha256sums=('24cae84af9daaafda42a085ebdbbfcd33e14b713b6449e312a018e32c2d3e07a'
            '262481e844521b326f5ecd053e59b98c8b2da78c8ee1bdbb6e8174305e54935a'
            '56af9b9c6715597e458284a474dc118a50a4150e9d547c70f7b4a33c3e6a9328'
            'a76abf002c49097d146e86740a3105a5d00450b1592e820a1109a8c5680cd697'
            'cfc1cc505827f4c23eedc297975a0fd038268d41293f389dd8ff3b574aefab19')
sha256sums_x86_64=('380197207e9484991e8916f56e7f45725b0e8471d4324f57f0482ccce18f3b3e')
sha256sums_aarch64=('5a9d16dc227a3c8c48425f5bc6e4ec647c436133ce61e5df18e55594075b8fe6')

package() {
  cd "$_pkgname-$pkgver-linux-$CARCH"

  # The tarball is already an FHS tree (bin/, share/); cp -r keeps its
  # modes (755 binaries, 644 data)
  install -d "$pkgdir/usr"
  cp -r bin share "$pkgdir/usr/"

  # Licenses that are not plain common texts (copyright notices, font
  # licenses). The Apache-2.0 text comes with the licenses package.
  local _lic="$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "share/doc/$_pkgname/LICENSE-MIT" "$_lic/LICENSE-MIT"

  cd "$srcdir"
  local _file
  for _file in NOTICE OFL-Inter.txt OFL-SourceSans3.txt OFL-JetBrainsMono.txt; do
    install -Dm644 "$_pkgname-$pkgver-$_file" "$_lic/$_file"
  done
  # egui's fonts: the Noto Emoji copyright line is in NOTICE
  local _fonts="epaint_default_fonts-$_epaint_fonts/fonts"
  install -Dm644 "$_fonts/OFL.txt" "$_lic/egui-NotoEmoji-OFL.txt"
  install -Dm644 "$_fonts/UFL.txt" "$_lic/egui-Ubuntu-UFL.txt"
  install -Dm644 "$_fonts/Hack-Regular.txt" "$_lic/egui-Hack.txt"
  install -Dm644 "$_fonts/emoji-icon-font-mit-license.txt" \
    "$_lic/egui-emoji-icon-font-MIT.txt"
}
