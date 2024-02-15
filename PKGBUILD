# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=pwndbg-git
pkgver=2023.07.17.pkgs.r117.ge8f423a
pkgrel=1
pkgdesc='Makes debugging with GDB suck less'
url='https://github.com/pwndbg/pwndbg'
arch=('any')
license=('MIT')
depends=(
  debuginfod
  gdb
  python
  python-capstone
  python-psutil
  python-pt
  python-ptrace
  python-pwntools
  python-pycparser
  python-pyelftools
  python-pygments
  python-requests
  python-setuptools
  python-tabulate
  python-typing_extensions
  python-unicorn
  which
)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
optdepends=(
  'checksec: checksec command support'
  'ropper: ropper command support'
  'ropgadget: ropgadget command support'
  'radare2: radare2 command support'
  'rizin: rizin command support'
)
provides=(pwndbg)
conflicts=(pwndbg)
source=(${pkgname}::git+https://github.com/pwndbg/pwndbg)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}
  rm -rf caps profiling
}

build() {
  cd ${pkgname}
  python -m compileall *.py
  python -O -m compileall *.py
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -d "${pkgdir}/usr/share/pwndbg"
  cp -r *.py __pycache__ "${pkgdir}/usr/share/pwndbg"
  touch "${pkgdir}/usr/share/pwndbg/.skip-venv"

  install -Dm 644 README.md FEATURES.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
