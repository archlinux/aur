# Maintainer: gradia <gradia@disroot.org>

pkgname=olladesk
pkgver=0.3.10
pkgrel=1
pkgdesc="Client desktop per Ollama in stile ChatGPT (PySide6/Qt), con companion web per smartphone e tablet"
arch=('any')
url="https://github.com/gradia64/OllaDesk"
license=('GPL-3.0-or-later' 'ISC')   # ISC: icone di Lucide (olladesk/assets/icons)
depends=('python' 'pyside6' 'qt6-svg' 'hicolor-icon-theme')
makedepends=('git')
optdepends=(
  'ollama: server LLM locale'
  'python-pypdf: testo dei PDF allegati'
  'python-keyring: chiave API della ricerca web nel portachiavi (KWallet)'
  'python-qrcode: QR code per abbinare il telefono alla companion web'
  'qt6-imageformats: immagini WEBP allegate'
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
# Sottochiavi che possono firmare i tag (TAG_SIGNING_SUBKEYS in
# scripts/release-keys.sh): solo quelle del maintainer, mai nella CI.
_tag_subkeys=('F8C633AF7119D92C8DB41B2AEE3A018E7436BA92')

prepare() {
  cd "$pkgname"
  # makepkg accetta la firma di QUALUNQUE sottochiave della primaria in
  # validpgpkeys, anche quella della CI che firma solo gli allegati della
  # release. Qui si controlla dalla stessa riga VALIDSIG che il tag l'abbia
  # firmato una sottochiave dei tag, come fa scripts/verify-tag.sh.
  local signer sub
  signer="$(git verify-tag --raw "v$pkgver" 2>&1 \
    | awk -v p="${validpgpkeys[0]}" '$2 == "VALIDSIG" && $NF == p { print $3 }')"
  for sub in "${_tag_subkeys[@]}"; do
    if [[ -n $signer && $signer == "$sub" ]]; then
      return 0
    fi
  done
  printf '==> ERRORE: tag v%s firmato da «%s», che non è una sottochiave dei tag (%s)\n' \
    "$pkgver" "${signer:-nessuna firma valida}" "${_tag_subkeys[*]}" >&2
  return 1
}

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
  install -Dm644 io.github.gradia64.OllaDesk.desktop \
    "$pkgdir/usr/share/applications/io.github.gradia64.OllaDesk.desktop"
  install -Dm644 olladesk/assets/olladesk.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.gradia64.OllaDesk.svg"
  install -Dm644 io.github.gradia64.OllaDesk.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.gradia64.OllaDesk.metainfo.xml"

  install -d "$pkgdir/usr/share/man/man1"
  sed -e "s/@VERSION@/$pkgver/" \
      -e "s/@DATE@/$(date -u -d "@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%d)/" \
      packaging/common/olladesk.1.in > "$pkgdir/usr/share/man/man1/olladesk.1"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  # ISC non è tra le licenze comuni di Arch: namcap vuole il testo qui
  install -Dm644 olladesk/assets/icons/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-lucide"
}
