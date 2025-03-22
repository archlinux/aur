# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>
# Contributor: Bakasura <bakasura-at-protonmail-dot-ch>

pkgname=velocity-xbox360-git
pkgver=0.1.0.0.r1326.cf0b84c
pkgrel=1
pkgdesc="A cross-platform application built using the Qt framework which allows you to browse and edit Xbox 360 files."
arch=('x86_64')
url='https://github.com/hetelek/Velocity.git'
license=('GPL3')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so libm.so
  'qt6-base' # libQt6Core.so libQt6Gui.so libQt6Network.so libQt6Widgets.so
  'botan' # libbotan-3.so
)
makedepends=(
  'git'
  'qt6-tools'
)
source=(
  'git+https://github.com/hetelek/Velocity.git'
  'velocity.desktop'
)
sha512sums=(
  'SKIP'
  '1855384f6dd07a86f97da17a538771c51959a800b5951f86dbbdccb7002dd48e611b3bf1f0c5f889f318a48d4c7b4d99e568064bffcebffc6c08aff915bb03ae'
)
options=('debug')

pkgver() {
  cd Velocity
  echo "$(grep 'VERSION =' Velocity/Velocity.pro | cut -d ' ' -f 3).$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")"
}

prepare() {
  # Fix the mess
  sed -e 's|/usr/lib/libbotan-3.so.0|-lbotan-3|g' \
      -e 's|BUILD_NAME = Unix|BUILD_NAME = Linux|g' \
      -e 's|XboxInternals/$(CONFIG)|XboxInternals/build/XboxInternals-$(OS)/$(CONFIG)|g' \
      -e 's|XBox|Xbox|g' \
      -i Velocity/Velocity/Velocity.pro \
      -i Velocity/XboxInternals/XboxInternals.pro \
      -i Velocity/Makefile
}

build() {
  cd Velocity
  make release QMAKE=qmake6
}

package() {
  install -d "${pkgdir}/opt/velocity/plugins"
  install -Dm755 Velocity/Velocity/build/Velocity-Linux/release/Velocity "${pkgdir}/opt/velocity/velocity"
  install -Dm644 Velocity/Velocity/Images/Leaner.png "${pkgdir}/usr/share/pixmaps/velocity.png"
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/velocity/velocity "${pkgdir}/usr/bin/velocity"
  install -Dm644 "${srcdir}/velocity.desktop" "${pkgdir}/usr/share/applications/velocity.desktop"
}
