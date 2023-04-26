# Maintainer: robertfoster
# Contributor: LIN Rs <LinRs[d]users.noreply.github.com>

pkgbase=devilutionx-git
pkgname=("${pkgbase}" "devilutionx-assets-git")
pkgver=1.4.0.r1542.fa0147cfa
pkgrel=1
pkgdesc="Diablo devolved for linux (git version)"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/diasurgical/devilutionX"
license=('custom:unlicense')
depends=('bzip2' 'fmt' 'libpng' 'libsodium' 'sdl2' 'sdl2_image' 'simpleini' 'zlib')
makedepends=('cmake' 'devilutionx-graphics-tools-git' 'flac' 'gettext' 'git' 'lame' 'smpq')
conflicts=("${pkgbase%-git}")
provides=("${pkgbase%-git}")
source=("${pkgbase%-git}::git+${url}"
  "${pkgbase%-git}-assets::git+${url}-assets")
sha256sums=('SKIP'
  'SKIP')

pkgver() {
  cd "${pkgbase%-git}"
  printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  if [ ! -d build ]; then
    mkdir build
  fi
}

build() {
  cd build
  cmake ../"${pkgbase%-git}" \
    -DBUILD_TESTING=off \
    -DCMAKE_INSTALL_PREFIX="/usr"

  cmake --build .
}

package_devilutionx-git() {
  cd build
  DESTDIR="${pkgdir}" \
    cmake --install .
}

package_devilutionx-assets-git() {
  pkgdesc="Additional assets for DevilutionX"
  depends=("${pkgbase}")
  conflicts=("${pkgname%-git}" "devilutionx-fonts" "devilutionx-voices")
  provides=("${pkgname%-git}" "devilutionx-fonts" "devilutionx-voices")

  cd "${srcdir}/${pkgname%-git}"
  
  ./build.sh

  install -Dm644 fonts.mpq \
    "${pkgdir}/usr/share/diasurgical/devilutionx/fonts.mpq"
  install -Dm644 pl.mpq \
    "${pkgdir}/usr/share/diasurgical/devilutionx/pl.mpq"
  install -Dm644 ru.mpq \
    "${pkgdir}/usr/share/diasurgical/devilutionx/ru.mpq"
}
