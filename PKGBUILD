# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgbase=python-ethtool
pkgname=('python-ethtool' 'python2-ethtool')
pkgver=0.13
pkgrel=8
pkgdesc='Python bindings for the ethtool kernel interface.'
arch=('x86_64')
url="https://github.com/fedora-python/python-ethtool"
license=('GPL')
makedepends=('asciidoc' 'libnl' 'python-setuptools' 'python2-setuptools')
checkdepends=('net-tools')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/fedora-python/${pkgbase}/archive/v${pkgver}.tar.gz")
sha512sums=('f7fe0dadae8b163a0116c64b1b3c6897bc7d302d1b764abf26e853342495ab3fefc0558ab08c6081b1cda535c134c7181c08951c96c1cf389ae069acc4c8efab')

prepare(){
  cp -av "${pkgname[0]}-${pkgver}" "${pkgname[1]}-${pkgver}"
}

build() {
  cd "${pkgname[0]}-${pkgver}"
  python setup.py build
  a2x -d manpage -f manpage "man/pethtool.8.asciidoc"
  a2x -d manpage -f manpage "man/pifconfig.8.asciidoc"
  cd ../"${pkgname[1]}-${pkgver}"
  python2 setup.py build
  a2x -v -d manpage -f manpage "man/pethtool.8.asciidoc"
  a2x -v -d manpage -f manpage "man/pifconfig.8.asciidoc"
}

# build without tests for now
# https://github.com/fedora-python/python-ethtool/issues/40
#check() {
#  cd "${pkgname[0]}-${pkgver}"
#  python setup.py test
#  cd ../"${pkgname[1]}-${pkgver}"
#  python2 setup.py test
#}

package_python-ethtool() {
  depends=('python' 'libnl')
  cd "${pkgname[0]}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"

  install -t "${pkgdir}/usr/share/man/man8" \
    -vDm644 man/{pethtool,pifconfig}.8
}

package_python2-ethtool() {
  depends=('python2' 'libnl')
  cd "${pkgname[1]}-${pkgver}"
  python2 setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"

  mv -v "${pkgdir}/usr/bin/pethtool" "${pkgdir}/usr/bin/pethtool2"
  mv -v "${pkgdir}/usr/bin/pifconfig" "${pkgdir}/usr/bin/pifconfig2"
  install -vDm644 man/pethtool.8 "${pkgdir}/usr/share/man/man8/pethtool2.8"
  install -vDm644 man/pifconfig.8 "${pkgdir}/usr/share/man/man8/pifconfig2.8"
}

