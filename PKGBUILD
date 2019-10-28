# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgbase=selinux-python
pkgname=(selinux-python selinux-python2)
pkgver=2.9
pkgrel=1
pkgdesc="SELinux python tools and libraries"
groups=('selinux')
arch=('i686' 'x86_64')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
makedepends=('python2' 'python' 'python-ipy' 'libsemanage>=2.8' 'setools>=4.0.0')
conflicts=('sepolgen<2.7' 'policycoreutils<2.7')
provides=("sepolgen=${pkgver}-${pkgrel}")
source=("https://github.com/SELinuxProject/selinux/releases/download/20190315/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3650b5393b0d1790cac66db00e34f059aa91c23cfe3c2559676594e295d75fde')

build() {
  cd "${pkgbase}-${pkgver}"
  make PYTHON=/usr/bin/python2
  make PYTHON=/usr/bin/python3
}

package_selinux-python() {
  depends=('python' 'python-audit' 'python-ipy' 'libsemanage>=2.8' 'setools>=4.0.0')

  cd "${pkgbase}-${pkgver}"
  make PYTHON=/usr/bin/python3 DESTDIR="${pkgdir}" SBINDIR=/usr/bin install
  /usr/bin/python3 -m compileall "${pkgdir}/$(/usr/bin/python3 -c 'import site; print(site.getsitepackages()[0])')"
}

package_selinux-python2() {
  depends=('python2' 'libsemanage>=2.8' 'setools>=4.0.0')

  cd "${pkgbase}-${pkgver}"

  # Guide the files which would conflict with selinux-python package into a
  # special directory, which would then be removed
  make PYTHON=/usr/bin/python2 DESTDIR="${pkgdir}" \
    BASHCOMPLETIONDIR=/removed \
    BINDIR=/removed \
    LIBDIR=/removed \
    MANDIR=/removed \
    SBINDIR=/removed \
    SHAREDIR=/removed \
    install
  rm -r "${pkgdir}/removed"
  /usr/bin/python2 -m compileall "${pkgdir}/$(/usr/bin/python2 -c 'import site; print(site.getsitepackages()[0])')"
}
