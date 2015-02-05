# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
# Contributor: angelux/xangelux (xangelux <at> gmail <dot> com)

pkgname=policycoreutils
pkgver=2.4
pkgrel=1
pkgdesc="SELinux policy core utilities"
arch=('i686' 'x86_64')
url='http://userspace.selinuxproject.org'
license=('GPL')
groups=('selinux')
depends=('libsemanage>=2.4' 'libcgroup' 'dbus-glib' 'pam-selinux' 'python2-ipy'
         'setools' 'sepolgen')
optdepends=('hicolor-icon-theme: needed for graphical tools')
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
options=(!emptydirs)
install=policycoreutils.install
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20150202/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b819f876f12473783ccce9f63b9a79cd77177477cd6d46818441f808cc4c3479')

prepare() {
  cd "${pkgname}-${pkgver}"

#  sed -i -e "s/-Werror -Wall -W/-Werror -Wall -W ${CFLAGS}/" setfiles/Makefile
#  sed -i -e "s/-Werror -Wall -W/-Werror -Wall -W ${CFLAGS}/" sestatus/Makefile

  # /usr merge fix
  sed -i -e "s/\$(PREFIX)\/sbin/\$(PREFIX)\/bin/g" */Makefile
  sed -i -e "s/\$(DESTDIR)\/sbin/\$(PREFIX)\/bin/g" */Makefile
  sed -i -e "s/\$(PREFIX)\/sbin/\$(PREFIX)\/bin/g" mcstrans/*/Makefile
  sed -i -e "s/\$(DESTDIR)\/sbin/\$(PREFIX)\/bin/g" mcstrans/*/Makefile

  # Fix Python2 scripts
  sed -i -e "s/python -E/python2 -E/" audit2allow/audit2allow
  sed -i -e "s/python -E/python2 -E/" audit2allow/audit2why
  sed -i -e "s/python -E/python2 -E/" audit2allow/sepolgen-ifgen
  sed -i -e "s/python -E/python2 -E/" gui/polgengui.py
  sed -i -e "s/python -E/python2 -E/" gui/system-config-selinux.py
  sed -i -e "s/python -E/python2 -E/" mcstrans/share/util/mlscolor-test
  sed -i -e "s/python -E/python2 -E/" mcstrans/share/util/mlstrans-test
  sed -i -e "s/python -E/python2 -E/" sandbox/sandbox
  sed -i -e "s/python -E/python2 -E/" sandbox/start
  sed -i -e "s/python -E/python2 -E/" scripts/chcat
  sed -i -e "s/python -E/python2 -E/" semanage/semanage
  sed -i -e "s/python -E/python2 -E/" semanage/seobject.py
  sed -i -e "s/python -E/python2 -E/" sepolicy/sepolicy/booleans.py
  sed -i -e "s/python -E/python2 -E/" sepolicy/sepolicy/communicate.py
  sed -i -e "s/python -E/python2 -E/" sepolicy/sepolicy/generate.py
  sed -i -e "s/python -E/python2 -E/" sepolicy/sepolicy/gui.py
  sed -i -e "s/python -E/python2 -E/" sepolicy/sepolicy/interface.py
  sed -i -e "s/python -E/python2 -E/" sepolicy/sepolicy/manpage.py
  sed -i -e "s/python -E/python2 -E/" sepolicy/sepolicy/network.py
  sed -i -e "s/python -E/python2 -E/" sepolicy/sepolicy.py
  sed -i -e "s/python -E/python2 -E/" sepolicy/sepolicy/transition.py
  sed -i -e "s|/usr/bin/python|/usr/bin/python2|" sepolicy/sepolicy/__init__.py
  sed -i -e "s|/usr/bin/python|/usr/bin/python2|" sepolicy/selinux_server.py
}

build() {
  cd "${pkgname}-${pkgver}"

  make PYTHON=python2 LSPP_PRIV=y SEMODULE_PATH="/usr/bin" all
}

package(){
  cd "${pkgname}-${pkgver}"

  make PYTHON=python2 DESTDIR="${pkgdir}" LIBDIR="${pkgdir}"/usr/lib \
    LIBEXECDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib SEMODULE_PATH="/usr/bin" install

  # Remove init script
  rm -rf "${pkgdir}/etc/rc.d"
}

