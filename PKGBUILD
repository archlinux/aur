# Maintainer: gradia <gradia@disroot.org>

pkgname=olladesk
pkgver=0.3.0
pkgrel=1
pkgdesc="Client desktop per Ollama in stile ChatGPT (PySide6/Qt)"
arch=('any')
url="https://github.com/gradia64/OllaDesk"
license=('GPL-3.0-or-later')
depends=('python' 'pyside6' 'hicolor-icon-theme')
makedepends=('git')
optdepends=(
  'ollama: server LLM locale'
  'python-pypdf: testo dei PDF allegati'
  'python-keyring: chiave API della ricerca web nel portachiavi (KWallet)'
  'qt6-svg: icona SVG della finestra'
  'python-qrcode: QR code per abbinare il telefono alla companion web'
)
# Sorgente git dal tag firmato dal maintainer: con «?signed» makepkg verifica
# la firma del tag annotato e la accetta solo da una chiave in validpgpkeys.
# Il prefisso «$pkgname::» fissa la cartella del clone in $srcdir/olladesk.
source=("$pkgname::git+$url.git#tag=v$pkgver?signed")
# SKIP per scelta: l'integrità del sorgente la garantisce la firma del tag
# (?signed + validpgpkeys), non un hash.
sha256sums=('SKIP')
# Impronta della primaria: makepkg accetta anche le firme delle sue
# sottochiavi, quindi una rotazione delle sottochiavi non cambia questa riga.
validpgpkeys=('5B166C1B4AD7428C74A07D5BA3370987A0576694')  # gradia (OllaDesk release signing)

check() {
  cd "$pkgname"
  QT_QPA_PLATFORM=offscreen python tests/unit_test.py
}

package() {
  cd "$pkgname"

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
