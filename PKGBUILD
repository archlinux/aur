# Maintainer: this.ven <https://this.ven.uber.space>
pkgname=bielebridge
pkgver=v0.0.7+20250305
pkgrel=1
pkgdesc="Challenging 2D bridge construction game"
arch=(x86_64)
url="https://bielebridge.net"
license=(GPL-3.0-or-later)
makedepends=(git cmake)
depends=(glu lua sdl2_gfx sdl2_image sdl2_ttf)
source=(
  "git+https://gitlab.digitalcourage.de/georg/$pkgname.git#tag=$pkgver"
  "bielebridge-install.patch"
)
sha256sums=(
  '944816485e93afdb4cceb8446bfe82ed59748f06184141d26b421bdb587c8903'
  '004977840d2074ab0d32d58807afcedf9fefbc526aba76fa923773b3f12d0b40'
)

prepare() {
  cd "${pkgname}"
  patch -p1 < "${srcdir}/bielebridge-install.patch"
}


build() {
  cd "$pkgname"

  cmake -B build -S . -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build -- -j"$(nproc)"
}

check() {
  cd "$pkgname"

  ctest -VV
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir" cmake --install build
  
  mv "$pkgdir/usr/share/bielebridge/resources" "$pkgdir/usr/share/bielebridge/data"
  mv "$pkgdir/usr/bin/bielebridge" "$pkgdir/usr/share/bielebridge/bielebridge.bin"
  
  # Wrapper script for working directory
  cat > "$pkgdir/usr/bin/bielebridge" << 'EOF'
#!/bin/bash
# bielebridge Launcher - setting working directory
cd /usr/share/bielebridge
exec ./bielebridge.bin "$@"
EOF
  chmod +x "$pkgdir/usr/bin/bielebridge"
}
