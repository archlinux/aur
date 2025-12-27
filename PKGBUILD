# Maintainer: hjk321 <jekksit@gmail.com>

pkgname='porymap5'
pkgdesc="Map editor for gen3 pret projects (legacy v5)"
pkgver=5.4.1
pkgrel=1
arch=('x86_64')
url='https://github.com/huderlem/porymap/'
license=('LGPL-3.0-only')
depends=('qt6-base' 'qt6-declarative')
makedepends=('icoutils' 'qt6-tools')
source=("porymap-${pkgver}.tar.gz::https://github.com/huderlem/porymap/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('093d19d45c789c6db3aa65af5856e29b20415cd1458d92491a48aa2ebfbd6a44')

# Conflicts with the main 'porymap' package (6.0+).
provides=("porymap=${pkgver}")
conflicts=('porymap')

prepare() {
  cd "$srcdir/porymap"
  # Apply patch to fix format string vulnerability (won't build otherwise)
  sed -i 's/qWarning(GifErrorString(error));/qWarning("%s", GifErrorString(error));/' src/vendor/QtGifImage/gifimage/qgifimage.cpp
}

build() {
  cd "$srcdir/porymap"
  qmake6
  make
}

package() {
  cd "$srcdir/porymap"

  # Install executable
  install -Dm755 porymap "$pkgdir/usr/bin/porymap5"

  # Copy license
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Extract icon
  icotool --extract resources/icons/porymap-icon-2.ico --output porymap5.png
  install -Dm644 porymap5.png "$pkgdir/usr/share/pixmaps/porymap5.png"

  # Create desktop entry
  cat <<EOF > porymap5.desktop
[Desktop Entry]
Name=porymap
Comment=Map editor for legacy gen3 pret projects
Exec=porymap5
Icon=/usr/share/pixmaps/porymap5.png
Terminal=false
Type=Application
Categories=Development;
EOF
  install -Dm644 porymap5.desktop "$pkgdir/usr/share/applications/porymap5.desktop"
}
