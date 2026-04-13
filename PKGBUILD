pkgname=nss-altfiles
pkgver=2.23.0
pkgrel=1
pkgdesc="NSS module to look up users and other maps from /usr/lib"
arch=(x86_64)
url="https://github.com/flatcar/nss-altfiles"
license=('LGPL-2.1-or-later' 'MIT')
depends=('glibc')
makedepends=('gcc' 'make' 'git')

source=(
  "https://github.com/flatcar/nss-altfiles/archive/v${pkgver}.tar.gz"
  "0003-deprecate-RES_USE_INET6.patch"
)

sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 < ../0003-deprecate-RES_USE_INET6.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  ./configure \
    --with-types=all \
    --prefix=/usr \
    --libdir=/usr/lib \
    CFLAGS="${CFLAGS}" \
    LDFLAGS="${LDFLAGS}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
