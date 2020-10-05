# Maintainer: kevku <kevku@gmx.com>
pkgname=qdigidoc4
pkgver=4.2.6.79
pkgrel=1
pkgdesc="DigiDoc4 Client is an application for digitally signing and encrypting documents; the software includes functionality to manage Estonian ID-card - change pin codes, update certificates etc."
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL2.1')
depends=('libdigidocpp>=3.14.4' 'opensc' 'pcsclite' 'qt5-svg' 'hicolor-icon-theme')
makedepends=('cmake' 'qt5-tools' 'qt5-translations')
optdepends=('ccid: smart card support')
source=("https://installer.id.ee/media/ubuntu/pool/main/q/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('d675afa2a5171de6666145236fde96ace16461ffe57e4362e193284fc1a0a766')

prepare() {
  [[ -d "$pkgname-build" ]] && rm -r "$pkgname-build"
  mkdir "$pkgname-build"
}

build() {
  cd "$pkgname-build"
  export BUILD_NUMBER=${pkgver##*.}
  cmake .. -DCMAKE_C_FLAGS:STRING="${CFLAGS} -ffile-prefix-map=$srcdir=." \
           -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -ffile-prefix-map=$srcdir=." \
           -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DCMAKE_INSTALL_SYSCONFDIR="/etc"

  make
}

package() {
  cd "$pkgname-build"
  make DESTDIR="$pkgdir/" install
}
