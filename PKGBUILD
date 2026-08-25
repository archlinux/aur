# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=oddjob-selinux
_pkg="oddjob"
provides=("${_pkg}")
conflicts=("${_pkg}")
pkgver=0.34.7
pkgrel=3
pkgdesc="A D-Bus service which runs odd jobs on behalf of client applications (with selinux support)"
arch=(i686 x86_64)
url='https://codeberg.org/freeipa/oddjob'
license=(BSD)
depends=(cyrus-sasl dbus krb5 libxml2 openldap pam systemd selinux-usr-libselinux)
backup=(etc/oddjobd.conf.d/oddjobd-introspection.conf
        etc/oddjobd.conf.d/oddjobd-mkhomedir.conf
        etc/oddjobd.conf)
options=(!libtool)
install=${_pkg}.install
source=("${url}/archive/${_pkg}-${pkgver}.tar.gz")
sha512sums=('5a8ab3832e4b4a1c2a233e24b93f1bff47cc034254f81bb33591d44af23f4676f17fa93d4e38be1cafce60688b8b32522db92993cbfbdf768b1d79b8ca79adbc')

_srcdir="${_pkg}"

prepare() {
  cd "${_srcdir}"

  autoreconf -i
}

build() {
  cd "${_srcdir}"

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
  cd "${_srcdir}"
  make DESTDIR="${pkgdir}/" install
}
