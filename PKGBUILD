# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=opensm-systemd-multiple-interfaces
_pkgname=opensm
pkgver=3.3.21
pkgrel=2
pkgdesc='OpenFabrics Alliance InfiniBand Subnet Manager and Administrator'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
provides=('opensm')
conflicts=('opensm')
depends=('rdma-core' 'bash')
source=("https://github.com/linux-rdma/${_pkgname}/archive/${pkgver}.tar.gz"
        'opensm.service'
        'opensm.launch'
        'opensm_extra.conf')
sha256sums=('50d024090dc083274bc840792a3b539ecee5ad37a42948f43e84068e42b89b48'
            'a40c8a556cb170d84ffb49791fb82aabb21dc4afd22865e8f264a93c1f304788'
            '1ced7ee03c38601b0db84e3b7e69995bd190fd4528548401725fcd6902d8a7c1'
            '1f3f52202f28cb79a5d42fa6812ed6ef2af9844dce0c10063ea1bc1a4644d787')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # Convert from init.d to systemd
  rm -rf "${pkgdir}/etc/init.d"
  # ${pkgdir}/etc should now be empty
  rmdir "${pkgdir}/etc/" > /dev/null

  install -Dm644 "${srcdir}/opensm.service" "${pkgdir}/usr/lib/systemd/system/opensm.service"
  install -Dm755 "${srcdir}/opensm.launch" "${pkgdir}/usr/bin/opensm.launch"
  install -Dm644 "${srcdir}/opensm_extra.conf" "${pkgdir}/etc/opensm_extra.conf"
}
