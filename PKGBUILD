# Maintainer: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
# Contributor: angelux/xangelux (xangelux <at> gmail <dot> com)
# Contributor: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=policycoreutils
pkgver=2.3
pkgrel=3
pkgdesc="SELinux policy core utilities"
arch=('i686' 'x86_64')
url='http://userspace.selinuxproject.org'
license=('GPL')
groups=('selinux')
depends=('libsemanage>=2.2' 'libcgroup' 'dbus-glib' 'python2-ipy' 'setools'
         'sepolgen')
optdepends=('hicolor-icon-theme: needed for graphical tools')
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
options=(!emptydirs)
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20140506/${pkgname}-${pkgver}.tar.gz"
        'restorecond.service')
sha256sums=('864cfaee58b5d2f15b140c354e59666e57143293c89f2b2e85bc0d0e4beefcd2'
            '20572c2cc09c8af5239f26cfea3eb2648d87d9927e55791f13572ea2184e857e')

prepare() {
  cd "${pkgname}-${pkgver}"

#  sed -i -e "s/-Werror -Wall -W/-Werror -Wall -W ${CFLAGS}/" setfiles/Makefile
#  sed -i -e "s/-Werror -Wall -W/-Werror -Wall -W ${CFLAGS}/" sestatus/Makefile

  # python2 fix
  sed -i -e "s/shell python -c/shell python2 -c/" semanage/Makefile
  sed -i -e "s/\/usr\/bin\/python/\/usr\/bin\/python2/" sepolicy/Makefile

  # /usr merge fix
  sed -i -e "s/\$(PREFIX)\/sbin/\$(PREFIX)\/bin/g" */Makefile
  sed -i -e "s/\$(DESTDIR)\/sbin/\$(PREFIX)\/bin/g" */Makefile
  sed -i -e "s/\$(PREFIX)\/sbin/\$(PREFIX)\/bin/g" mcstrans/*/Makefile
  sed -i -e "s/\$(DESTDIR)\/sbin/\$(PREFIX)\/bin/g" mcstrans/*/Makefile
}

build() {
  cd "${pkgname}-${pkgver}"

  make PYTHON=python2 LSPP_PRIV=y SEMODULE_PATH="/usr/bin" all
}

package(){
  cd "${pkgname}-${pkgver}"

  make PYTHON=python2 DESTDIR="${pkgdir}" LIBDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib SEMODULE_PATH="/usr/bin" install

  install -Dm644 "${srcdir}"/restorecond.service "${pkgdir}/usr/lib/systemd/system/restorecond.service"

  # Fix python2 scripts
  sed -i -e "s/python -E/python2 -E/" "${pkgdir}/usr/bin/audit2allow"
  sed -i -e "s/python -E/python2 -E/" "${pkgdir}/usr/bin/audit2why"
  sed -i -e "s/python -E/python2 -E/" "${pkgdir}/usr/bin/chcat"
  sed -i -e "s/python -E/python2 -E/" "${pkgdir}/usr/bin/sepolgen"
  sed -i -e "s/python -E/python2 -E/" "${pkgdir}/usr/bin/sepolgen-ifgen"
  sed -i -e "s/python -E/python2 -E/" "${pkgdir}/usr/bin/semanage"
  sed -i -e "s/python -E/python2 -E/" "${pkgdir}/usr/lib/python2.7/site-packages/seobject.py"
}

