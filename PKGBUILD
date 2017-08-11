# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgbase=selinux-python
pkgname=(selinux-python selinux-python2)
pkgver=2.7
pkgrel=1
pkgdesc="SELinux python tools and libraries"
groups=('selinux')
arch=('i686' 'x86_64')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
makedepends=('python2' 'python' 'python-ipy' 'libsemanage>=2.7' 'setools>=4.0.0')
conflicts=('sepolgen<2.7' 'policycoreutils<2.7')
provides=("sepolgen=${pkgver}-${pkgrel}")
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4217cb965ecda96c91e15ffcc2e7ddd13ecc2bf5631100f3cd072a7616f140ed')

build() {
  cd "${pkgbase}-${pkgver}"
  make PYTHON=/usr/bin/python2
  make PYTHON=/usr/bin/python3
}

package_selinux-python() {
  depends=('python' 'python-ipy' 'libsemanage>=2.7' 'setools>=4.0.0')

  cd "${pkgbase}-${pkgver}"
  make PYTHON=/usr/bin/python3 DESTDIR="${pkgdir}" \
    LIBSEPOLA=/usr/lib/libsepol.a \
    SBINDIR="${pkgdir}/usr/bin" \
    install
  /usr/bin/python3 -m compileall "${pkgdir}/$(/usr/bin/python3 -c 'import site; print(site.getsitepackages()[0])')"
}

package_selinux-python2() {
  depends=('python2' 'libsemanage>=2.7' 'setools>=4.0.0')

  cd "${pkgbase}-${pkgver}"
  # Guide the files which would conflict with selinux-python package into a
  # special directory, which would then be removed
  make PYTHON=/usr/bin/python2 DESTDIR="${pkgdir}" \
    BASHCOMPLETIONDIR="${pkgdir}/removed" \
    BINDIR="${pkgdir}/removed" \
    LIBDIR="${pkgdir}/removed" \
    LIBSEPOLA=/usr/lib/libsepol.a \
    MANDIR="${pkgdir}/removed" \
    SBINDIR="${pkgdir}/removed" \
    SHAREDIR="${pkgdir}/removed" \
    install
  rm -r "${pkgdir}/removed"
  /usr/bin/python2 -m compileall "${pkgdir}/$(/usr/bin/python2 -c 'import site; print(site.getsitepackages()[0])')"
}
