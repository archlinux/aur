# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="osslsigncode"
pkgver="2.6"
pkgrel="2"
pkgdesc="OpenSSL based Authenticode signing for PE/MSI/Java CAB files"
arch=('i686' 'x86_64')
url="https://github.com/mtrojnar/osslsigncode"
license=('GPL')
depends=('curl' 'openssl')
makedepends=('cmake' 'libfaketime')
source=("https://github.com/mtrojnar/${pkgname}/archive/${pkgver}.tar.gz"
        "issue-276-8854cada70456102df32a1c5d51b46809e66d63f.diff")
sha512sums=('f2ad32d13bd355b196484af47e66e972a4f27e54c7a9188d754a83e9f751363dcc4d6b93f1aed1fef16b5eadead43f08b831dbe9fdfde11d159880450e3e819d'
            '7ca0deff8913623cbb2525eeae92b2369f35a68b46a4ec0fde4588113a2858df07e144c9a30d95487973d8fa9bc223bd6a655c6208a1000a0ef48a3aa08ff1b5')

prepare() {
  patch -d "osslsigncode-${pkgver}" -p1 < "${srcdir}/issue-276-8854cada70456102df32a1c5d51b46809e66d63f.diff"

  cmake \
    -B build -S "$srcdir/osslsigncode-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSTOP_SERVER=OFF
}

build() {
  cmake --build build
}

check() {
  cd build
  ctest Release
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
