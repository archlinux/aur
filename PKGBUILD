# Maintainer: insmtr <insmtr@insmtr.cn>

pkgname=p4-utils-git
_pkgname=${pkgname%-git}
pkgver=r714.83b118b
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
  'python-installer'
)
optdepends=('frr: FRRouting support for router topologies')
conflicts=('pumpkin')
source=("git+https://github.com/nsg-ethz/p4-utils.git")
sha256sums=('SKIP')
options=('!debug')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"

  python -m build --wheel --no-isolation

  cd utils
  cc -Wall -Wextra -DVERSION=\"1.4\" mxexec.c -o mxexec

  help2man -N -n "Mininet namespace execution utility" -h "-h" -v "-v" --no-discard-stderr ./mxexec -o mxexec.1
}

package() {
  cd "$_pkgname"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm755 utils/mxexec "${pkgdir}/usr/bin/mxexec"
  install -Dm755 utils/mx "${pkgdir}/usr/bin/mx"
  install -Dm644 utils/mxexec.1 "${pkgdir}/usr/share/man/man1/mxexec.1"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
