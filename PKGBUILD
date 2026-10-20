# skwir's Arch packages built from main, for the AUR (ADR-040): those
# ../PKGBUILD makes from a release, from the repository's last commit.
# Their build and package functions are that PKGBUILD's, word for word
# but for the folder and what they provide (release-tools-check compares
# them); the PDFium they carry is the one the commit pins, which prepare()
# checks. makepkg names the version after the commit (pkgver());
# `just aur-prepare <tag>` publishes it again at each release.
# Maintainer: venator <venator at tutamail dot com>

pkgbase=skwir-git
pkgname=(skwir-git skwir-mermaid-git skwir-mupdf-git)
pkgver=0.2.0.r0.g083f928
pkgrel=1
pkgdesc='An augmented file manager, for humans and agents (its last commit)'
arch=('x86_64' 'aarch64')
url='https://skwir.org'
_repo='https://github.com/skwir-org/skwir'
license=('Apache-2.0')
# The libraries every helper links, to build them all, and what the
# packages depend on (a split PKGBUILD names it here too).
makedepends=(
  'git'
  'cargo' 'clang' 'cmake' 'python'
  'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'sqlite' 'libarchive'
  'cairo' 'glib2' 'poppler-glib' 'djvulibre' 'gstreamer' 'gst-plugins-base-libs'
  'fontconfig' 'vulkan-icd-loader' 'vulkan-driver'
)
# makepkg's LTO compiles the C that crates build (MuPDF) into GCC's
# intermediate code, which Rust's linker (lld) cannot read.
options=('!lto')
_pdfium=8086
source=("skwir::git+$_repo.git")
source_x86_64=("pdfium-linux-x64-$_pdfium.tgz::https://github.com/bblanchon/pdfium-binaries/releases/download/chromium%2F$_pdfium/pdfium-linux-x64.tgz")
source_aarch64=("pdfium-linux-arm64-$_pdfium.tgz::https://github.com/bblanchon/pdfium-binaries/releases/download/chromium%2F$_pdfium/pdfium-linux-arm64.tgz")
# PDFium's: as tools/package/pdfium.lock pins them.
sha256sums=('SKIP')
sha256sums_x86_64=('588577cf52dabc1a444988bac841920df54cc2f141801424de97ab04f4fbb935')
sha256sums_aarch64=('e7e2fe4686925618330103cb167950aca5a84bb00fd977a41b86be59dd1480a2')

pkgver() {
  cd skwir
  # The last release, the commits since and the commit: 0.1.0.r51.g17cf86d.
  git describe --long --tags --match 'v*' | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd skwir
  if [ "$(sed -n 's/^release //p' tools/package/pdfium.lock)" != "chromium/$_pdfium" ]; then
    echo "skwir's main pins another PDFium than this PKGBUILD's ($_pdfium):" \
      "the AUR package waits for its update" >&2
    return 1
  fi
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd skwir
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # shellcheck disable=SC2046 # one `-p name` per program
  cargo build --frozen --profile dist $(sed 's/^/-p /' tools/package/programs)
}

package_skwir-git() {
  provides=("skwir=$pkgver")
  conflicts=('skwir')
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
    'djvulibre: DjVu through DjVuLibre, beside the djvu-rs reader skwir carries'
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
  # skwir's own, PDFium's, and the Poppler and DjVuLibre readers': a
  # program linking Poppler (GPL v2 or v3) or DjVuLibre (GPL v2 or later)
  # with code under Apache-2.0 is under the GPL v3 (ADR-042, ADR-061).
  license=('Apache-2.0' 'BSD-3-Clause' 'GPL-3.0-only')
  cd skwir
  install -Dm755 target/dist/skwir "$pkgdir/usr/bin/skwir"
  while read -r program; do
    case "$program" in
    skwir | skwir-mermaid-worker | skwir-mupdf-worker) ;;
    *) install -Dm755 "target/dist/$program" -t "$pkgdir/usr/lib/skwir/" ;;
    esac
  done < tools/package/programs
  install -Dm755 "$srcdir/lib/libpdfium.so" -t "$pkgdir/usr/lib/skwir/"
  # skwir's folders, which it looks in for its licences
  # (crates/platform/src/about.rs) whichever package holds it.
  install -Dm644 "$srcdir/LICENSE" "$srcdir"/licenses/* -t "$pkgdir/usr/share/licenses/skwir/pdfium/"
  install -Dm644 tools/package/linux/org.skwir.skwir.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 tools/package/linux/org.skwir.skwir.metainfo.xml -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 crates/ui/assets/org.skwir.skwir.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/skwir/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/skwir/"
  # The notices of what its programs link, the source's (ADR-063): Arch's
  # skwir holds helpers Debian's ships apart.
  install -Dm644 tools/package/notices/arch/skwir/THIRD-PARTY-NOTICES -t "$pkgdir/usr/share/licenses/skwir/"
}

package_skwir-mermaid-git() {
  provides=("skwir-mermaid=$pkgver")
  conflicts=('skwir-mermaid')
  pkgdesc="Mermaid diagrams drawn in skwir's Markdown previews"
  depends=('skwir-git' 'libgcc' 'glibc')
  cd skwir
  install -Dm755 target/dist/skwir-mermaid-worker -t "$pkgdir/usr/lib/skwir/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/skwir-mermaid/"
  install -Dm644 tools/package/notices/skwir-mermaid/THIRD-PARTY-NOTICES -t "$pkgdir/usr/share/licenses/skwir-mermaid/"
}

package_skwir-mupdf-git() {
  provides=("skwir-mupdf=$pkgver")
  conflicts=('skwir-mupdf')
  pkgdesc="skwir's MuPDF engine: PDFs, and books laid out into pages"
  depends=('skwir-git' 'libgcc' 'glibc')
  # skwir's code, linking MuPDF (ADR-014).
  license=('AGPL-3.0-or-later')
  cd skwir
  install -Dm755 target/dist/skwir-mupdf-worker -t "$pkgdir/usr/lib/skwir/"
  install -Dm644 tools/package/notices/skwir-mupdf/THIRD-PARTY-NOTICES -t "$pkgdir/usr/share/licenses/skwir-mupdf/"
}
