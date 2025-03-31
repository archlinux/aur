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
pkgrel=1
pkgdesc="Powerful text editor for Linux, *BSD, Windows, OS/2, Mac and Haiku OS with PDF and DJVU support"
arch=(x86_64)
url="https://tea.ourproject.org/"
license=(GPL-3.0-or-later)
depends=(qt6-base glibc gcc-libs hunspell)
makedepends=(cmake git)
optdepends=('poppler: open and search text in PDF files'
            'djvulibre: open and search in DJVU')
source=("git+https://github.com/psemiletov/tea-qt.git#tag=${pkgver}")
sha512sums=('dbf289eaba1e9747af243367b79e4a99bb354e2d70bb9519c560af9d7d9471f6e825c6c27358089224783c80e5767dcd69cf4d5604ebcb7ca096e1f702146884')

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
