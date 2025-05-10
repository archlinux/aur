# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
# Contributor: Adrian Hühn <adrian.huehn@web.de>

_pkgname=libevhtp
pkgname="${_pkgname}"-seafile
pkgver=1.2.0
pkgrel=5
epoch=2
pkgdesc="A more flexible replacement for libevent's httpd API. [Built for seafile]"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/haiwen/libevhtp"
license=('BSD-3-Clause')
depends=('libevent>=2.0.0')
makedepends=('cmake')
provides=('libevhtp')
conflicts=('libevhtp')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        'Use_posix_regex_instead_oniguruma.diff')
sha256sums=('d8d98072693f5f68ccd74d327dedfa2f6add4446ac2799689c2f58dd480aa301'
            'd6d911f25bd9ca236d03c6ebc978d60feb49030cb8ba7158363d09984249c581')

prepare(){
  cd "${srcdir}/${_pkgname}-${pkgver}"

  patch -p1 < "${srcdir}/Use_posix_regex_instead_oniguruma.diff"
}

build () {
    cmake \
        -B build -S "${srcdir}/${_pkgname}-${pkgver}" \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DEVHTP_DISABLE_SSL=ON \
        -DEVHTP_BUILD_SHARED=ON
    cmake --build build
}

package () {
    DESTDIR="$pkgdir" cmake --install build

    cd "${srcdir}/${_pkgname}-${pkgver}"
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
