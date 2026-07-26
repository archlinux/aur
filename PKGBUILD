# Maintainer: Paul Woisard <paulwoisard@gmail.com>
pkgname=pdf-equilibrist
pkgver=0.1.13
pkgrel=1
pkgdesc="Éditeur PDF de bureau, gratuit et open-source, construit avec PyQt6 et PyMuPDF"
arch=('any')
url="https://github.com/Bit-Scripts/PDF-Equilibrist"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-pyqt6'
  'python-pymupdf'
  'python-pdf2docx'
  'python-pdfplumber'
  'python-openpyxl'
  'python-pptx'
  'python-pillow'
  'python-pyparsing'
  'hicolor-icon-theme'
  'desktop-file-utils'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
# bandit n'est pas empaqueté sur Arch/AUR (ni officiel ni AUR à ce jour) — l'analyse
# SAST intégrée à l'app se dégrade gracieusement sans lui (voir cve_checker.py),
# même choix que pour le manifest Flatpak (packaging/flatpak/README.md).
optdepends=('python-pip: pour installer bandit manuellement et activer l'"'"'analyse SAST intégrée')
# Le tag v0.1.10 a été créé AVANT l'ajout de packaging/flatpak/ (même jour, commit
# ultérieur) — le tarball de release ne contient donc pas les assets .desktop/
# metainfo/icônes. On les embarque ici en sources locales plutôt que de dépendre
# du contenu du tag (plus robuste : pas de resynchronisation à chaque release tant
# que ces fichiers ne changent pas).
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Bit-Scripts/PDF-Equilibrist/archive/refs/tags/v$pkgver.tar.gz"
  "io.github.BitScripts.PDFEquilibrist.desktop"
  "io.github.BitScripts.PDFEquilibrist.metainfo.xml"
  "io.github.BitScripts.PDFEquilibrist-128.png"
  "io.github.BitScripts.PDFEquilibrist-256.png"
)
sha256sums=(
  '2d3a1ee0345ca857712fb44057436fe35aa33660f07de99cde4e959a06a224a0'
  '51e985d95bae29ed2c6fb94029f7d790d9edc8d6dfe20a6385e275670cb8c383'
  'c35f51471c5dc7b607724da79828f039b9a6649f12e1faae10053f5513e33002'
  '91debebf1a5663c6b52cb1ad101c023d6ce751d3773476448808ad50c63fc440'
  '6a7aff895621d940226c026f0ac27f75456d3a679f0505b7f244307afc0b3e1b'
)

prepare() {
  cd "PDF-Equilibrist-$pkgver"
  # Aligne __version__ et pyproject.toml sur le tag empaqueté — même logique que
  # l'étape "Inject version into the package" de .github/workflows/release.yml,
  # qui ne s'applique qu'au build Windows et pas au code source du dépôt.
  sed -i "s/^__version__ = \".*\"/__version__ = \"$pkgver\"/" src/pdf_equilibrist/__init__.py
  sed -i "s/^version = \".*\"/version = \"$pkgver\"/" pyproject.toml
}

build() {
  cd "PDF-Equilibrist-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "PDF-Equilibrist-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "$srcdir/io.github.BitScripts.PDFEquilibrist.desktop" \
    "$pkgdir/usr/share/applications/io.github.BitScripts.PDFEquilibrist.desktop"
  install -Dm644 "$srcdir/io.github.BitScripts.PDFEquilibrist.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/io.github.BitScripts.PDFEquilibrist.metainfo.xml"
  install -Dm644 "$srcdir/io.github.BitScripts.PDFEquilibrist-128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/io.github.BitScripts.PDFEquilibrist.png"
  install -Dm644 "$srcdir/io.github.BitScripts.PDFEquilibrist-256.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.BitScripts.PDFEquilibrist.png"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # resource_path() (src/pdf_equilibrist/utils.py) cherche les assets sous
  # $PREFIX/share/pdf-equilibrist/assets/ pour tout paquet système Linux — sans ça
  # le splash screen et les icônes internes se dégradent silencieusement (fenêtre
  # vide au lancement, cf. bug trouvé lors du premier test makepkg -si).
  mkdir -p "$pkgdir/usr/share/pdf-equilibrist"
  cp -r assets "$pkgdir/usr/share/pdf-equilibrist/assets"
}
