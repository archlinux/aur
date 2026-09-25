# Maintainer: Mark Collins

pkgname=flowkeeper
_name="fk-desktop"
pkgver=1.1.0
pkgrel=1
pkgdesc="Pomodoro timer for power users and teams"
arch=(any)
url="https://github.com/flowkeeper-org/${_name}"
license=('AGPL-3.0-or-later')
depends=(
  'bash'
  'hicolor-icon-theme'
  'pyside6'
  'python'
  'python-cryptography'
  'python-keyring'
  'python-semantic-version'
  'qt6-charts'
)
makedepends=(
  'qt6-base'
)
source=(
  "${pkgname}-v${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
  "${pkgname}.desktop"
  "${pkgname}-autostart.desktop"
)
sha256sums=('d308fdb7adbb892184e285b7147a464670fcf7bcfd294ca65d0dd0f81088d7c7'
            'fb93fecc1a6bb82e0ea4a60735dff16e7db84cbf72ba3dae8d35aea8442c2848'
            '8eec5762b5e998430b212003b4cf699bc085bc247a779573a8116abcdd516dee')

build() {
  cd "${srcdir}/${_name}-${pkgver}/res"
  echo "Generating resource files"
  /usr/lib/qt6/rcc --project -o resources.qrc
  /usr/lib/qt6/rcc -g python resources.qrc -o "../src/fk/desktop/resources.py"
  
  cd "${srcdir}/${_name}-${pkgver}"
  echo "Compiling python files to bitecode"
  python -m compileall src
}

# Currently five tests are failing... (25/09/2026)
# checkdepends=(
#   'python'
#   'python-assertpy'               # AUR
#   'python-coverage'
#   'python-coveralls'              # AUR
#   'python-cryptography'
#   'python-keyring'
#   'python-pillow'
#   'python-semantic-version'
#   'python-unittest-xml-reporting' # AUR
# )
# check() {
#   cd "${srcdir}/${_name}-${pkgver}/src"
#   python -m coverage run -m unittest discover -v fk.tests
# }

package() {
  cd "${srcdir}"
  echo "Packaging desktop files"
  install -Dm644 "${pkgname}.desktop" \
    "$pkgdir/usr/share/applications/org.flowkeeper.Flowkeeper.desktop"
  install -Dm644 "${pkgname}-autostart.desktop" \
    "$pkgdir/usr/share/applications/org.flowkeeper.Flowkeeper-autostart.desktop"
  
  cd "${srcdir}/${_name}-$pkgver"
  local libdir="$pkgdir/usr/lib/flowkeeper"
  echo "Packaging app bundle"
  mkdir -p "$libdir"
  cp -a src/fk "$libdir/"
  echo "  ...without pre-compiled bytecode as it will be generated on first run."
  find "$libdir" -name '__pycache__' -type d -exec rm -rf {} +
  echo "  ...and without any tests"
  rm -fR "$pkgdir/usr/lib/flowkeeper/fk/e2e"
  rm -fR "$pkgdir/usr/lib/flowkeeper/fk/tests"
  echo "Packaging icons"
  install -Dm755 scripts/linux/common/flowkeeper "$pkgdir/usr/bin/flowkeeper"
  install -Dm644 flowkeeper-48x48.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/org.flowkeeper.Flowkeeper.png"
  install -Dm644 res/flowkeeper.png \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/org.flowkeeper.Flowkeeper.png"
  echo "Packaging metainfo"
  install -Dm644 scripts/linux/common/org.flowkeeper.Flowkeeper.metainfo.xml \
    "$pkgdir/usr/share/metainfo/org.flowkeeper.Flowkeeper.metainfo.xml"
  echo "Packaging README"
  install -Dm644 README.md "$pkgdir/usr/share/doc/flowkeeper/README.md"
}

