# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-objection
pkgver=1.11.0
pkgrel=1
_commit=e7eb1d9b769edf6a98870c75a6d2a6123b7346fd
pkgdesc="Runtime mobile exploration"
arch=('any')
url='https://github.com/sensepost/objection'
license=('GPL3')
depends=(
  'python-click'
  'python-delegator'
  'python-flask'
  'python-frida>=14.0.0'
  'python-frida-tools>=6.0.0'
  'python-prompt_toolkit>=3.0.3'
  'python-prompt_toolkit<4.0.0'
  'python-pygments'
  'python-requests'
  'python-semver>=2'
  'python-semver<3'
  'python-tabulate'
  'litecli')
makedepends=('git' 'npm' 'python-setuptools')
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('0087A89D911FACE7A2AC31B5AE1F25096C0CB06B')

prepare() {
  cd "$pkgname"
  sed -i "/packages=find/c\packages=find_packages(exclude=('tests*',))," setup.py
}

build() {
  cd "$pkgname"

  ## MUST build agent.js first before calling setup.py
  ## otherwise it will not install in package()
  pushd agent
  npm ci --cache "$srcdir/npm-cache"
  npm run build
  popd

  python setup.py build
}

check() {
  cd "$pkgname"
  python -m unittest
}

package() {
  cd "$pkgname"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
