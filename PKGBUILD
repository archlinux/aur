# Maintainer: Jose Riha < jose 1711 gmail com >

pkgname=gpmd85emulator-git
pkgver=r180.0faf074
pkgrel=1
pkgdesc="Multiplatform GNU/GPL Tesla PMD 85 Emulator (git version)"
arch=('i686' 'x86_64')
url="https://github.com/mborik/GPMD85Emulator"
license=('GPL')
depends=('gcc-libs' 'sdl2' 'libgl')
makedepends=('git' 'cmake')
conflicts=('gpmd85emulator')
provides=('gpmd85emulator')
source=("${pkgname}"::'git+https://github.com/mborik/GPMD85Emulator.git'
	'imgui::git+https://github.com/ocornut/imgui.git')
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git config submodule.gui/imgui.url "$srcdir/imgui"
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -S "$srcdir/$pkgname" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINSTALLED_RESOURCES=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -D -m644 "$srcdir/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
