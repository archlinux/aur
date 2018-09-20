# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgbase=python-ethtool
pkgname=('python-ethtool' 'python2-ethtool')
pkgver=0.14
pkgrel=1
pkgdesc='Python bindings for the ethtool kernel interface.'
arch=('x86_64')
url="https://github.com/fedora-python/python-ethtool"
license=('GPL')
makedepends=('asciidoc' 'libnl' 'python-setuptools' 'python2-setuptools')
checkdepends=('net-tools' 'python-pytest' 'python2-pytest')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/fedora-python/${pkgbase}/archive/v${pkgver}.tar.gz")
sha512sums=('57a3f2d60dd8309192fc858614645d4e7533c90c03113ffc1eeeb810b86eb71b0a80b4eb209d3452c7624c5318a853de50d9d716d41334bf079e6e3e2490fd4b')

build() {
  cd "${pkgbase}-${pkgver}"
  python setup.py build
  a2x -d manpage -f manpage "man/pethtool.8.asciidoc"
  a2x -d manpage -f manpage "man/pifconfig.8.asciidoc"
  python2 setup.py build
  cp -v man/pethtool.8 man/pethtool2.8
  cp -v man/pifconfig.8 man/pifconfig2.8
}

# do not run flaky tests:
# https://github.com/fedora-python/python-ethtool/issues/40
check() {
  cd "${pkgbase}-${pkgver}"
  local _py3_ver=$(python --version | cut -d " " -f2)
  export PYTHONPATH="build/lib.linux-$CARCH-${_py3_ver%"."*}:${PYTHONPATH}"
  py.test -k 'not test_etherinfo_objects \
              and not test_get_interface_info_active \
              and not test_get_interface_info_all'
  export PYTHONPATH="build/lib.linux-$CARCH-2.7:${PYTHONPATH}"
  py.test2 -k 'not test_etherinfo_objects \
               and not test_get_interface_info_active \
               and not test_get_interface_info_all'
#  python setup.py test
#  python2 setup.py test
}

package_python-ethtool() {
  depends=('python' 'libnl')
  cd "${pkgbase}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"

  install -t "${pkgdir}/usr/share/man/man8" \
    -vDm 644 man/{pethtool,pifconfig}.8
}

package_python2-ethtool() {
  depends=('python2' 'libnl')
  cd "${pkgbase}-${pkgver}"
  python2 setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"

  mv -v "${pkgdir}/usr/bin/pethtool" "${pkgdir}/usr/bin/pethtool2"
  mv -v "${pkgdir}/usr/bin/pifconfig" "${pkgdir}/usr/bin/pifconfig2"
  install -t "${pkgdir}/usr/share/man/man8" \
    -vDm 644 man/{pethtool,pifconfig}2.8
}

