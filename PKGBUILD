# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>
# Contributor: John Downey <jdowney@gmail.com>
pkgname=plater-git
_pkgname="${pkgname%-git}"
pkgver=r175.e0b4389
pkgrel=1
pkgdesc="3D-printer parts placer and plate generator"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/Rhoban/Plater"
license=('custom:CC BY-NC')
depends=('qt5-base' 'libffi')
makedepends=('cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/Rhoban/Plater.git' 'plater-gui.desktop')
sha256sums=('SKIP'
            'd04fa30ae0281febc9b4be2cb385c5a5c5a72822083a1ad779612221c63a3538')

pkgver() {
  cd "$srcdir/Plater"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S Plater \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd "$srcdir/Plater"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  rm -rf "$pkgdir/usr/share/doc"
  # XDG desktop file
  install -Dm 644 "$srcdir/${_pkgname}-gui.desktop" -t "${pkgdir}/usr/share/applications"
}
