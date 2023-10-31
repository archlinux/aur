# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>
# Contributor: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Bailey Fox <bfox200012@gmail.com>
# Contributor: Tony Lambiris <tony@libpcap.net>

_pkgname=meanalyzer
pkgname=${_pkgname}-git
pkgver=1.283.3.r336.r0.g9c6f2a89
pkgrel=1
pkgdesc='Intel Management Engine firmware analysis tool'
arch=('any')
url='https://github.com/platomav/MEAnalyzer'
_branch='master'
license=('custom')
depends=('python-colorama' 'python-crccheck' 'python-pltable')
makedepends=('dos2unix' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s.%s.%s" \
    "$(sed -n 's/.*ME Analyzer v\([0-9]\+\.[0-9]\+\.[0-9]\+\).*/\1/p' MEA.py)" \
    "$(sed -n 's/.*Revision \(r[0-9]\+\).*/\1/p' MEA.dat)" \
    "$(git describe --long --tags | sed 's/.*\([^-]*[0-9]\+-g.*\)/r\1/;s/-/./g')"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  dos2unix MEA.py
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 MEA.dat "${pkgdir}"/usr/lib/${_pkgname}/MEA.dat
  install -Dm644 Huffman.dat "${pkgdir}"/usr/lib/${_pkgname}/Huffman.dat
  install -Dm644 FileTable.dat "${pkgdir}"/usr/lib/${_pkgname}/FileTable.dat
  install -Dm755 MEA.py "${pkgdir}"/usr/lib/${_pkgname}/MEA.py

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/${_pkgname}/README.md

  install -dm755 "${pkgdir}"/usr/bin
  ln -s /usr/lib/${_pkgname}/MEA.py "${pkgdir}"/usr/bin/${_pkgname}
}
