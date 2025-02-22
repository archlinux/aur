# Maintainer: hjk321 <jekksit@gmail.com>

pkgname='porymap'
pkgdesc="Map editor for pret's generation 3 Pokémon decompilations"
pkgver=5.4.1
pkgrel=2
arch=('x86_64')
url='https://github.com/huderlem/porymap/'
license=('LGPL-3.0-only')
depends=('gcc-libs' 'glibc' 'qt6-base' 'qt6-declarative')
makedepends=('icoutils' 'qt6-tools')
source=("git+https://github.com/huderlem/porymap.git#tag=${pkgver}")
sha256sums=('ee02350570e4cc6f9788a06a30d6d9d7bfc67b93005afadae216f03623511c10')

prepare() {
  cd "$srcdir/$pkgname"
  # Apply patch to fix format string vulnerability (won't build otherwise)
  sed -i 's/qWarning(GifErrorString(error));/qWarning("%s", GifErrorString(error));/' src/vendor/QtGifImage/gifimage/qgifimage.cpp
}

build() {
  cd "$srcdir/$pkgname"
  qmake6
  make
}

package() {
  cd "$srcdir/$pkgname"
  # Install executable
  install -Dm755 porymap "$pkgdir/usr/bin/porymap"

  # Copy license
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Extract icon
  icotool --extract resources/icons/porymap-icon-2.ico --output porymap.png
  install -Dm644 porymap.png "$pkgdir/usr/share/pixmaps/porymap.png"

  # Create desktop entry
  cat <<EOF > porymap.desktop
[Desktop Entry]
Name=porymap
Comment=Map editor for pret's generation 3 Pokémon decompilations
Exec=porymap
Icon=/usr/share/pixmaps/porymap.png
Terminal=false
Type=Application
Categories=Development;
EOF
  install -Dm644 porymap.desktop "$pkgdir/usr/share/applications/porymap.desktop"
}
