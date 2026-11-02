# Maintainer: Felipe BF <fprgw32 at gmail dot com>

_gitrepo=MarioQT
_name=marioqt
pkgname="${_name}-git"
pkgver=r149.3593fd2
pkgrel=1
pkgdesc="Playable Super Mario Bros NES-style Mario level editor"
arch=('x86_64')
url="https://github.com/ColinTr/${_gitrepo}"
license=('MIT')
depends=('libgcc' 'glibc' 'libstdc++' 'libglvnd' 'qt5-base' 'qt5-multimedia' 'hicolor-icon-theme')
makedepends=('git')

source=(
  "git+${url}.git#branch=master"
  "${_name}.desktop"
  "${_name}-icons.tar.gz"
)
sha256sums=('SKIP'
            '2a2398e78ef1a2d33415055fc19a282231e55c331602a25ace09eba9bd35bc15'
            '7b99d062bf5fddfbe9cce3ff929c3ada0939160a3591a1824e6129e063c5e57e')

pkgver() {
  cd "${srcdir}/${_gitrepo}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitrepo}"

  cd source_code
  sed -i "5,7d;s|/opt/\$\${TARGET}/bin|${pkgdir}/usr/bin|g" Mario.pro

  cd ..
  mkdir -p build && cd build
  qmake ../source_code/Mario.pro
}

build() {
  cd "${srcdir}/${_gitrepo}/build"
  make
}

package() {
  cd "${srcdir}/${_gitrepo}/build"
  make install
  mv "${pkgdir}/usr/bin/Mario" "${pkgdir}/usr/bin/marioqt"

  cd ..
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd ..
  install -Dm644 "${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"

  for size in 16 22 32 48 64 128 256 512; do
    local icon_folder="icons/hicolor/${size}x${size}"
    install -Dm644 "${_name}_${size}.png" "${pkgdir}/usr/share/${icon_folder}/apps/${_name}.png"
  done
}

