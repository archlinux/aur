# Maintainer:  Javier Torres <javitonino [at] gmail [dot] com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

BUILD_SELINUX=false

pkgname=389-ds-base
pkgver=1.3.5.4
pkgrel=1
pkgdesc="389 Directory Server (base)"
arch=(i686 x86_64)
url="http://port389.org/"
license=(GPL)
depends=(db cyrus-sasl cyrus-sasl-gssapi icu lm_sensors net-snmp nspr nss
         openldap openssl pcre perl-mozldap perl-netaddr-ip perl-socket 'svrcore>=4.1.2'
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
source=("http://www.port389.org/binaries/${pkgname}-${pkgver}.tar.bz2"
        "pkg-config.patch")
sha512sums=('0cf3a1e403bc6d417525f908263d59689bbee1db887c5ba552fdae28252a59c37ee8e47ec29c48eb18fc1384652b94667f5768df87602f4c37b86d7ef0df284e'
            'd20a7387c509983fa68ff22d5cd363e41d3c91ebd9232921edcc6c4b61a960a2cfd85e6f76152c39abf6a3c75f1617b8e94492fe2fdc3538038bd14c05bbac75')

build() {
  cd "${pkgname}-${pkgver}"

  local selinux=""
  if [[ "${BUILD_SELINUX}" = "true" ]]; then
    selinux="--with-selinux"
  fi

  if [[ "${CARCH}" = "x86_64" ]]; then
    export USE_64=1
  fi

  patch -p1 < "${srcdir}/pkg-config.patch"
  autoreconf

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --with-tmpfiles-d=/usr/lib/tmpfiles.d \
    --with-systemd \
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
