# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Peter Semiletov <peter.semiletov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Michal Kaliszka <desmont@gmail.com>
# Contributor: Zsolt Varadi <sysop_xxl@fibermail.hu>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=tea-qt
pkgver=63.3.1
pkgrel=3
pkgdesc="Powerful text editor for Linux, *BSD, Windows, OS/2, Mac and Haiku OS with PDF and DJVU support"
arch=(x86_64)
url="https://tea.ourproject.org/"
license=(GPL-3.0-or-later)
depends=(qt6-base glibc gcc-libs hunspell)
makedepends=(cmake git)
optdepends=('poppler: open and search text in PDF files'
            'djvulibre: open and search in DJVU')
source=("git+https://github.com/psemiletov/tea-qt.git#tag=${pkgver}")
sha512sums=('3714c8f9b14311ec210d8790db30c287992d499770c1d9f8dd9e1bc3fe62ae0726d8a658e4d541295cddd61cc51ccdc59c815f7d79c6a1fe8763e5091253c7ef')

build() {
  local _flags=(
    -DUSE_PDF=ON
    -DUSE_DJVU=ON
  )

  cmake -B build -S "tea-qt" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build

  cd "${srcdir}/tea-qt/"
  sed -i 's/tea %F/tea-qt %F/g' desktop/tea.desktop
}

package(){
  DESTDIR="${pkgdir}" cmake --install build
  mv "${pkgdir}/usr/bin/tea" "${pkgdir}/usr/bin/tea-qt"
}
