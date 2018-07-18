# Maintainer: kevku <kevku@gmx.com>
pkgname=qdigidoc4
pkgver=4.0.0.23
pkgrel=2
pkgdesc="DigiDoc4 Client is an application for digitally signing and encrypting documents; the software includes functionality to manage Estonian ID-card - change pin codes, update certificates etc."
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL2.1')
depends=('libdigidocpp>=3.13.6' 'opensc>=0.18.0' 'qt5-svg' 'hicolor-icon-theme')
makedepends=('cmake' 'qt5-tools' 'qt5-translations')
conflicts=('qdigidoc' 'qesteidutil')
provides=('qdigidoc' 'qesteidutil')
source=("https://installer.id.ee/media/ubuntu/pool/main/q/$pkgname/${pkgname}_$pkgver.orig.tar.xz"
        "qdigidoc4_4.0.0.23-qt5.11.patch")
sha256sums=('e2ed6f0bad477a2fa8f8b3d7cb4fa1c2b72ed4c65afa1dea72c3df445341a959'
            'b6c71e40d0b8b91597f95f05b42c6c148027223fbc13fa714e0039ad6e39a9d2')

prepare() {
  [[ -d "$pkgname-build" ]] && rm -r "$pkgname-build"
  mkdir "$pkgname-build"
  sed -i 's|#{ENV\["BUILD_NUMBER"\]}|23|g' cmake/modules/VersionInfo.cmake
  patch -p1 -i "$srcdir/qdigidoc4_4.0.0.23-qt5.11.patch"
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
