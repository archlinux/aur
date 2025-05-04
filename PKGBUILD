# Maintainer: jxir <jxir@web.de>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Miguel Revilla <yo at miguelrevilla.com>
# Contributor: David Sotelo <dvsotelo at gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

_pkgname=qpdf
pkgname="${_pkgname}-zopfli"
pkgver=12.2.0
pkgrel=1
pkgdesc="QPDF: A Content-Preserving PDF Transformation System (with Zopfli support)"
arch=('x86_64')
url="https://github.com/qpdf/qpdf"
license=('Apache-2.0' 'Artistic-2.0')
depends=('gcc-libs' 'glibc' 'gnutls' 'libjpeg-turbo' 'openssl' 'zlib' 'zopfli')
makedepends=('cmake')
provides=('qpdf')
conflicts=('qpdf')
source=("https://github.com/qpdf/qpdf/releases/download/v$pkgver/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b3d1575b2218badc3549d6977524bb0f8c468c6528eebc8967bbe3078cf2cace')

build() {
  cd ${_pkgname}-${pkgver}
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -D BUILD_STATIC_LIBS:BOOL=OFF \
    -D REQUIRE_CRYPTO_GNUTLS:BOOL=ON \
    -D REQUIRE_CRYPTO_OPENSSL:BOOL=OFF \
    -D ZOPFLI:BOOL=ON \
    -D ENABLE_QTC:BOOL=ON \
    -D BUILD_DOC:BOOL=OFF
  make -C build
}

check() {
  cd ${_pkgname}-${pkgver}
  make -C build test
}

package() {
  cd ${_pkgname}-${pkgver}
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 completions/bash/qpdf "${pkgdir}/usr/share/bash-completion/completions/qpdf"
  install -Dm644 completions/zsh/_qpdf "${pkgdir}/usr/share/zsh/site-functions/_qpdf"

  rm -rf "${pkgdir}"/usr/share/doc

  mkdir -m755 -p "${pkgdir}"/usr/share/licenses/${_pkgname}
  install -m644 {Artistic-2.0,LICENSE.txt} "${pkgdir}"/usr/share/licenses/${_pkgname}/
}
