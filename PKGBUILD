# -*- mode: pkgbuild -*-
# Maintainer  : Youssef Fathy <youssefessamasu@gmail.com>

pkgname=quran-companion-git
_pkgname=quran-companion
pkgver=1.1.11
pkgrel=3
pkgdesc="Cross-platform desktop offline Quran reader and player"
arch=('x86_64')
url="https://github.com/0xzer0x/quran-companion"
license=('LGPL3')
depends=(qt6-base qt6-multimedia qt6-tools qt6-imageformats qt6-translations)
makedepends=(git cmake ninja)
provides=(quran-companion)
conflicts=(quran-companion)
source=("git+https://github.com/0xzer0x/quran-companion.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s" "$(cat ./VERSION)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  git checkout v$pkgver
  cmake -S ./ \
      -G Ninja \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release 
  ninja
}

package() {
  cd "${srcdir}/${_pkgname}"
  cmake --install ./ --prefix "${pkgdir}/usr"

  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/{64x64,128x128,256x256}/apps"

  install -D dist/xdg/io.github._0xzer0x.qurancompanion.desktop "${pkgdir}/usr/share/applications/"
  install -Dm644 dist/xdg/logo64.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/io.github._0xzer0x.qurancompanion.png
  install -Dm644 dist/xdg/logo128.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/io.github._0xzer0x.qurancompanion.png
  install -Dm644 dist/xdg/logo256.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/io.github._0xzer0x.qurancompanion.png
}

