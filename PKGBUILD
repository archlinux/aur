# Maintainer: Aidan McConnon <aidanmcconnon210@gmail.com>
# AUR "-bin" package: repackages the prebuilt .deb from GitHub Releases (no
# compile). Bump pkgver + sha256sums on each release, regenerate .SRCINFO
# (`makepkg --printsrcinfo > .SRCINFO`), and push to the AUR git remote.
pkgname=cortex-bin
pkgver=1.0.25
pkgrel=1
pkgdesc="Local-first, open-source NotebookLM alternative — a desktop study OS"
arch=('x86_64')
url="https://github.com/PndaMan/cortex"
license=('Apache-2.0')
# poppler (pdftotext/pdftoppm) + ffmpeg are VITAL to core ingestion (PDF text/page
# images, audio), so they're hard deps — the app must not launch without them.
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'poppler' 'ffmpeg')
optdepends=(
  'mpv: background study music'
  'libreoffice-fresh: rendered PPTX/DOCX slide previews (text ingest works without it)'
  'tesseract: OCR for scanned PDFs / images'
  'ollama: local, keyless LLM + embeddings'
  'yt-dlp: YouTube / web audio + video ingest'
  'rclone: encrypted cloud backup'
  'age: backup encryption'
)
provides=('cortex')
conflicts=('cortex')
source=("https://github.com/PndaMan/cortex/releases/download/v${pkgver}/Cortex_${pkgver}_amd64.deb")
sha256sums=('2eb366503a13d1d31aea7a4a61b4697b6c58b2a7c8dfcfbff756f73d1e79199e')

package() {
  # A .deb is an `ar` archive containing data.tar.* with the install tree.
  cd "$srcdir"
  bsdtar -xf "Cortex_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.* -C "$pkgdir"

  # The .deb bundles the Tauri sidecars age/rclone/yt-dlp into /usr/bin, which
  # collides with the system 'rclone'/'yt-dlp'/'age' packages and makes pacman
  # abort with "exists in filesystem". Drop them — Cortex resolves these tools
  # bundled-sidecar → PATH → download at runtime, so the optdepends copies work.
  rm -f "$pkgdir/usr/bin/age" "$pkgdir/usr/bin/rclone" "$pkgdir/usr/bin/yt-dlp"
}
