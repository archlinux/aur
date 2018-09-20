# Maintainer: Amish <contact at via dot aur>
pkgname=c-icap-modules
pkgver=0.5.2
pkgrel=2
pkgdesc='Modules for C-ICAP server'
depends=('c-icap' 'clamav')
arch=(i686 x86_64)
url='http://c-icap.sourceforge.net/'
license=('GPL' 'LGPL')
source=("http://downloads.sourceforge.net/project/c-icap/c-icap-modules/0.5.x/c_icap_modules-${pkgver}.tar.gz")
sha256sums=('640290d47a285cc88317890f20b0d431f7e55c751bd9897c59a72ed4522ac779')
backup=('etc/c-icap/clamav_mod.conf'
        'etc/c-icap/clamd_mod.conf'
        'etc/c-icap/virus_scan.conf'
        'etc/c-icap/vscan-local.conf'
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

  # use clamd by default
  sed -i -e '/^#\s*virus_scan.PassOnError\s/ a virus_scan.PassOnError on' \
      -e 's/^virus_scan.MaxObjectSize\s.*/virus_scan.MaxObjectSize 10M/g' \
      -e '/^#\s*virus_scan.DefaultEngine\s/ a virus_scan.DefaultEngine clamd' \
      -e 's/^#Include\s*clamd_mod.conf/Include clamd_mod.conf/g' \
      -e '$ a Include vscan-local.conf' \
      "${pkgdir}"/etc/c-icap/virus_scan.conf{,.default}

  sed -i -e '/^#\s*clamd_mod.ClamdSocket\s/ a clamd_mod.ClamdSocket /run/clamav/clamd.ctl' \
      "${pkgdir}"/etc/c-icap/clamd_mod.conf{,.default}

  # enable logging
  cat > "${pkgdir}"/etc/c-icap/vscan-local.conf << 'EOF'
LogFormat myVScanFmt "%tl, %>a %is %Ib %Ob %huo [Action: %{virus_scan:action}Sa] [Virus: %{virus_scan:virus}Sa] [User: %{X-Client-Username}>ih]"
acl VSCAN service virus_scan
acl VFOUND icap_resp_header{X-Infection-Found} /Type=0/
AccessLog /var/log/c-icap/vscan.log myVScanFmt VSCAN VFOUND
EOF
}
