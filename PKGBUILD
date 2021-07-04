# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=winbar-git
pkgver=r144.g6f3069f
pkgrel=1
pkgdesc='A familiar X11 panel/dock to ease new linux users transition'
arch=('x86_64')
url="https://github.com/jmanc3/winbar"
license=('GPL3')
depends=('libconfig' 'libpulse' 'librsvg' 'libxkbcommon-x11' 'xcb-util-cursor' 'xcb-util-wm')
makedepends=('cmake' 'git' 'unzip')
optdepends=('papirus-icon-theme'
            'pavucontrol: volume settings'
            'wpa_supplicant_gui: gui wireless settings')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
install='winbar.install'
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  sed 's|DESTINATION /usr/local/bin/|DESTINATION /usr/bin/|g' -i CMakeLists.txt
}

build() {
  cmake -B build -S "${pkgname%-git}" -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -d "${pkgdir}/usr/share/winbar"
  unzip "${pkgname%-git}/winbar.zip" -d "${pkgdir}/usr/share/winbar"

  echo "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}
