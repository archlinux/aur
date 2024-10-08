# Maintainer: kevku <kevku@gmx.com>
pkgname=qdigidoc4
pkgver=4.6.0.4458
_rls_tag=v4.6.0
pkgrel=1
pkgdesc="DigiDoc4 Client is an application for digitally signing and encrypting documents; the software includes functionality to manage Estonian ID-card - change pin codes, update certificates etc."
arch=('x86_64')
url="https://www.id.ee/"
license=('LGPL-2.1-or-later')
depends=('zlib' 'openssl' 'libdigidocpp>=4.0.0' 'libldap' 'pcsclite' 'opensc' 'qt6-base' 'qt6-svg' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'gettext' 'flatbuffers' 'qt6-tools' 'qt6-translations')
optdepends=('ccid: Smart Card support'
            'python-nautilus: Nautilus Extension')
source=("$pkgname-$pkgver::git+https://github.com/open-eid/DigiDoc4-Client.git?signed#tag=$_rls_tag"
        "open-eid-cmake::git+https://github.com/open-eid/cmake.git"
        "open-eid-common::git+https://github.com/open-eid/qt-common.git"
        "open-eid-extensions::git+https://github.com/open-eid/digidoc-extensions.git")
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP")
validpgpkeys=(
    'D1EBC666EFCBFBD3CFC2EBAA90C0B5E75C3B195D'  # Raul Metsma https://github.com/metsma.gpg
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  [[ -d "$pkgname-build" ]] && rm -r "$pkgname-build"
  mkdir "$pkgname-build"

  git submodule init
  git config submodule.cmake.url $srcdir/open-eid-cmake
  git config submodule.common.url $srcdir/open-eid-common
  git config submodule.extensions.url $srcdir/open-eid-extensions
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/$pkgname-$pkgver/$pkgname-build"
  export BUILD_NUMBER=${pkgver##*.}
  cmake .. -DCMAKE_C_FLAGS:STRING="${CFLAGS} -ffile-prefix-map=$srcdir=." \
           -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -ffile-prefix-map=$srcdir=." \
           -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DCMAKE_INSTALL_SYSCONFDIR="/etc" \
           -DQT_DIR="/usr/lib/cmake/Qt6"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/$pkgname-build"
  make DESTDIR="$pkgdir/" install
}
