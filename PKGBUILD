# Maintainer: Petrov Vlad <petrov.vlad@ya.ru>
pkgname=freelib-git-qt6
pkgver=6.0.53
pkgrel=1
epoch=
pkgdesc="Book library manager."
arch=('i686' 'x86_64')
url="https://github.com/petrovvlad/freeLib"
license=('GPL3')
groups=()
depends=('qt6-base' 'qt6-svg' 'qt6-httpserver' 'quazip-qt6')
makedepends=('git' 'cmake' 'make')
optdepends=('kindlegen: convert to EPUB, MOBI, AZW3')
checkdepends=()
provides=("$pkgname")
conflicts=('freelib' 'freelib-git')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/petrovvlad/freeLib.git#tag=v${pkgver}"
  "SmtpClient::git+https://github.com/petrovvlad/SmtpClient-for-Qt.git")
noextract=()
md5sums=('SKIP'
         'SKIP')

prepare() {
  cd "${pkgname}"
  install -d build
  git submodule init
  git config 'submodule.freeLib/src/SmtpClient.url' "${srcdir}/SmtpClient"

  git -c protocol.file.allow=always submodule update
}

build() {
  cd ${pkgname}/build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DFREELIB_QT_MAJOR_VERSION:STRING=6 ..
  cmake --build .
}

package() {
  cd "${pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd "build"
  make DESTDIR="$pkgdir/" install
}
