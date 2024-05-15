# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Maintainer: Petrov Vlad <petrov.vlad@ya.ru>
# Contributor: ava1ar <mail(at)ava1ar(dot)info>

pkgname=freelib
pkgver=6.0.93
pkgrel=2
pkgdesc="Freelib is book library manager"
arch=(x86_64)
url="https://github.com/petrovvlad/freeLib"
license=(GPL3)
depends=(qt6-base qt6-svg qt6-httpserver quazip-qt6)
optdepends=('kindlegen: convert to EPUB, MOBI, AZW3'
            'djvulibre: djvu covers')
makedepends=(git cmake)
source=("git+https://github.com/petrovvlad/freeLib.git#tag=v${pkgver}"
        "git+https://github.com/stachenov/quazip.git#tag=v1.4"
        "freelib-SmtpClient-for-Qt::git+https://github.com/petrovvlad/SmtpClient-for-Qt.git")
sha256sums=('52973c0e601993b30bf837f724480b5e41728c85745d39d387d73e6bfc38cf95'
            '227ee101df7e98fb5d32b03b195186585cab0ff0bf065ac20f08aab94b9a13f7'
            'SKIP')

prepare() {
  cd "freeLib"
  git submodule init
  git config submodule.freeLib/src/quazip.url     "${srcdir}/quazip"
  #git config submodule.freeLib/src/quazip.update none
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

