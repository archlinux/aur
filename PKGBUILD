# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=mini-ndn
_pkgname=mini-ndn
pkgname=${_pkgname}-git
pkgver=v0.5.0.r2.gea2d5d6
pkgrel=1
# epoch=
pkgdesc="Lightweight networking emulation tool that enables testing, experimentation, and research on the NDN platform based on Mininet"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('ndn-nfd' 'ndn-tools' 'ndn-infoedit' 'wireshark-cli' 'python-setuptools')
makedepends=('git')
checkdepends=()
optdepends=('ndn-nlsr: Support for NLSR')
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
  # grep -rIil '#!.*python' . | xargs -n1 sed -i 's:#!/usr/bin/env python:#!/usr/bin/env python2:g'
  # grep -rIil '#!.*python' . | xargs -n1 sed -i 's:#!/usr/bin/python:#!/usr/bin/python2:g'
  python setup.py build
}

package() {
  cd "${srcdir}/${_reponame}"
  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build
  mkdir -p "$pkgdir"/usr/local/etc/mini-ndn
  cp -r topologies/* "$pkgdir"/usr/local/etc/mini-ndn/
  mkdir -p "$pkgdir"/usr/bin
  cp examples/mnndn.py "$pkgdir"/usr/bin/mnndn
  sed -i "1i#!/usr/bin/env python3" "${pkgdir}/usr/bin/mnndn"
}
