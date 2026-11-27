# Maintainer: Vladimir B (Dexoron) <main@dexoron.tech>
pkgname=cremniy
pkgver=0.4.0
pkgrel=2
pkgdesc="Integrated low-level development environment with code editor, HEX editor and disassembler"
arch=('x86_64')
url="https://github.com/munirov/cremniy"
license=('GPL-3.0-only')
depends=(
  'gcc-libs'
  'glibc'
  'qt6-base'
  'qt6-svg'
  'libgit2'
  'hicolor-icon-theme'
)
makedepends=(
  'cmake'
  'gcc'
  'git'
  'qt6-tools'
  'http-parser'
)
provides=('cremniy')
conflicts=('cremniy-bin' 'cremniy-git')

source=(
  "cremniy::git+https://github.com/munirov/cremniy.git#tag=v${pkgver}"
)
sha256sums=('SKIP')

build() {
  cmake -B build -S "$srcdir/cremniy/src" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  
  JOBS=$(( $(nproc) > 2 ? $(nproc) - 2 : 1 ))
  cmake --build build --parallel "$JOBS"
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/cremniy/rpm/cremniy.desktop" \
    "$pkgdir/usr/share/applications/cremniy.desktop"
  sed -i '1{/^#!/d;}' "$pkgdir/usr/share/applications/cremniy.desktop"
  sed -i 's|^Icon=.*|Icon=cremniy|' "$pkgdir/usr/share/applications/cremniy.desktop"
  sed -i 's|^Exec=cremniy %F$|Exec=env QT_QPA_PLATFORM=xcb cremniy %F|' \
    "$pkgdir/usr/share/applications/cremniy.desktop"

  install -Dm644 "$srcdir/cremniy/docs/assets/cremniy_icon_stroke.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/cremniy.svg"

  install -Dm644 "$srcdir/cremniy/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/bin/Resources/translations"
  if compgen -G "$srcdir/build/Resources/translations/*.qm" > /dev/null; then
    install -m644 "$srcdir"/build/Resources/translations/*.qm \
      "$pkgdir/usr/bin/Resources/translations/"
  fi
}
