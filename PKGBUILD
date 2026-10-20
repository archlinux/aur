# Maintainer: gradia <gradia@disroot.org>

pkgname=plico
pkgver=0.1.4
pkgrel=1
pkgdesc="Editor PDF nativo per Linux: pagine, cancellazione vera, moduli, OCR, firma (PySide6/Qt)"
arch=('any')
url="https://github.com/gradia64/Plico"
license=('GPL-3.0-or-later')
# Tutto dai repository ufficiali. pyHanko e le sue due dipendenze che Arch
# non ha (pyhanko-certvalidator, uritools) sono Python puro e vengono incluse
# in /usr/share/plico/vendor, fissate per SHA-256 qui sotto: la firma PAdES
# funziona senza pacchetti AUR di terzi.
depends=(
  'python' 'pyside6' 'qt6-svg' 'hicolor-icon-theme'
  # il plugin TIFF di Qt (scansioni .tif in «Crea da immagini» e «Unisci»)
  'qt6-imageformats'
  'python-pymupdf' 'python-pikepdf'
  # dipendenze di pyHanko e pyhanko-certvalidator
  'python-asn1crypto' 'python-tzlocal' 'python-aiohttp' 'python-cryptography'
  'python-lxml' 'python-oscrypto' 'python-certifi'
)
makedepends=('git' 'qt6-tools')
checkdepends=('python-pytest' 'ttf-dejavu')
# Tesseract è dentro MuPDF (python-pymupdf): l'OCR vuole solo i dati di lingua
optdepends=(
  'tesseract-data-ita: OCR dei documenti in italiano'
  'tesseract-data-eng: OCR dei documenti in inglese'
  'tesseract-data-fra: OCR dei documenti in francese'
  'tesseract-data-deu: OCR dei documenti in tedesco'
  'tesseract-data-spa: OCR dei documenti in spagnolo'
)
_pyhanko=pyhanko-0.37.0-py3-none-any.whl
_certvalidator=pyhanko_certvalidator-0.32.1-py3-none-any.whl
_uritools=uritools-6.1.3-py3-none-any.whl
# Il tag firmato dal maintainer: con «?signed» makepkg verifica la firma del
# tag annotato e la accetta solo da una chiave in validpgpkeys. Il prefisso
# «$pkgname::» fissa la cartella del clone in $srcdir/plico.
source=(
  "$pkgname::git+$url.git#tag=v$pkgver?signed"
  "https://files.pythonhosted.org/packages/1c/6e/e6dfe44b6669574cf37f37efbe67cc969cb69e27620ac5e5ff7b45bab607/$_pyhanko"
  "https://files.pythonhosted.org/packages/f4/49/81f92016547077d004a883864da9148e725741f365064a1c9dfe5558f49a/$_certvalidator"
  "https://files.pythonhosted.org/packages/ac/76/e9bb35862bcc5b82218d2c017b1eacdcfeb3ba46ce0c0ca8ffc4db80ddbe/$_uritools"
)
# le wheel sono zip: makepkg non le scompatta, lo fa prepare() nella cartella giusta
noextract=("$_pyhanko" "$_certvalidator" "$_uritools")
# SKIP per il sorgente git: lo garantisce la firma del tag
sha256sums=('SKIP'
            '79046d8057edec5fcc61aa66dc1041262f5248eec473c33a89905a0a661eed05'
            '76100cdda13bd085beaa94d4b9080fe6f4ee67248976ec9a19c4d58642558a2b'
            '136f113e76e53f85bf2d9cce0c3d40ceec775d0409e7d6de9b28f046a7d42838')
# Impronta della primaria: makepkg accetta anche le firme delle sue
# sottochiavi, quindi una rotazione delle sottochiavi non cambia questa riga.
validpgpkeys=('184307C7A1585AFAD7F09DF6EBC8B4A0FFD5B91F')  # gradia (Plico release key)

prepare() {
  rm -rf vendor
  for wheel in "$_pyhanko" "$_certvalidator" "$_uritools"; do
    python -m zipfile -e "$wheel" vendor
  done
}

build() {
  cd "$pkgname"
  # i cataloghi: lrelease sta in qt6-tools, che serve solo per costruire
  local lrelease=/usr/lib/qt6/bin/lrelease
  for ts in src/plico/translations/*.ts; do
    "$lrelease" -silent "$ts" -qm "${ts%.ts}.qm"
  done
}

check() {
  cd "$pkgname"
  QT_QPA_PLATFORM=offscreen PYTHONPATH="$PWD/src:$srcdir/vendor" \
    python -m pytest -q -p no:cacheprovider tests
}

package() {
  cd "$pkgname"

  install -d "$pkgdir/usr/share/plico"
  cp -r src/plico "$pkgdir/usr/share/plico/"
  rm -f "$pkgdir"/usr/share/plico/plico/translations/*.ts
  cp -r "$srcdir/vendor" "$pkgdir/usr/share/plico/vendor"
  find "$pkgdir/usr/share/plico" -type d -name __pycache__ -prune -exec rm -rf {} +
  install -Dm644 packaging/common/launcher.py "$pkgdir/usr/share/plico/launcher.py"
  python -m compileall -q -s "$pkgdir" -p / "$pkgdir/usr/share/plico"

  # vendor/ nel PYTHONPATH: dopo la cartella di launcher.py (sys.path[0]),
  # prima dei pacchetti di sistema. Qui e non in launcher.py, perché il
  # launcher viene dal tag, e un tag vecchio non sa di vendor/
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/plico" <<'SH'
#!/bin/sh
PYTHONPATH="/usr/share/plico/vendor${PYTHONPATH:+:$PYTHONPATH}"
export PYTHONPATH
exec /usr/bin/python3 /usr/share/plico/launcher.py "$@"
SH
  chmod 755 "$pkgdir/usr/bin/plico"

  install -Dm644 flatpak/io.github.gradia64.plico.desktop \
    "$pkgdir/usr/share/applications/io.github.gradia64.plico.desktop"
  install -Dm644 flatpak/io.github.gradia64.plico.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.gradia64.plico.svg"
  install -Dm644 flatpak/io.github.gradia64.plico.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.gradia64.plico.metainfo.xml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
