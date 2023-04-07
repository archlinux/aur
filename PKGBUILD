# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Abdó Roig-Maranges <abdo.roig@gmail.com>

_pkgname=jwcrypto
pkgname=python-$_pkgname
# https://github.com/latchset/jwcrypto/releases
pkgver=1.4.2
# curl https://api.github.com/repos/latchset/jwcrypto/git/ref/tags/v$pkgver | jq -r .object.sha
_tag=65b76952a91a792d234aab529ef5cd5f82258f1c
pkgrel=2
pkgdesc='Python implementation of JWK, JWS, JWE specifications'
arch=(any)
url='https://github.com/latchset/jwcrypto'
license=(LGPL3)
depends=(python python-cryptography python-deprecated)
makedepends=(git python-setuptools)
checkdepends=(python-pytest)
source=("git+$url?signed#tag=$_tag")
sha256sums=('SKIP')
# PyPI sdists for older versions are signed by tiran's key. Since version 1.0,
# PyPI sdists are not signed, and tiran didn't declare transition of the
# signing key for some reason. I temporarily trust simo5's signed git tags as
# the @redhat.com UID in their key has been verified on keys.openpgp.org.
# See https://github.com/latchset/jwcrypto/issues/230 for more details.
validpgpkeys=(
  'BB97AF8BC4E7A5C0D96223D3C788C4C1D4550D45'  # https://github.com/tiran
  '7C7BD146943B206BB645B64594EAD67E004B65AB'  # Simo Sorce <simo@redhat.com>
)

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd $_pkgname
  python setup.py build
}

check() {
  cd $_pkgname
  pytest
}

package() {
  cd $_pkgname
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
