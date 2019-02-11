# Maintainer: Daniel Moch <daniel@danielmoch.com>
_name=nncli
pkgname=nncli-git
pkgver=0.3.2.r14.g5f0d203
pkgrel=1
pkgdesc="NextCloud Notes Command Line Interface"
arch=('any')
url="https://nncli.org"
provides=('nncli')
conflicts=('nncli')
license=('MIT' 'BSD')
depends=('python'
  'python-urwid'
  'python-requests'
  'python-appdirs'
  'python-click')
makedepends=('flit' 'git' 'python-pip' 'python-sphinx' 'python-sphinx-sitemap')
checkdepends=('python-pytest'
              'python-pytest-cov'
              'python-pytest-mock'
              'python-pylint'
              'python-mock')
source=("git+https://git.danielmoch.com/${_name}.git?signed")
validpgpkeys=('72A97F7072DDCE28058DEF30323C9F1784BDDD43')
sha256sums=('SKIP')

pkgver()
{
  cd "${_name}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

check()
{
  cd "${_name}"
  python -m pytest
}

build()
{
  cd "${_name}"
  flit build
  cd "${srcdir}/${_name}/docs"
  sphinx-build -M man source build
}

package()
{
  cd "${_name}"
  _ver=$(cat ${_name}/__init__.py | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+(\.dev[0-9]+)?')
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 docs/build/man/nncli.1 "${pkgdir}/usr/share/man/man1/nncli.1"
  pip install -I --no-warn-script-location --isolated --no-deps --compile --root="${pkgdir}" dist/${_name}-${_ver}-py3-none-any.whl
}

# vim: ft=PKGBUILD sts=2 sw=2 et
