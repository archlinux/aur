# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
# Contributor: angelux/xangelux (xangelux <at> gmail <dot> com)

pkgname=policycoreutils
pkgver=2.6
pkgrel=1
pkgdesc="SELinux policy core utilities"
arch=('i686' 'x86_64')
url='http://userspace.selinuxproject.org'
license=('GPL')
groups=('selinux')
makedepends=('python2')
depends=('libsemanage>=2.6' 'libcgroup' 'dbus-glib' 'pam-selinux' 'python-ipy' 'sepolgen' 'setools>=4.0.0')
optdepends=('hicolor-icon-theme: needed for graphical tools'
            'pygtk: for system-config-selinux'
            'gnome-python: for system-config-selinux')
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
options=(!emptydirs)
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014/${pkgname}-${pkgver}.tar.gz"
        '0001-policycoreutils-gui-fix-system-config-selinux-editin.patch'
        '0002-policycoreutils-semodule_package-do-not-fail-with-an.patch'
        '0003-Sandbox-Use-next-over-the-sepolicy.info-result.patch'
        '0004-policycoreutils-Make-sepolicy-work-with-python3.patch')
sha256sums=('68891b376f5048edc53c6ccb2fca44da3dc7f4563f4b6894e201d70c04a05a29'
            '8e4b724fbad1ef4004592d0e9fe9e43452f227c0fb7aa9867f5999e5838327ab'
            'a67b7f3a489821097a6be3de1014fd9b651bf26e4a21488314adc683be451996'
            'ccb3fef4754a49ecece7cf743e56b89c87335a06692ef108545d42de8c7ead37'
            'c7bd581c9a62f57aa37433ad7f6544ee224edc97a341e0abd4350aa12a1f2648')

prepare() {
  cd "${pkgname}-${pkgver}"

  # system-config-selinux uses Python 2 because of pygtk
  sed -i -e "s/python -E/python2 -E/" gui/system-config-selinux.py

  # Backport some commits
  patch -Np2 -i '../0001-policycoreutils-gui-fix-system-config-selinux-editin.patch'
  patch -Np2 -i '../0002-policycoreutils-semodule_package-do-not-fail-with-an.patch'
  patch -Np2 -i '../0003-Sandbox-Use-next-over-the-sepolicy.info-result.patch'
  patch -Np2 -i '../0004-policycoreutils-Make-sepolicy-work-with-python3.patch'
}

build() {
  cd "${pkgname}-${pkgver}"

  make PYTHON=python LSPP_PRIV=y all
}

package(){
  cd "${pkgname}-${pkgver}"

  make PYTHON=python2 DESTDIR="${pkgdir}" \
    LIBDIR="${pkgdir}/usr/lib" \
    LIBEXECDIR="${pkgdir}/usr/lib" \
    SBINDIR="${pkgdir}/usr/bin" \
    SHLIBDIR="${pkgdir}/usr/lib" \
    USRSBINDIR="${pkgdir}/usr/bin" \
    install
  make PYTHON=python DESTDIR="${pkgdir}" \
    LIBDIR="${pkgdir}/usr/lib" \
    LIBEXECDIR="${pkgdir}/usr/lib" \
    SBINDIR="${pkgdir}/usr/bin" \
    SHLIBDIR="${pkgdir}/usr/lib" \
    USRSBINDIR="${pkgdir}/usr/bin" \
    install

  # Compile Python files into bytecode
  python2 -m compileall "${pkgdir}/$(python2 -c 'import site; print(site.getsitepackages()[0])')"
  python3 -m compileall "${pkgdir}/$(python3 -c 'import site; print(site.getsitepackages()[0])')"
  python2 -m compileall "${pkgdir}/usr/share/system-config-selinux"

  # Remove restorecond init script
  rm -rf "${pkgdir}/etc/rc.d"
}
