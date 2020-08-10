# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=mini-ndn
_pkgname=mini-ndn
pkgname=${_pkgname}-git
pkgver=v0.4.0.r34.g76dbe66
pkgrel=3
# epoch=
pkgdesc="Lightweight networking emulation tool that enables testing, experimentation, and research on the NDN platform based on Mininet"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('boost' 'ndn-cxx' 'ndn-nfd' 'ndn-chronosync' 'ndn-tools' 'ndn-nlsr' 'ndn-infoedit' 'mininet' 'wireshark-cli' 'python2-setuptools' 'python2-pyndn')
makedepends=('git')
checkdepends=()
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=("git+${url}.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${srcdir}/${_reponame}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_reponame}"
  grep -rIil '#!.*python' . | xargs -n1 sed -i 's:#!/usr/bin/env python:#!/usr/bin/env python2:g'
  grep -rIil '#!.*python' . | xargs -n1 sed -i 's:#!/usr/bin/python:#!/usr/bin/python2:g'
  python2 setup.py build
}

package() {
  install -dm 755 "${pkgdir}/usr/local/etc/mini-ndn/"
  install -dm 755 "${pkgdir}/usr/bin/"

  cd "${srcdir}/${_reponame}" 
  cp topologies/*.conf "${pkgdir}/usr/local/etc/mini-ndn/"
  cp examples/mnndn.py "${pkgdir}/usr/bin/mnndn"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  sed -i "1i#!/usr/bin/env python2" "${pkgdir}/usr/bin/mnndn"
}
