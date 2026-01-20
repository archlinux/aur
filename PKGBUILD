# Maintainer: this.ven <https://this.ven.uber.space>
pkgname=bielebridge
pkgver=v0.0.7+20250305
pkgrel=3
pkgdesc="Challenging 2D bridge construction game"
arch=(x86_64)
url="https://bielebridge.net"
license=(GPL-3.0-or-later)
makedepends=(cmake)
depends=(glu lua sdl2_gfx sdl2_image sdl2_ttf)
source=(
  "https://gitlab.digitalcourage.de/georg/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
  "bielebridge-install.patch"
)
sha256sums=('6bc61186e88974570b0c55abbca0b86c24b686b231c425e18f375bdad87f83b6'
            '004977840d2074ab0d32d58807afcedf9fefbc526aba76fa923773b3f12d0b40')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 < "${srcdir}/bielebridge-install.patch"
}


build() {
  cd "$pkgname-$pkgver"

  cmake -B build -S . -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build -- -j"$(nproc)"
}

check() {
  cd "$pkgname-$pkgver"

  ctest -VV
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  
  mv "$pkgdir/usr/share/bielebridge/resources" "$pkgdir/usr/share/bielebridge/data"
  mv "$pkgdir/usr/bin/bielebridge" "$pkgdir/usr/share/bielebridge/bielebridge.bin"
  
  # Wrapper script for working directory
  cat > "$pkgdir/usr/bin/bielebridge" << 'EOF'
#!/bin/sh
# bielebridge Launcher - setting working directory
cd /usr/share/bielebridge
exec ./bielebridge.bin "$@"
EOF
  chmod +x "$pkgdir/usr/bin/bielebridge"
}
