# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# Enable SELinux support?
build_selinux=false

pkgname=oddjob
pkgver=0.34.7
pkgrel=1
pkgdesc="A D-Bus service which runs odd jobs on behalf of client applications"
arch=(i686 x86_64)
url="https://releases.pagure.org/oddjob/"
license=(BSD)
depends=(cyrus-sasl dbus krb5 libxml2 openldap pam python systemd)
makedepends=(libselinux)

if [[ "${build_selinux}" == "true" ]]; then
  depends+=(selinux-usr-libselinux)
fi

backup=(etc/oddjobd.conf.d/oddjobd-introspection.conf
        etc/oddjobd.conf.d/oddjobd-mkhomedir.conf
        etc/oddjobd.conf
        0001_Remove_SELinux_support.patch)
options=(!libtool)
install=${pkgname}.install
source=("https://pagure.io/oddjob/archive/${pkgname}-${pkgver}/${pkgname}-${pkgname}-${pkgver}.tar.gz")
sha512sums=('f7a29058bee063d88ae69e1256dd8a8db152fb6a79790780ea661fd4cd4f82385470dc9015419aa47a7bccd4f5673e68c07471cbc3c00586e5a3d1b175a09b99')

build() {
  cd "${pkgname}-${pkgname}-${pkgver}"

  SELINUX_OPTIONS=""
  if [[ "${build_selinux}" == "true" ]]; then
    SELINUX_OPTIONS="--with-selinux-acls --with-selinux-labels"
  else
    #patch -p1 -i ../0001_Remove_SELinux_support.patch
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
  cd "${pkgname}-${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
