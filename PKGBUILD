# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=ropper-git
pkgname=('ropper-git' 'python-ropper-git' 'python2-ropper-git')
pkgver=1.10.0.432.5f44ac5
pkgrel=1
pkgdesc='Show information about binary files and find gadgets to build rop chains for different architectures'
url='https://github.com/sashs/Ropper'
arch=('any')
license=('GPL2')
makedepends=('git' 'python-setuptools' 'python-capstone' 'python-filebytes' 'python2-setuptools' 'python2-capstone' 'python2-filebytes')
provides=('ropper')
conflicts=('ropper')
source=(${pkgbase}::git+https://github.com/sashs/Ropper)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(python setup.py --version)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cp -ra ${pkgbase}{,-py2}
  sed -r 's|(env python)|\12|' -i ${pkgbase}-py2/sample.py
}

build() {
  (cd ${pkgbase}
    python setup.py build
  )
  (cd ${pkgbase}-py2
    python2 setup.py build
  )
}

check() {
  (cd ${pkgbase}
    python test.py
  )
  (cd ${pkgbase}-py2
    python2 test.py
  )
}

package_ropper-git() {
  depends=('python' "python-ropper>=${pkgver}")
  provides=('ropper')
  conflicts=('ropper')
  optdepends=('python-keystone: assemble command support')
  cd ${pkgbase}
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  rm -r "${pkgdir}/usr/lib"
}

package_python-ropper-git() {
  depends=('python-capstone' 'python-filebytes')
  provides=('python-ropper')
  conflicts=('python-ropper')
  optdepends=('python-keystone: assemble command support')
  cd ${pkgbase}
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm 644 sample.py "${pkgdir}/usr/share/doc/${pkgname}/sample.py"
  rm -r "${pkgdir}/usr/bin"
}

package_python2-ropper-git() {
  depends=('python2-capstone' 'python2-filebytes')
  provides=('python2-ropper')
  conflicts=('python2-ropper')
  optdepends=('python2-keystone: assemble command support')
  cd ${pkgbase}-py2
  python2 setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm 644 sample.py "${pkgdir}/usr/share/doc/${pkgname}/sample.py"
  rm -r "${pkgdir}/usr/bin"
}

# vim: ts=2 sw=2 et:
