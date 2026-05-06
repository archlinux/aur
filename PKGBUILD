# Maintainer: insmtr <insmtr@insmtr.cn>

pkgname=p4-utils
pkgver=0.0
pkgrel=1
pkgdesc='Extension to Mininet that makes P4 networks easier to build'
arch=('x86_64')
url='https://github.com/nsg-ethz/p4-utils'
license=('GPL-2.0-only')
depends=(
  'mininet'
  'python-networkx'
  'python-psutil'
  'p4lang-p4c'
)
makedepends=(
  'help2man'
  'python-build'
  'python-fissix'
  'python-installer'
)
optdepends=('frr: FRRouting support for router topologies')
source=("git+https://github.com/nsg-ethz/p4-utils.git#tag=v${pkgver}")
sha256sums=('4fca728f25e69d62e7f47b0d7b95e97f038f31757d405c8a5c7a1d385582015d')
options=('!debug')

prepare() {
  cd "$pkgname"

  python -m fissix -w -n p4utils setup.py
  sed -i "s/PreType\.None/getattr(PreType, 'None')/g" p4utils/utils/runtime_API.py
  sed -i 's/regex ".*\\(p4i\\|p4rt\\)"/regex ".*\\\\(p4i\\\\|p4rt\\\\)"/' p4utils/p4run.py
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation

  cd utils
  cc -Wall -Wextra -DVERSION=\"1.4\" mxexec.c -o mxexec

  help2man -N -n "Mininet namespace execution utility" -h "-h" -v "-v" --no-discard-stderr ./mxexec -o mxexec.1
}

package() {
  cd "$pkgname"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm755 utils/mxexec "${pkgdir}/usr/bin/mxexec"
  install -Dm755 utils/mx "${pkgdir}/usr/bin/mx"
  install -Dm644 utils/mxexec.1 "${pkgdir}/usr/share/man/man1/mxexec.1"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
