# Maintainer: Julian Hornich <julianhornich@googlemail.com>

pkgname=stempel-git
pkgrel=1
pkgver=r232
pkgdesc="Loop Kernel Analysis and Performance Modeling Toolkit"
arch=('i686' 'x86_64')
url="https://github.com/RRZE-HPC/stempel"
license=('GPLv3')
depends=('python'
         'kerncraft-git' )
makedepends=('git')
source=('git+https://github.com/RRZE-HPC/stempel.git')
sha256sums=('SKIP')
provides=('stempel' 'stempel-analysis')

pkgver() {
  cd ${srcdir}/stempel
  echo "r"$(git rev-list --count master)
}

package() {
  cd ${srcdir}/stempel

  # install package
  python setup.py install --root="${pkgdir}"

  # rename analysis binary to avoid clashes
  mv ${pkgdir}/usr/bin/analysis ${pkgdir}/usr/bin/stempel-analysis

  # copy example headers and machine files
  mkdir -p ${pkgdir}/usr/share/${pkgname}
  cp -a ${srcdir}/stempel/stempel/headers ${pkgdir}/usr/share/${pkgname}/
  cp -a ${srcdir}/stempel/stempel/examples/machine-files ${pkgdir}/usr/share/${pkgname}/
  cp -a /usr/share/kerncraft-git/examples/machine-files ${pkgdir}/usr/share/${pkgname}/
  chmod -R 655 ${pkgdir}/usr/share/${pkgname}

  # license
  install -Dm644 ${srcdir}/stempel/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
