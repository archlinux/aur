# Maintainer: kevku <kevku@gmx.com>
pkgname=qdigidoc4
pkgver=4.2.1.48
pkgrel=2
pkgdesc="DigiDoc4 Client is an application for digitally signing and encrypting documents; the software includes functionality to manage Estonian ID-card - change pin codes, update certificates etc."
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL2.1')
depends=('libdigidocpp>=3.13.9' 'opensc>=0.18.0' 'qt5-svg' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('cmake' 'qt5-tools' 'qt5-translations')
optdepends=('ccid: smart card support')
conflicts=('qdigidoc' 'qesteidutil')
provides=('qdigidoc' 'qesteidutil')
source=("https://installer.id.ee/media/ubuntu/pool/main/q/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('bd143f2ca779449c965be4f023dd00c1cc6fc8a90d7045b3ab0a0ced4aa84198')

prepare() {
  [[ -d "$pkgname-build" ]] && rm -r "$pkgname-build"
  mkdir "$pkgname-build"
  sed -i 's|#{ENV\["BUILD_NUMBER"\]}|48|g' cmake/modules/VersionInfo.cmake
}

build() {
  cd "$pkgname-build"
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
