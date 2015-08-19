# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

BUILD_SELINUX=false

pkgname=389-ds-base
pkgver=1.3.4.1
pkgrel=2
pkgdesc="389 Directory Server (base)"
arch=(i686 x86_64)
url="http://port389.org/"
license=(GPL)
depends=(db cyrus-sasl cyrus-sasl-gssapi icu lm_sensors net-snmp nspr nss
         openldap openssl pcre perl-mozldap perl-netaddr-ip perl-socket svrcore
         tcp_wrappers zlib)
if [[ "${BUILD_SELINUX}" = "true" ]]; then
  depends+=(selinux-usr-policycoreutils)
fi
backup=(etc/default/dirsrv
        etc/default/dirsrv.systemd
        etc/dirsrv/config/certmap.conf
        etc/dirsrv/config/ldap-agent.conf
        etc/dirsrv/config/slapd-collations.conf
        etc/dirsrv/config/template-initconfig)
options=(!libtool)
install=${pkgname}.install
source=("http://www.port389.org/binaries/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('fb160600338d8ed2fe6f0ad0c724ad208347fb684981ce5839b57b1b3d2c42664fa2e803e826f1b1178a881dc0bf557a2c6e5a729e0208a0bb3ede571781bdbf')

build() {
  cd "${pkgname}-${pkgver}"

  local selinux=""
  if [[ "${BUILD_SELINUX}" = "true" ]]; then
    selinux="--with-selinux"
  fi

  if [[ "${CARCH}" = "x86_64" ]]; then
    export USE_64=1
  fi

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --with-tmpfiles-d=/usr/lib/tmpfiles.d \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-systemdsystemconfdir=/etc/systemd/system \
    --with-systemdgroupname=${pkgname}.target \
    --enable-autobind \
    --with-openldap \
    ${selinux} \
    #--disable-static

  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make -j1 DESTDIR="${pkgdir}/" install

  install -dm755 "${pkgdir}"/var/log/${pkgname}/ \
                 "${pkgdir}"/var/lib/${pkgname}/ \
                 "${pkgdir}"/etc/systemd/system/${pkgname}.target.wants

  find "${pkgdir}" -type f -name '*.a' -delete
}
