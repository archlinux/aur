# Maintainer: robertfoster

pkgname=qviaggiatreno-git
pkgver=17.e35721b
pkgrel=1
pkgdesc="Un'applicazione per controllare gli orari dei treni in tutta Italia tramite il sito viaggiatreno.it."
arch=('x86_64')
url="https://github.com/M0Rf30/qviaggiatreno"
license=('GPL-2.0-or-later')
depends=('qt6-base' 'hicolor-icon-theme' 'libgcc' 'libstdc++' 'glibc')
makedepends=('cmake' 'git')
provides=("${pkgname%%-*}")
conflicts=("${pkgname%%-*}-svn" "${pkgname%%-*}")
replaces=("${pkgname%%-*}-svn")
source=("qviaggiatreno::git+https://github.com/M0Rf30/qviaggiatreno")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%%-*}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cmake -B build -S ${pkgname%%-*} \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  QT_QPA_PLATFORM=offscreen ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
