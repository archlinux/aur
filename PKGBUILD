# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=pwndbg-git
pkgver=0.0.0.430.9905d43
pkgrel=1
pkgdesc='Makes debugging with GDB suck less'
url='https://github.com/pwndbg/pwndbg'
arch=('any')
license=('MIT')
depends=('python-capstone' 'python-unicorn' 'python-pycparser' 'python-psutil' 'python-ptrace' 'python-pyelftools' 'python-six')
makedepends=('git')
provides=('pwndbg')
conflicts=('pwndbg')
source=(${pkgname}::git+https://github.com/pwndbg/pwndbg)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" \
    "0.0.0" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  sed '/0L/d' -i ida_script.py
}

build() {
  cd ${pkgname}
  python -m compileall .
  python -O -m compileall .
}

package() {
  cd ${pkgname}
  install -d "${pkgdir}/usr/share/pwndbg"
  cp -r *.py pwndbg __pycache__ "${pkgdir}/usr/share/pwndbg"
  install -Dm 644 README.md FEATURES.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
