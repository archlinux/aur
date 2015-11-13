# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
pkgname=rmilter
pkgver=1.6.5
pkgrel=1
epoch=
pkgdesc="Another sendmail milter for different mail checks."
arch=('x86_64' 'i686')
url="http://rspamd.com"
license=('BSD')
depends=('openssl' 'pcre' 'libmilter' 'opendkim')
makedepends=('cmake' 'pkgconfig' 'bison' 'flex')

backup=('etc/rmilter/rmilter-grey.conf'
		'etc/rmilter/rmilter.conf')

install=rmilter.install

source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/vstakhov/${pkgname}/tar.gz/${pkgver}"
        "${pkgname}.service"
)

sha256sums=('f5486a090e245fe1b35b96535a26145df0274603b849f0c1ee771970173d5e00'
            'c53ae6a6c323440e0f1f1d22a985878f3022300402bbee0b99109fe8dfc39c14'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake \
    -DENABLE_DEBUG="OFF" \
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
