# Maintainer: Amish <contact at via dot aur>
pkgname=c-icap-modules
pkgver=0.4.5
pkgrel=2
pkgdesc='Modules for C-ICAP server'
depends=('c-icap')
arch=(i686 x86_64)
url='http://c-icap.sourceforge.net/'
license=('GPL' 'LGPL')
source=("http://downloads.sourceforge.net/project/c-icap/c-icap-modules/0.4.x/c_icap_modules-${pkgver}.tar.gz"
        'clamd_mod.conf'
        'virus_scan.conf')
sha256sums=('5312e6f208e2191797008b4a76ba303ab8048a108a1721cde4a217aed74d6674'
            '12b1d40a5012a51798b79a87e8108910f9f1fc35f17830ca2952596249fc5cfa'
            'd0fd9ab05ea9fa590e87af477b28156cf88de921411093a01147c984742c5a5f')
backup=('etc/c-icap/clamav_mod.conf'
        'etc/c-icap/clamd_mod.conf'
        'etc/c-icap/virus_scan.conf'
        'etc/c-icap/srv_url_check.conf')

build() {
  cd "${srcdir}/c_icap_modules-${pkgver}"
  ./configure \
      --prefix=/usr \
      --localstatedir=/var \
      --sbindir=/usr/bin \
      --sysconfdir=/etc/c-icap \

  make
}

package() {
  install -dm755 "${pkgdir}"/etc/c-icap
  cd "${srcdir}/c_icap_modules-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # fix some bad permissions
  find "${pkgdir}"/etc/c-icap/ -type f -print0 | xargs -0 chmod 644
  find "${pkgdir}"/usr/share/c_icap/templates/ -type f -print0 | xargs -0 chmod 644

  install -Dm644 ../clamd_mod.conf ../virus_scan.conf "${pkgdir}"/etc/c-icap/
}
