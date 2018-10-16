# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=opensm
pkgver=3.3.21
pkgrel=2
pkgdesc='OpenFabrics Alliance InfiniBand Subnet Manager and Administrator'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('rdma-core' 'bash')
source=("https://github.com/linux-rdma/${pkgname}/archive/${pkgver}.tar.gz"
        'opensm.service'
        'opensm.launch')
sha256sums=('50d024090dc083274bc840792a3b539ecee5ad37a42948f43e84068e42b89b48'
            'a40c8a556cb170d84ffb49791fb82aabb21dc4afd22865e8f264a93c1f304788'
            '91cce7a6b652490ad2aa382a0be2ba078068f5a633f4a5f07f7e718f3c91cf53')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
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
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # Convert from init.d to systemd
  rm -rf "${pkgdir}/etc/init.d"
  # ${pkgdir}/etc should now be empty
  rmdir "${pkgdir}/etc/" > /dev/null

  install -Dm644 "${srcdir}/opensm.service" "${pkgdir}/usr/lib/systemd/system/opensm.service"
  install -Dm755 "${srcdir}/opensm.launch" "${pkgdir}/usr/bin/opensm.launch"
}
