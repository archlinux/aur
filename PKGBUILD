# Maintainer: hjk321 <jekksit@gmail.com>

pkgname=porymap
_pkgname=porymap
pkgver=6.1.0
pkgrel=1
arch=('x86_64')
url="https://github.com/huderlem/porymap/"
license=('LGPL-3.0-only')
depends=('gcc-libs' 'glibc' 'qt6-base' 'qt6-declarative')
makedepends=('icoutils' 'qt6-tools' 'git')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/huderlem/porymap/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2cce3a912679ca99caa321abb11fae0e470d0e8f37f565d55fb43c1958e0406f')

# Grabs the latest release number, e.g. 6.0.0
pkgver() {
  git ls-remote --tags "https://github.com/huderlem/porymap.git" \
    | awk -F'refs/tags/' '{print $2}' \
    | grep -E '^v?[0-9]+\.[0-9]+\.[0-9]+$' \
    | sed 's/^v//' \
    | sort -V \
    | awk '$1 >= "6.0.0"' \
    | tail -n 1
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  qmake6
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -Dm755 porymap "$pkgdir/usr/bin/porymap"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  if [ -f "resources/icons/porymap-icon-2.ico" ]; then
    icotool --extract "resources/icons/porymap-icon-2.ico" --output porymap.png
    install -Dm644 porymap.png "$pkgdir/usr/share/pixmaps/porymap.png"
  fi

  cat > porymap.desktop << EOF
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
