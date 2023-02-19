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
arch=("any")
url="https://salsa.debian.org/debian/adduser"
license=("GPL2")
# TODO: Aren't `shadow` and `perl` also dependencies?
depends=("gawk")
backup=("etc/adduser.conf" "etc/deluser.conf")
source=("https://salsa.debian.org/debian/adduser/-/archive/debian/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "arch-policy.patch")
sha256sums=("3ce6de32bce048d12429d9431b36d8437c1934266475b6a9f5235b3dff54f918"
            "82600db78ad765623226839061e23f34e1f199bc63c16e731dce0f00829d33f1")

# Arch's UID/GID policy differs a little from Debian's. I've included a patch
# which issues the necessary changes to both the template configuration files
# as well as the scripts themselves. These changes include the following:
# * Automatically chosen system user/group IDs start at 500 instead of 100
# * Automatically chosen regular user/group IDs end at 60000 instead of 59999
# Sources: useradd(8) and /etc/login.defs
# TODO: Patch the manpages as well
# TODO: Improve user name regex. According to useradd(8) Arch allows uppercase
# characters, underscores and numbers in the first character (but not dashes)
# and additionally has an overall character limit of 32 characters. None of
# this is currently checked.
# TODO: That covers all of the policy differences I've noticed, but there may
# be more that I didn't notice.
prepare() {
  patch -Np0 -d . -i arch-policy.patch
}

# TODO: Run tests, but only in isolation from main system
# TODO: Should include `copyright` file from repository for attribution info
# TODO: Should include manpages/`README` from repository
# TODO: What about `adduser.local`? What even is that?
# TODO: Locale/translation files should also be included
package() {
  cd ${_pkgname}-${pkgver}

  install -Dm755 adduser "${pkgdir}/usr/bin/adduser"
  install -Dm755 deluser "${pkgdir}/usr/bin/deluser"
  ln -s adduser "${pkgdir}/usr/bin/addgroup"
  ln -s deluser "${pkgdir}/usr/bin/delgroup"

  install -Dm755 adduser.conf "${pkgdir}/etc/adduser.conf"
  install -Dm755 deluser.conf "${pkgdir}/etc/deluser.conf"
  install -Dm755 AdduserCommon.pm "${pkgdir}/usr/share/perl5/vendor_perl/Debian/AdduserCommon.pm"
}
