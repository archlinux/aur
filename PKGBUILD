# skwir's Arch packages, for the AUR (ADR-040, ADR-041): built from a
# release's source with Arch's own Rust, PDFium from the release
# tools/package/pdfium.lock pins (aur/build.sh checks they agree). skwir
# carries its helpers, the Poppler reader's and the player's libraries
# left optional (skwir says the engine is not installed without them);
# Mermaid and MuPDF are packages of their own. The files are those of the
# Debian and RPM packages (crates/skwir/Cargo.toml). `just package-aur`
# writes .SRCINFO beside this file. `just aur-prepare <tag>` fills the
# source checksum in a separate checkout; `just aur-publish <tag>` pushes
# its reviewed PKGBUILD and .SRCINFO to the AUR (docs/RELEASING.md).
# Maintainer: venator <venator at tutamail dot com>

pkgbase=skwir
pkgname=(skwir skwir-mermaid skwir-mupdf)
pkgver=0.1.0
pkgrel=1
pkgdesc='An augmented file manager, for humans and agents'
arch=('x86_64' 'aarch64')
url='https://skwir.org'
_repo='https://github.com/skwir-org/skwir'
license=('Apache-2.0')
# The libraries every helper links, to build them all, and what the
# packages depend on (a split PKGBUILD names it here too).
makedepends=(
  'cargo' 'clang' 'cmake' 'cargo-about' 'python'
  'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'sqlite' 'libarchive'
  'cairo' 'glib2' 'poppler-glib' 'gstreamer' 'gst-plugins-base-libs'
  'fontconfig' 'vulkan-icd-loader' 'vulkan-driver'
)
# makepkg's LTO compiles the C that crates build (MuPDF) into GCC's
# intermediate code, which Rust's linker (lld) cannot read.
options=('!lto')
_pdfium=8086
source=("$pkgbase-$pkgver.tar.gz::$_repo/archive/v$pkgver.tar.gz")
source_x86_64=("pdfium-linux-x64-$_pdfium.tgz::https://github.com/bblanchon/pdfium-binaries/releases/download/chromium%2F$_pdfium/pdfium-linux-x64.tgz")
source_aarch64=("pdfium-linux-arm64-$_pdfium.tgz::https://github.com/bblanchon/pdfium-binaries/releases/download/chromium%2F$_pdfium/pdfium-linux-arm64.tgz")
# skwir's: filled by aur-prepare after the release tag is pushed; PDFium's: as
# tools/package/pdfium.lock pins them.
sha256sums=('4cd2ea398e5a7116e5f4195bca3b7f69b94fc7769bccc810feaff125f2910ded')
sha256sums_x86_64=('588577cf52dabc1a444988bac841920df54cc2f141801424de97ab04f4fbb935')
sha256sums_aarch64=('e7e2fe4686925618330103cb167950aca5a84bb00fd977a41b86be59dd1480a2')

prepare() {
  cd "$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # shellcheck disable=SC2046 # one `-p name` per program
  cargo build --frozen --profile dist $(sed 's/^/-p /' tools/package/programs)
  # What each package's programs link, and their notices: Mermaid's and
  # MuPDF's helpers apart, the others skwir's.
  tools/package/notices.py skwir-mermaid-worker skwir-mupdf-worker
}

package_skwir() {
  # What its programs link, and what skwir opens at run time (the Vulkan
  # loader and a driver for it, fontconfig).
  depends=(
    'libgcc' 'glibc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'sqlite'
    'fontconfig' 'vulkan-icd-loader' 'vulkan-driver' 'libarchive'
  )
  optdepends=(
    'gstreamer: audio and video playback'
    'gst-plugins-base-libs: audio and video playback'
    'gst-plugins-base: audio and video playback'
    'gst-plugins-good: more audio and video formats'
    'gst-plugins-bad: more audio and video formats'
    'gst-plugins-ugly: more audio and video formats'
    'gst-libav: more audio and video formats'
    'poppler-glib: PDFs through Poppler, beside the PDFium skwir carries'
    'skwir-mermaid: Mermaid diagrams drawn in Markdown previews'
    'skwir-mupdf: the MuPDF engine, PDFs and books laid out into pages'
    'bubblewrap: LibreOffice, ImageMagick and thumbnailers run isolated'
    'libreoffice-fresh: office documents shown as pages'
    'pandoc-cli: text documents read by Pandoc'
    'imagemagick: pictures no thumbnailer draws'
    'ffmpeg: still frames of films'
    'perl-image-exiftool: writing and removing pictures locations'
    'plocate: instant name searches over whole disks'
    'udisks2: unmounting volumes from the sidebar'
  )
  # skwir's own, PDFium's, and the Poppler reader's: a program linking
  # Poppler, whose core is GPL v2 or v3, with code under Apache-2.0 is
  # under the GPL v3 (ADR-042).
  license=('Apache-2.0' 'BSD-3-Clause' 'GPL-3.0-only')
  cd "$pkgbase-$pkgver"
  install -Dm755 target/dist/skwir "$pkgdir/usr/bin/skwir"
  while read -r program; do
    case "$program" in
    skwir | skwir-mermaid-worker | skwir-mupdf-worker) ;;
    *) install -Dm755 "target/dist/$program" -t "$pkgdir/usr/lib/skwir/" ;;
    esac
  done < tools/package/programs
  install -Dm755 "$srcdir/lib/libpdfium.so" -t "$pkgdir/usr/lib/skwir/"
  install -Dm644 "$srcdir/LICENSE" "$srcdir"/licenses/* -t "$pkgdir/usr/share/licenses/$pkgbase/pdfium/"
  install -Dm644 tools/package/linux/org.skwir.skwir.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 tools/package/linux/org.skwir.skwir.metainfo.xml -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 crates/ui/assets/org.skwir.skwir.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgbase/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgbase/"
  install -Dm644 target/notices/skwir/THIRD-PARTY-NOTICES -t "$pkgdir/usr/share/licenses/skwir/"
}

package_skwir-mermaid() {
  pkgdesc="Mermaid diagrams drawn in skwir's Markdown previews"
  depends=('skwir' 'libgcc' 'glibc')
  cd "$pkgbase-$pkgver"
  install -Dm755 target/dist/skwir-mermaid-worker -t "$pkgdir/usr/lib/skwir/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/skwir-mermaid/"
  install -Dm644 target/notices/skwir-mermaid/THIRD-PARTY-NOTICES -t "$pkgdir/usr/share/licenses/skwir-mermaid/"
}

package_skwir-mupdf() {
  pkgdesc="skwir's MuPDF engine: PDFs, and books laid out into pages"
  depends=('skwir' 'libgcc' 'glibc')
  # skwir's code, linking MuPDF (ADR-014).
  license=('AGPL-3.0-or-later')
  cd "$pkgbase-$pkgver"
  install -Dm755 target/dist/skwir-mupdf-worker -t "$pkgdir/usr/lib/skwir/"
  install -Dm644 target/notices/skwir-mupdf/THIRD-PARTY-NOTICES -t "$pkgdir/usr/share/licenses/skwir-mupdf/"
}
