# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_name=ethtool
pkgname=python-ethtool
pkgver=0.15
pkgrel=4
pkgdesc='Python bindings for the ethtool kernel interface.'
arch=('x86_64')
url="https://github.com/fedora-python/python-ethtool"
license=('GPL')
depends=('python' 'libnl')
makedepends=('asciidoc' 'libnl' 'python-setuptools')
checkdepends=('net-tools' 'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('6789dbbefcde4881a6adad194cd01586c5dad8aecc5c89c368109d96acfed96e994df6050a37ab0c575ca4266d0aeb62ec7008679a7c68fae5f8f8f91978ffa5')
b2sums=('dd2fd2c7abf07f0a5fb32dfce7bf34f7a8e6300000250447fb56f0dfcd467509c5a8c86860f54650ec08ce4360bd56bd08fcbb2b70c06b13115d7416f4e3d230')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
  a2x -d manpage -f manpage "man/pethtool.8.asciidoc"
  a2x -d manpage -f manpage "man/pifconfig.8.asciidoc"
}

check() {
  cd "${_name}-${pkgver}"
  local _py3_ver=$(python --version | cut -d " " -f2)
  export PYTHONPATH="build/lib.linux-$CARCH-cpython-$(echo ${_py3_ver%"."*} | sed 's/\.//'):${PYTHONPATH}"
  pytest -v
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --root="${pkgdir}"

  install -t "${pkgdir}/usr/share/man/man8" \
    -vDm 644 man/{pethtool,pifconfig}.8
}
