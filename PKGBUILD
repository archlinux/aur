# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=pwndbg-git
pkgver=2026.02.18.r1.g5eb91f4
pkgrel=1
pkgdesc='Makes debugging with GDB suck less'
url='https://github.com/pwndbg/pwndbg'
arch=(any)
license=(MIT)
depends=(
  debuginfod
  gdb
  ipython
  python
  python-capstone
  python-capstone6pwndbg
  python-niche-elf
  python-psutil
  python-pt
  python-ptrace
  python-pwntools
  python-pycparser
  python-pyelftools
  python-pygments
  python-requests
  python-rich
  python-setuptools
  python-sortedcontainers
  python-tabulate
  python-typing_extensions
  python-unicorn
  # TODO:
  # decomp2dbg
  which
)
makedepends=(
  git
  python-build
  python-hatchling
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
  'one_gadget: command to find ROP one_gadget'
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

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
