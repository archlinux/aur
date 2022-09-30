# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Tomislav Ivek <tomislav.ivek@gmail.com>

# shellcheck disable=SC2034
_name="distro"
_pkgbase="python-${_name}"
pkgbase="python2-${_name}"
pkgname=("python2-${_name}")
pkgver=1.6.0
pkgrel=1
pkgdesc='Linux OS platform information API'
url='https://github.com/python-distro/distro'
arch=('any')
license=('Apache')
makedepends=('python-sphinx' 'python2-setuptools')
checkdepends=('python2-pytest')
options=('!makeflags')
source=("${url}/archive/v${pkgver}/${pkgbase}-${pkgver}.tar.gz")
sha512sums=('48cff21ea152ec57c4505a72ffb1af5a138199f10ea908e138d16f48732f602a5b4f8bec2ee76b629981a1625453adf1b6895f4573229002b3b3ff7b76efbede')
b2sums=('558c4b1fcb93882b589375dd719f0f6100e4a78bbe9f167821c1588f82abbe00afd68f22f191f3722f0dd4358d76a6e295c8e69af29fdcd6ba7399d927e96f1c')

prepare() {
  cp -a distro-${pkgver}{,-py2}
}

build() {
  cd "distro-${pkgver}-py2" || exit
  python2 setup.py build
  make man SPHINXBUILD=sphinx-build
}

check() {
  cd "distro-${pkgver}-py2" || exit
  py.test2
}

# shellcheck disable=SC2154
package() {
  depends=('python2' 'python2-setuptools')
  cd "distro-${pkgver}-py2" || exit
  python2 setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgbase}"
  mv "${pkgdir}/usr/bin/distro"{,2}
}

# vim: ts=2 sw=2 et:
