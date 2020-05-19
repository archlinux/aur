# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=libupnp1.12
_pkgname=libupnp
pkgver=1.12.1
pkgrel=1
pkgdesc='A separate installation of libupnp 1.12 branch'
url='https://pupnp.sourceforge.net/'
arch=('x86_64')
license=('BSD')
depends=('glibc')
provides=( "${_pkgname}=${pkgver}" )
source=("https://downloads.sourceforge.net/sourceforge/pupnp/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('fc36642b1848fe5a81296d496291d350ecfc12b85fd0b268478ab230976d4009')

prepare() {
  cd "${_pkgname}-${pkgver}"
  autoreconf -fiv
}

build() {
  cd "${_pkgname}-${pkgver}"

  CFLAGS+=' -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE' ./configure \
    --prefix=/usr \
    --enable-reuseaddr \
    --libdir=/usr/lib/${_pkgname}-${pkgver%.*} \
    --includedir=/usr/include/${_pkgname}-${pkgver%.*}
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}"/usr/lib/pkgconfig/
  ln -sf /usr/lib/${_pkgname}-${pkgver%.*}/pkgconfig/libupnp.pc "${pkgdir}"/usr/lib/pkgconfig/${_pkgname}-${pkgver%.*}.pc

  install -dm755 "${pkgdir}"/etc/ld.so.conf.d/
  echo "/usr/lib/${_pkgname}-${pkgver%.*}" > "${pkgdir}"/etc/ld.so.conf.d/${_pkgname}-${pkgver%.*}.conf

  install -Dm 644 COPYING -t "${pkgdir}"/usr/share/licenses/${_pkgname}-${pkgver%.*}
}
