# Maintainer: Amish <contact at via dot aur>
pkgname=c-icap-modules
pkgver=0.3.2
pkgrel=2
pkgdesc='Modules for C-ICAP server'
depends=('c-icap>=0.3.2' 'c-icap<0.4')
arch=(i686 x86_64)
url='http://c-icap.sourceforge.net/'
license=('GPL' 'LGPL')
source=("http://downloads.sourceforge.net/project/c-icap/c-icap-modules/0.3.x/c_icap_modules-${pkgver}.tar.gz"
        'clamd_mod.conf'
        'virus_scan.conf')
sha256sums=('e3472662687cf9fa37a496df31436924326e315920056a404f023ec5e852e239'
            'b3fcab76c3809e220f53b98b87242063dc06be37a6b8db040f01e4cf39d7fd9f'
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
