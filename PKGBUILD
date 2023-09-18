# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=oddjob-selinux
_pkg="oddjob"
provides=("${_pkg}")
conflicts=("${_pkg}")
pkgver=0.34.7
pkgrel=2
pkgdesc="A D-Bus service which runs odd jobs on behalf of client applications (with selinux support)"
arch=(i686 x86_64)
url='https://pagure.io/oddjob'
license=(BSD)
depends=(cyrus-sasl dbus krb5 libxml2 openldap pam systemd selinux-usr-libselinux)
backup=(etc/oddjobd.conf.d/oddjobd-introspection.conf
        etc/oddjobd.conf.d/oddjobd-mkhomedir.conf
        etc/oddjobd.conf)
options=(!libtool)
install=${_pkg}.install
source=("https://releases.pagure.org/oddjob/${_pkg}-${pkgver}.tar.gz")
sha512sums=('df98f3d2ce18de5d2db6d638995c01c80aec51f7ad979b879b2e8d8f7d6c2e464cbff3c70ed9b528399337f8fba31744f955ca17fdad1d4e9193fb0f10ea391a')

build() {
  cd "${_pkg}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/${_pkg} \
    --disable-static \
    --enable-pie \
    --enable-now \
    --with-selinux-acls --with-selinux-labels \
    --without-python \
    --enable-systemd \
    --disable-sysvinit

  make
}

package() {
  cd "${_pkg}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
