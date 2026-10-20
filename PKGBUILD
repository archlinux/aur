# skwir's release build for Arch, for the AUR (ADR-040, ADR-052): the
# release's portable tarball as it is, in /opt/skwir, with every helper
# (MuPDF's and Mermaid's among them) and the libraries it carries, built
# for glibc 2.35 and on. ../PKGBUILD builds the same release from source
# against Arch's libraries. `just aur-prepare <tag>` fills the tarball's
# checksum, the release's own; `just aur-publish <tag>` pushes it
# (docs/RELEASING.md).
# Maintainer: venator <venator at tutamail dot com>

pkgname=skwir-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='An augmented file manager, for humans and agents (the release build)'
arch=('x86_64')
url='https://skwir.org'
_repo='https://github.com/skwir-org/skwir'
# skwir's own, PDFium's, the Poppler and DjVuLibre readers' (ADR-042,
# ADR-061) and the MuPDF engine's (ADR-014). The libraries it carries keep
# their notices in /opt/skwir/usr/share/doc.
license=('Apache-2.0' 'BSD-3-Clause' 'GPL-3.0-only' 'AGPL-3.0-or-later')
# What the tarball leaves to the system (ADR-052): the C and C++
# runtimes, the display's and the sound's libraries, a Vulkan driver, and
# the font configuration its fontconfig reads.
depends=(
  'glibc' 'libgcc' 'libstdc++' 'libx11' 'libxcb' 'wayland' 'libglvnd'
  'libdrm' 'mesa' 'alsa-lib' 'vulkan-driver' 'fontconfig'
)
optdepends=(
  'bubblewrap: LibreOffice, ImageMagick and thumbnailers run isolated'
  'libreoffice-fresh: office documents shown as pages'
  'pandoc-cli: text documents read by Pandoc'
  'imagemagick: pictures no thumbnailer draws'
  'ffmpeg: still frames of films'
  'perl-image-exiftool: writing and removing pictures locations'
  'plocate: instant name searches over whole disks'
  'udisks2: unmounting volumes from the sidebar'
)
provides=("skwir=$pkgver" "skwir-mermaid=$pkgver" "skwir-mupdf=$pkgver")
conflicts=('skwir' 'skwir-mermaid' 'skwir-mupdf')
# Its programs and libraries as the release built and checked them.
options=('!strip' '!debug')
source=("skwir-$pkgver-linux-x86_64.tar.gz::$_repo/releases/download/v$pkgver/skwir-$pkgver-linux-x86_64.tar.gz")
# Filled by aur-prepare with the release's.
sha256sums=('ce8c4233b770799e143f576abc08be0956a73e4e9f7a3cd3ba76d4650ded668f')

package() {
  install -d "$pkgdir/opt" "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses"
  cp -a --no-preserve=ownership "skwir-$pkgver-linux-x86_64" "$pkgdir/opt/skwir"
  # skwir finds its helpers, libraries and licences beside the program
  # the link leads to.
  ln -s /opt/skwir/usr/bin/skwir "$pkgdir/usr/bin/skwir"
  ln -s /opt/skwir/usr/share/licenses/skwir "$pkgdir/usr/share/licenses/$pkgname"
  cd "$pkgdir/opt/skwir/usr/share"
  install -Dm644 applications/org.skwir.skwir.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 metainfo/org.skwir.skwir.metainfo.xml -t "$pkgdir/usr/share/metainfo/"
  for icon in icons/hicolor/*/apps/org.skwir.skwir.*; do
    install -Dm644 "$icon" "$pkgdir/usr/share/$icon"
  done
}
