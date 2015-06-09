# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# Enable SELinux support?
build_selinux=false

pkgname=oddjob
pkgver=0.33
pkgrel=1
pkgdesc="A D-Bus service which runs odd jobs on behalf of client applications"
arch=(i686 x86_64)
url="http://www.fedorahosted.org/oddjob"
license=(BSD)
depends=(cyrus-sasl dbus krb5 libxml2 openldap pam python2 systemd)

if [[ "${build_selinux}" == "true" ]]; then
  depends+=(selinux-usr-libselinux)
fi

backup=(etc/oddjobd.conf.d/oddjobd-introspection.conf
        etc/oddjobd.conf.d/oddjobd-mkhomedir.conf
        etc/oddjobd.conf)
options=(!libtool)
install=${pkgname}.install
source=("http://fedorahosted.org/released/oddjob/oddjob-${pkgver}.tar.gz")
sha512sums=('1cc8f071b54fa88f92880c08051189e0e5c57583e0c1ae4e64f6cc2942b0d3e705e11856b02ee848ef9ac9bcd92709cadc53c68cb0e45d4e99500ad1002b1d52')

if [[ "${build_selinux}" == "false" ]]; then
  source+=(0001_Remove_SELinux_support.patch)
  sha512sums+=('025e28ac5fb3991909c629d2dbf67a38bd4497cef422034c4d17938c5e3420bdeeae9c4a207c65c17cd47b803934021cf685bb426da17352cc44563283550d18')
fi

build() {
  cd "${pkgname}-${pkgver}"

  SELINUX_OPTIONS=""
  if [[ "${build_selinux}" == "true" ]]; then
    SELINUX_OPTIONS="--with-selinux-acls --with-selinux-labels"
  else
    patch -p1 -i ../0001_Remove_SELinux_support.patch
    aclocal --force --install
    autoreconf -vfi
  fi

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/${pkgname} \
    --disable-static \
    --enable-pie \
    --enable-now \
    ${SELINUX_OPTIONS} \
    --without-python \
    `# --enable-xml-docs` \
    `# --enable-compat-dtd` \
    --enable-systemd \
    --disable-sysvinit

  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
