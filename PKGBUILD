# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: localizator <localizator@ukr.net>
# Contributor: Edvinas Valatka <edacval@gmail.com>

pkgname=seafile-client
pkgver=6.1.8
pkgrel=3
pkgdesc="GUI client for synchronizing your local files with seafile server"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/haiwen/${pkgname}"
license=('Apache')
depends=("seafile" "qt5-tools" "qt5-webkit" "qt5-base"
         "gtk-update-icon-cache" "qt5-webengine")
makedepends=("cmake")
conflicts=('seafile-client-qt5')
provides=('seafile-client-qt5')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "qt5.11.patch")
sha256sums=('daef6d2b5be5659dca55bc782262f7c7cc5a8e4b0b4db5f4a7fedad9e061e6db'
            '47a2726f442d847e5654d388ae507996609e26dff59287f37f82aeaf1fec46e9')

prepare() {
  cd "${srcdir}"

  rm -rf build
  mkdir -p build

  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/qt5.11.patch"
}

build () {
  cd "$srcdir/build"

  cmake \
    -DBUILD_SHIBBOLETH_SUPPORT=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${srcdir}/${pkgname}-${pkgver}"

  make
}

package () {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install
}
