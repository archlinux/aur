# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
pkgname=rmilter
pkgver=1.6.4
pkgrel=2
epoch=
pkgdesc="Another sendmail milter for different mail checks."
arch=('x86_64' 'i686' 'mips64el')
url="http://rspamd.com"
license=('BSD')
depends=('openssl' 'pcre' 'libmilter' 'opendkim')
makedepends=('cmake' 'pkgconfig' 'bison' 'flex')
install=rmilter.install

source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/vstakhov/${pkgname}/tar.gz/${pkgver}"
        "${pkgname}.service"
)

sha256sums=('9980e2e8bfed17489e76d672757eb1928846a9ba3b8ff8592549b5d7b3c59159'
            'c53ae6a6c323440e0f1f1d22a985878f3022300402bbee0b99109fe8dfc39c14'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake \
    -DDEBUG_MODE="OFF" \
    -DCMAKE_BUILD_TYPE="Release" \
    -DRMILTER_USER="_rmilter" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSBINDIR=/usr/bin \
    .

  make -j$(nproc)
}

package() {

  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -Dm0644 "${pkgname}.conf.sample" "${pkgdir}/etc/${pkgname}/${pkgname}.conf.sample"
  install -Dm0644 "${pkgname}-grey.conf" "${pkgdir}/etc/${pkgname}/${pkgname}-grey.conf"
  install -Dm0644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

}
