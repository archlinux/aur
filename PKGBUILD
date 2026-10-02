# Maintainer: gradia <gradia@disroot.org>

pkgname=olladesk
pkgver=0.2.4
pkgrel=1
pkgdesc="Client desktop per Ollama in stile ChatGPT (PySide6/Qt)"
arch=('any')
url="https://github.com/gradia64/OllaDesk"
license=('GPL-3.0-or-later')
depends=('python' 'pyside6' 'hicolor-icon-theme')
optdepends=(
  'ollama: server LLM locale'
  'python-pypdf: testo dei PDF allegati'
  'python-keyring: chiave API della ricerca web nel portachiavi (KWallet)'
  'qt6-svg: icona SVG della finestra'
)
# tarball e firma pubblicati nella release GitHub da .github/workflows/release.yml
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('837f5e7cb132d17e08db639bb6ab3abb1cd3343711795083b946545b2ae9f558'
            'SKIP')
validpgpkeys=('5B166C1B4AD7428C74A07D5BA3370987A0576694')  # chiave di release: packaging/olladesk-release-key.asc

check() {
  cd "$pkgname-$pkgver"
  QT_QPA_PLATFORM=offscreen python tests/unit_test.py
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/olladesk"
  cp -r olladesk "$pkgdir/usr/share/olladesk/"
  # marcatore letto da app_update.install_method(): suggerimenti AUR
  printf 'arch\n' > "$pkgdir/usr/share/olladesk/olladesk/_packaging"
  install -Dm644 packaging/common/launcher.py "$pkgdir/usr/share/olladesk/launcher.py"
  python -m compileall -q -s "$pkgdir" -p / "$pkgdir/usr/share/olladesk"

  install -Dm755 packaging/common/olladesk.sh "$pkgdir/usr/bin/olladesk"
  install -Dm644 olladesk.desktop "$pkgdir/usr/share/applications/olladesk.desktop"
  install -Dm644 olladesk/assets/olladesk.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/olladesk.svg"

  install -d "$pkgdir/usr/share/man/man1"
  sed -e "s/@VERSION@/$pkgver/" \
      -e "s/@DATE@/$(date -u -d "@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%d)/" \
      packaging/common/olladesk.1.in > "$pkgdir/usr/share/man/man1/olladesk.1"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
