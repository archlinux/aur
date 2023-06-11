# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=pwndbg-git
pkgver=2022.12.19.r206.g79ade42
pkgrel=2
pkgdesc='Makes debugging with GDB suck less'
url='https://github.com/pwndbg/pwndbg'
arch=('any')
license=('MIT')
depends=(
  'gdb'
  'debuginfod'
  'python'
  'python-capstone'
  'python-unicorn'
  'python-pycparser'
  'python-psutil'
  'python-ptrace'
  'python-tabulate'
  'python-pwntools'
  'python-pyelftools'
  'python-pygments'
  'python-requests'
  'python-typing_extensions'
  'which'
)
optdepends=('checksec: checksec command support'
            'ropper: ropper command support'
            'ropgadget: ropgadget command support'
            'radare2: radare2 command support')
makedepends=('git')
provides=('pwndbg')
conflicts=('pwndbg')
source=(${pkgname}::git+https://github.com/pwndbg/pwndbg)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
