# Maintainer: Callum Parsey <callum@neoninteger.au>
# Contributor: Laszlo Papp <lpapp@kde.org>

# TODO: The package is called `adduser-deb` for historical reasons. Merging it
# into `adduser-debian` would simplify the logic involved in pulling and
# extracting the upstream archives, but would require adding `replaces` and
# `conflicts` directives. Neither is ideal.
pkgname=adduser-deb
_pkgname=adduser-debian
pkgver=3.131
pkgrel=1
pkgdesc="Debian's 'adduser' and 'deluser' commands for creating and removing users"
arch=('any')
url="https://salsa.debian.org/debian/adduser"
license=('GPL2')
# TODO: Aren't `shadow` and `perl` also dependencies?
depends=('gawk')
# TODO: Manage configuration files
# TODO: ...changelog? Do other Arch packages actually use this?
source=("https://salsa.debian.org/debian/adduser/-/archive/debian/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('3ce6de32bce048d12429d9431b36d8437c1934266475b6a9f5235b3dff54f918')

# TODO: Run tests, but only in isolation from main system
# TODO: Should include `copyright` file from repository for attribution info
# TODO: Should include manpages/`README` from repository
# TODO: What about `adduser.local`? What even is that?
# TODO: Locale/translation files should also be included
package() {
  install -D -m755 ${_pkgname}-${pkgver}/adduser "${pkgdir}/usr/bin/adduser"
  install -D -m755 ${_pkgname}-${pkgver}/deluser "${pkgdir}/usr/bin/deluser"
  ln -s adduser "${pkgdir}/usr/bin/addgroup"
  ln -s deluser "${pkgdir}/usr/bin/delgroup"
  # TODO: Do the policies defined in these files match Arch policy? Do I need
  # to develop any patches for them?
  install -D -m755 ${_pkgname}-${pkgver}/adduser.conf "${pkgdir}/etc/adduser.conf"
  install -D -m755 ${_pkgname}-${pkgver}/deluser.conf "${pkgdir}/etc/deluser.conf"
  install -D -m755 ${_pkgname}-${pkgver}/AdduserCommon.pm "${pkgdir}/usr/share/perl5/vendor_perl/Debian/AdduserCommon.pm"
  # TODO: Patching should be done in `prepare()` step
  sed -i "s/'-w',$gecos_work/'-p',$gecos_work/" ${pkgdir}/usr/bin/adduser
  sed -i "s/'-r', $gecos_room/'-o', $gecos_room/" ${pkgdir}/usr/bin/adduser
}
