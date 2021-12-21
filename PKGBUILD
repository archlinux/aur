# Maintainer: robertfoster
pkgname=abyss-engine-git
pkgver=r221.79be7ba
pkgrel=1
pkgdesc="A game engine designed to run games similar to 2000's style ARPGs such as Diablo II"
arch=('i686' 'x86_64')
url="https://github.com/AbyssEngine/AbyssEngine"
license=('GPL3')
depends=('cppzmq' 'ffmpeg' 'lua' 'sdl2_ttf' 'spdlog' 'sol2')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}" "opendiablo2-git")
conflicts=("${pkgname%-git}" "opendiablo2-git")
source=("${pkgname%-git}::git+${url}"
  "opendiablo2::git+https://github.com/AbyssEngine/OpenDiablo2"
  "opendiablo2.sh"
)
install="${pkgname%-git}.install"

sha256sums=('SKIP'
            'SKIP'
            '45666f5f052518b30217aef2a310b80eefff6e3a3822e3fec9aa3666dc8989e9')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  if [ ! -d build ]; then
    mkdir build
  fi
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  cd build
  make DESTDIR="$pkgdir" install
  mkdir -p "${pkgdir}/usr/share"
  cp -r "${srcdir}/opendiablo2" \
    "${pkgdir}/usr/share/opendiablo2"

  install -Dm755 "${srcdir}/opendiablo2.sh" \
        "${pkgdir}/usr/bin/opendiablo2"
}
