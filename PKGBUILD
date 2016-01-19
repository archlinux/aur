# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
pkgname=rmilter
pkgver=1.7.0
pkgrel=1
epoch=
pkgdesc="Another sendmail milter for different mail checks."
arch=('x86_64' 'i686')
url="http://rspamd.com"
license=('BSD')
depends=('openssl' 'pcre' 'libmilter' 'opendkim')
makedepends=('cmake' 'pkgconfig' 'bison' 'flex')

backup=('etc/rmilter/rmilter-grey.conf')

install=rmilter.install

source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/vstakhov/${pkgname}/tar.gz/${pkgver}"
        "${pkgname}.service"
        "5df526d039345067201ece2accef05831be5d7d7.patch"
)

sha256sums=('0337c1e643f1c9115ae9a53cb79d883ef857ca8457a94b37ef135ee89166ea3d'
            'c53ae6a6c323440e0f1f1d22a985878f3022300402bbee0b99109fe8dfc39c14'
            'd9be5866568c2e074b6016c4af48e70e734b924acb5cbda515b241a9e7107c70'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 <../5df526d039345067201ece2accef05831be5d7d7.patch
}

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
