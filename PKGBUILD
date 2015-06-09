# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

BUILD_SELINUX=false

pkgname=389-ds-base
pkgver=1.3.3.10
pkgrel=1
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
sha512sums=('bb07f18f8c4f0666d32606feae07b4481f949277ccc92a746fa1128c3dcc0a60af94b0261fb001cadee146bc1492d8a6ba10cbea43ac6474da70af16912197fe')

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
