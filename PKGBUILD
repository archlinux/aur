# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_name=ethtool
pkgname=python-ethtool
pkgver=0.14
pkgrel=6
pkgdesc='Python bindings for the ethtool kernel interface.'
arch=('x86_64')
url="https://github.com/fedora-python/python-ethtool"
license=('GPL')
depends=('python' 'libnl')
makedepends=('asciidoc' 'libnl' 'python-setuptools')
checkdepends=('net-tools' 'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('1b211527cab50d012312476171897beed0885d5a37e5713e5ac2e9a57fcbf67b8e0983160d0f13da8804b04738f60095bef21ab127651cb87b4f0629bb89ccf7')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
  a2x -d manpage -f manpage "man/pethtool.8.asciidoc"
  a2x -d manpage -f manpage "man/pifconfig.8.asciidoc"
}

# do not run flaky tests:
# https://github.com/fedora-python/python-ethtool/issues/40
check() {
  cd "${_name}-${pkgver}"
  local _py3_ver=$(python --version | cut -d " " -f2)
  export PYTHONPATH="build/lib.linux-$CARCH-${_py3_ver%"."*}:${PYTHONPATH}"
  py.test -k 'not test_etherinfo_objects and not test_get_interface_info_active and not test_get_interface_info_all'
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"

  install -t "${pkgdir}/usr/share/man/man8" \
    -vDm 644 man/{pethtool,pifconfig}.8
}
