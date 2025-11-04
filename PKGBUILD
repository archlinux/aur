# Maintainer: gladon4 <mcgoldhand at gmail dot com>
pkgname=typstwriter-git
pkgver=0.3
pkgrel=1
pkgdesc="Typstwriter: GUI frontend/writer using Typst + Qt. This is the more up to date version based on the main branch instead of the releases."
arch=('any')
url="https://github.com/Bzero/typstwriter"
license=('MIT')  
depends=(
  'python'
  'python-qtpy'
  'python-pyqt6'    
  'pyside6'
  'python-pygments'
  'qt6-webengine'
  'python-qt-themes'
)
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-flit-core'
)
conflicts=(
  # Because both 'just' install the typstwriter pip package and use the same command
  'typstwriter'
)
source=(
  "typstwriter-${pkgver}.zip::https://github.com/Bzero/typstwriter/archive/refs/heads/master.zip"
)
sha256sums=('SKIP')  

build() {
  cd "$srcdir/typstwriter-master"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/typstwriter-master"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 /dev/null "$pkgdir/usr/share/applications/typstwriter.desktop"
    
    # Add desktop entry
    cat > "$pkgdir/usr/share/applications/typstwriter.desktop" <<EOF
[Desktop Entry]
Name=Typstwriter
Comment=GUI frontend/writer for Typst
Exec=typstwriter
Icon=typstwriter
Type=Application
Categories=Office;Utility;
Terminal=false
EOF

mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "$srcdir/typstwriter-master/typstwriter/icons/typstwriter.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/typstwriter.svg"
}
