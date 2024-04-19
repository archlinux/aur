# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Contributor: Eric Anderson <ejona86@gmail.com>

pkgname=python-cliapp-fiw
_gitpkgname="${pkgname%-fiw}"
pkgver=1.20180812.1
pkgrel=2
pkgdesc='Python framework for Unix-like command line programs'
arch=('any')
url='https://blog.liw.fi/posts/cliapp/'
license=('GPL-2.0-only')
depends=('python' 'python-yaml')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'python-pyxdg: to honor XDG_CONFIG_HOME for configuration files'
)
conflicts=('python-cliapp') # unrelated package
options=('!debug' '!strip')

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::http://git.liw.fi/cliapp/snapshot/cliapp-${pkgver}.tar.gz"
)

sha512sums=(
  '61b6f36abb3eefb1c52752e8eb1048c1629c86aa269fcac9c5ee4d875031a040c9c3824131f953dc9bfe568e9e99202750c2e8c11791afe3fce1c1872ce2510d'
)

prepare() {
  cd "cliapp-${pkgver}"
  echo 'global-exclude *_tests.py' > MANIFEST.in
}

build() {
  cd "cliapp-${pkgver}"

  # Build wheel from sdist so it honors MANIFEST.in, which prevents
  # tests from ending up inside the wheel
  python -m build --no-isolation
}

check() {
  cd "cliapp-${pkgver}"
  python -m unittest cliapp/*_tests.py
}

package() {
  cd "cliapp-${pkgver}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging examples'
  install -D -m 644 -t "${pkgdir}/usr/share/${pkgname}/examples" example*.py

  echo >&2 'Packaging the license'
  install -D -m 644 COPYING \
    "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING

  echo >&2 'Packaging the README'
  install -D -m 644 README \
    "${pkgdir}"/usr/share/doc/${pkgname}/README
}
