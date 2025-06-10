# Maintainer: Nicola Fontana <ntd@entidi.it>
# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgbase='etherlab-ethercat'
pkgname=('etherlab-ethercat-tools' 'etherlab-ethercat-dkms')
pkgver=1.6.5
pkgrel=1
arch=('i686' 'x86_64')
url='https://etherlab.org'
source=("ethercat-$pkgver.tar.bz2::https://gitlab.com/etherlab.org/ethercat/-/releases/$pkgver/downloads/dist-tarballs/ethercat.tar.bz2"
        "ethercat.sysusers"
        "99-EtherCAT.rules"
        "dkms.conf")
sha512sums=('4abaabeb6b876881012ac988b86a4f1ddcaffc06f14a7df1b008674680af12578f9cf721c7361cc3d123ccabed33b69857211335baee4e981ff45167071ca9ee'
            'b029d47d10850569f180801fdc6bb2209dc9014649615123fe677416586df1c5a4f0901bcbd2da73b0e48ce752fe2a732272afdbf2445edf9ed4740be1ada7d8'
            'b3baca5c546af8d57fe59e30d3acd63310a128fc938436b4a151e12fe2fde75029cf0f47b0ac2edc676e762a4cf7ac308b8229594a5d2c8301a02c0e8f623569'
            '1b13d1fab22d82b08af2c90535ad4e02f232ff4cadd22a0aea5a7819c857862e64f50daa5445ed512527fa7a3b1d038d6da93046e35182330ec0e7112d908ca9')

prepare() {
  cp -r "${srcdir}/ethercat-${pkgver}" "${srcdir}/ethercat-${pkgver}-dkms"
}

build() {
  cd "ethercat-$pkgver"
  # Only include the generic driver
  ./configure \
    --prefix=/usr --sbindir=/usr/bin --libdir=/usr/lib --sysconfdir=/etc \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --disable-kernel --enable-generic \
    --enable-tool --enable-userlib --disable-initd
  make all
}

check() {
  cd "ethercat-$pkgver"
  make check
}

package_etherlab-ethercat-dkms() {
  pkgdesc="Kernel modules for IgH EtherCAT(R) Master component"
  license=('GPL-2.0-only')
  depends=('dkms' 'etherlab-ethercat-tools')
  provides=('etherlab-ethercat')
  conflicts=('etherlab-ethercat')

  cd "ethercat-$pkgver-dkms"
  mkdir -p ${pkgdir}/usr/src/ethercat-dkms-${pkgver}/
  cp -r ./* ${pkgdir}/usr/src/ethercat-dkms-${pkgver}/
  cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/ethercat-dkms-${pkgver}
  # Set version
  sed -e "s/#MODULE_VERSION#/${pkgver}/" \
  -i "${pkgdir}"/usr/src/ethercat-dkms-${pkgver}/dkms.conf
}

package_etherlab-ethercat-tools() {
  pkgdesc="Tools for IgH EtherCAT(R) Master component"
  license=('LGPL-2.1-only')
  backup=('etc/ethercat.conf')

  install -Dm 0644 -t "$pkgdir/etc/udev/rules.d/" 99-EtherCAT.rules
  install -Dm 0644 ethercat.sysusers "$pkgdir/usr/lib/sysusers.d/ethercat.conf"

  cd "ethercat-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm 0644 -t "$pkgdir/etc/systemd/system/" script/ethercat.service
}
