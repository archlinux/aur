# Maintainer: Daniel Moch <daniel@danielmoch.com>
_name=nncli
pkgname=nncli-git
pkgver=0.3.1.r0.ge6a26e0
pkgrel=1
pkgdesc="NextCloud Notes Command Line Interface"
arch=('any')
url="https://github.com/djmoch/${_name}"
provides=('nncli')
conflicts=('nncli')
license=('MIT')
depends=('python'
  'python-urwid'
  'python-requests'
  'python-appdirs'
  'python-click')
makedepends=('flit' 'git' 'python-pip' 'python-sphinx')
checkdepends=('python-pytest'
              'python-pytest-cov'
              'python-pytest-mock'
              'python-pylint'
              'python-mock')
source=("git+${url}?signed")
validpgpkeys=('72A97F7072DDCE28058DEF30323C9F1784BDDD43')
sha256sums=('SKIP')

pkgver()
{
  cd "${srcdir}/${_name}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

check()
{
  cd "${srcdir}/${_name}"
  python -m pytest
}

build()
{
  cd "${srcdir}/${_name}"
  flit build
  cd "${srcdir}/${_name}/docs"
  sphinx-build -M man source build
}

package()
{
  cd "${srcdir}/${_name}"
  _ver=$(cat ${_name}/__init__.py | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+(\.dev[0-9]+)?')
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 docs/build/man/nncli.1 "${pkgdir}/usr/share/man/man1/nncli.1"
  pip install -I --no-warn-script-location --isolated --no-deps --compile --root="${pkgdir}" dist/${_name}-${_ver}-py3-none-any.whl
}

# vim: ft=PKGBUILD sts=2 sw=2 et
