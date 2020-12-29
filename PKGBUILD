# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=mini-ndn
_pkgname=mini-ndn
pkgname=${_pkgname}
pkgver=0.5.0
pkgrel=1
# epoch=
pkgdesc="Lightweight networking emulation tool that enables testing, experimentation, and research on the NDN platform based on Mininet"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('ndn-nfd' 'ndn-tools' 'ndn-infoedit' 'mininet' 'wireshark-cli')
makedepends=('boost' 'python2-setuptools')
checkdepends=()
optdepends=('ndn-nlsr: Support for NLSR')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=(https://github.com/named-data/${_reponame}/archive/v${pkgver}.tar.gz)
noextract=()
sha256sums=('df693ed1e889a8d65c2c77f4d2d98c00a6afdde206452465121ab4c7ae207857')
validpgpkeys=()

build() {
  cd "${srcdir}/${_reponame}-${pkgver}"
	# grep -rIil '#!.*python' . | xargs -n1 sed -i 's:#!/usr/bin/env python:#!/usr/bin/env python2:g'
	# grep -rIil '#!.*python' . | xargs -n1 sed -i 's:#!/usr/bin/python:#!/usr/bin/python2:g'
  python setup.py build
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build
  mkdir -p "$pkgdir"/usr/local/etc/mini-ndn
  cp topologies/* "$pkgdir"/usr/local/etc/mini-ndn/
  mkdir -p "$pkgdir"/usr/bin
  cp examples/mnndn.py "$pkgdir"/usr/bin/mnndn
  sed -i "1i#!/usr/bin/env python3" "${pkgdir}/usr/bin/mnndn"
}
