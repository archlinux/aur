# Maintainer: Gaute Hope <eg@gaute.vetsj.com>, Johannes Heinz <heinzeljo@web.de>
pkgname=astroid
pkgver=0.15
pkgrel=4
epoch=
pkgdesc="a graphical threads-with-tags style, lightweight and fast, email client for notmuch, inspired by sup and others"
arch=('x86_64' 'i686')
url="https://github.com/astroidmail/astroid"
license=('GPL')
groups=()
depends=('notmuch' 'boost' 'boost-libs' 'gmime3' 'gtkmm3' 'webkit2gtk' 'libsass' 'libpeas' 'gobject-introspection' 'protobuf')
makedepends=('cmake' 'ninja' 'git' 'pkg-config' 'python-gobject' 'cmark' 'ruby-ronn' 'w3m')
checkdepends=('notmuch-runtime')
optdepends=('gvim: default editor'
            'emacs: can be used as editor'
            'vte3: for drop-down terminal'
            'cmark: for markdown to html composition')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="${pkgname}.install"
changelog=
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/astroidmail/astroid/archive/v${pkgver}.tar.gz"
        'test_compose.patch')
noextract=()
sha256sums=('8581bbdbc71bd00d4cdd473cfad8bc604628bb15616fe5eab5c623461f686c65'
            '8e54e55cf1ab891a5a328d2cce49ccf137562c81bee73d0318bb73ecc6c0385e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch --forward --strip=2 --input="${srcdir}/test_compose.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake .. -GNinja -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX="/usr"
  ninja
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cd build
  ctest --output-on-failure
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cd build
  DESTDIR="${pkgdir}" ninja install
}

