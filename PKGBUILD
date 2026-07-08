# Maintainer: Emirhan Gedish <casanovalx@tutamail.com>
pkgname=qtcalc-git
pkgver=0.2a
pkgrel=1
pkgdesc="Dead simple calculator written in C++ and Qt6"
arch=('x86_64')
url="https://gitea.com/doccnova/qtcalc"
license=('GPL-3.0-or-later')
groups=()
depends=('qt6-base')
makedepends=('cmake' 'gcc' 'ninja' 'qt6-tools')
provides=("$pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir"
  if [ -f "$srcdir/$pkgname-$pkgver.tar.gz" ]; then
    tar -xzf "$srcdir/$pkgname-$pkgver.tar.gz" -C "$srcdir"
  fi

  if [ -f "$srcdir/$pkgname-$pkgver.patch" ]; then
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 < "$srcdir/$pkgname-$pkgver.patch"
  fi
}

build() {
  cd "$srcdir/qtcalc"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -G Ninja
  cmake --build build
}

check() {
  cd "$srcdir/qtcalc"
  if [ -f build/CTestTestfile.cmake ] || command -v ctest >/dev/null 2>&1; then
    cmake --build build --target test || ctest --output-on-failure
  fi
}

package() {
  cd "$srcdir/qtcalc"
  DESTDIR="$pkgdir" cmake --install build
  if [ -f LICENSE ] || [ -f COPYING ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || \
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING" 2>/dev/null
  fi
  mkdir -p "$pkgdir/usr/share/icons/hicolor/48x48/apps"
  install icon.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/qtcalc.png"

  cat <<EOF > "${pkgname}.desktop"
[Desktop Entry]
Name=QtCalc
Comment=Dead simple Qt calculator
Exec=/usr/bin/qtcalc
Icon=/usr/share/icons/hicolor/48x48/apps/qtcalc
Terminal=false
Type=Application
Categories=Utility;
EOF

  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
