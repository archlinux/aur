# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: ava1ar <mail(at)ava1ar(dot)info>

pkgname=freelib
pkgver=6.0.53
pkgrel=1
pkgdesc="Freelib is book library manager"
arch=(x86_64)
url="https://github.com/petrovvlad/freeLib"
license=(GPL3)
depends=(qt6-base qt6-svg qt6-httpserver quazip-qt6)
makedepends=(git cmake)
source=("git+https://github.com/petrovvlad/freeLib.git#tag=v${pkgver}"
        "git+https://github.com/stachenov/quazip.git"
        "freelib-SmtpClient-for-Qt::git+https://github.com/petrovvlad/SmtpClient-for-Qt.git")
sha256sums=('SKIP'
            'SKIP'
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
