# Maintainer:  Javier Torres <javitonino [at] gmail [dot] com>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

BUILD_SELINUX=false
BUILD_RUST=false

pkgname=389-ds-base
pkgver=1.4.1.6
pkgrel=1
pkgdesc="389 Directory Server (base)"
arch=(i686 x86_64)
url="http://port389.org/"
license=(GPL)
depends=(cyrus-sasl cyrus-sasl-gssapi icu lm_sensors net-snmp libsystemd
         openldap libevent nss pcre pam python)
makedepends=(doxygen rsync)
conflicts=(svrcore)
provides=(svrcore)
optdepends=('python-lib389: Python managemnt scripts'
            'python2-lib389: Python2 version')

if [[ "${BUILD_SELINUX}" = "true" ]]; then
  depends+=(selinux-usr-policycoreutils)
fi
if [[ "${BUILD_RUST}" = "true" ]]; then
  depends+=(rust)
fi

backup=(etc/default/dirsrv
        etc/default/dirsrv.systemd
        etc/dirsrv/config/certmap.conf
        etc/dirsrv/config/ldap-agent.conf
        etc/dirsrv/config/slapd-collations.conf
        etc/dirsrv/config/template-initconfig)
options=(!libtool)
source=("https://releases.pagure.org/389-ds-base/${pkgname}-${pkgver}.tar.bz2"
				'nss.patch')
sha512sums=('0a943453cbcd8b43b4fdc58563c8802d9270d9a3cf4dcd76e3f77168d45e84b8e07d8df8ddadb09ba9294e7ba7e9304ce329bc37edeb16a9161797c902fadc1c'
            'b34c7125176481791d71cf98a78cc6dbaa658b8398ad7bdd48944612b6078307aee2acbb065011098d21672fd504191f207711e36399edc35b49af9aede64337')

prepare() {
  cd "${pkgname}-${pkgver}"
	#patch -p1 < ../nss.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  local selinux=""
  if [[ "${BUILD_SELINUX}" = "true" ]]; then
    selinux="--with-selinux"
  fi

  local rust=""
  if [[ "${BUILD_RUST}" = "true" ]]; then
    rust="--with-rust"
  fi

  if [[ "${CARCH}" = "x86_64" ]]; then
    export USE_64=1
  fi

  ./autogen.sh

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
		--libexecdir=/usr/lib/${pkgname} \
    --with-tmpfiles-d=/usr/lib/tmpfiles.d \
    --with-systemd \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-systemdsystemconfdir=/etc/systemd/system \
    --enable-autobind \
    --with-openldap \
    ${rust} \
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

	sed -i "s/libexec/lib\/${pkgname}/g" "${pkgdir}/usr/lib/systemd/system/dirsrv@.service"

  install -dm755 "${pkgdir}"/var/log/${pkgname}/ \
                 "${pkgdir}"/var/lib/${pkgname}/

  find "${pkgdir}" -type f -name '*.a' -delete
}

# vim: set ts=2 sw=2 ft=sh noet:
