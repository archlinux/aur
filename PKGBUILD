# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Maintainer: Petrov Vlad <petrov.vlad@ya.ru>
# Contributor: ava1ar <mail(at)ava1ar(dot)info>

pkgname=freelib
pkgver=6.2.0
pkgrel=1
pkgdesc="Book library manager"
arch=(x86_64)
url="https://github.com/petrovvlad/freeLib"
license=(GPL3)
depends=(qt6-base qt6-svg qt6-httpserver quazip-qt6 onetbb qtkeychain-qt6)
optdepends=('kindlegen: convert to MOBI, AZW3'
            'djvulibre: djvu covers'
            'poppler-qt6: pdf covers'
            'kio: KDE integration')
makedepends=(git cmake)
conflicts=(freelib-git freelib-dev-git)
source=("git+https://github.com/petrovvlad/freeLib.git#tag=v${pkgver}"
        "freelib-SmtpClient-for-Qt::git+https://github.com/petrovvlad/SmtpClient-for-Qt.git")
sha256sums=('52e6850abd06a09a9d68ca9e4756cc722328e255d298b3d1c2de17a5d3d99f74'
            'SKIP')

prepare() {
  cd "freeLib"
  git submodule init
  #git config submodule.freeLib/src/quazip.url     "${srcdir}/quazip"
  git config submodule.freeLib/src/quazip.update none
  git config submodule.freeLib/src/SmtpClient.url "${srcdir}/freelib-SmtpClient-for-Qt"
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -B build -S "freeLib" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFREELIB_QT_MAJOR_VERSION=6

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
