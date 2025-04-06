# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-acme
pkgver=3.3.0
pkgrel=2
pkgdesc='ACME protocol implementation in Python'
arch=('any')
license=('Apache-2.0')
url='https://github.com/certbot/certbot'
depends=(
  'python'
  'python-cryptography'
  'python-josepy'
  'python-pyopenssl'
  'python-pyrfc3339'
  'python-pytz'
  'python-requests'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-sphinx'
  'python-sphinx_rtd_theme'
)
checkdepends=('python-pytest')
# git repository is used because certbot is a huge monorepo and it's easier to
# share the entire repository across all certbot related packages than a few
# hundred tarballs.
_repo="github.com-certbot-certbot"
source=(
  "$_repo::git+https://github.com/certbot/certbot#tag=v$pkgver"
  'dd876a40-minus-changelog.patch'
)
sha512sums=('893a291ee08ce75d1690d2b1c8622977b02345483e5828a4605c34feb5d3da94e1872f53b2e28bf8dea07044bab9af9b3751e815ae89bc2641be309569384e1a'
            '72fa6bea1fb02f3ee6fa61785360e1f02f20671b4310909cbc44a0f6016b12e1e1099fbeb6c8d90e27b2d1784f6c3866d06f800c120159636eba96a0f9ce3ccb')
b2sums=('d8d5ef1244e23705224d7642001356266cee802c9f82f828b1807b8ffa1656596a97467e1db5cd1e520b09dc6c9ef6c21bd86ed4c7cf4582bb7f96dfebc4fb6f'
        '519459ff02dd805ae202ff3e3462d10ee5efabb6f0945621f6b55abaff7aca3337db87b3bef99c66d07a38f4f89a498e32f3d1f7375f1afaae32077077bc8373')

prepare() {
  cd "$_repo/acme"

  # nuke setuptools from orbit ^W install_requires
  sed \
    -e '/setuptools>=/d' \
    -i setup.py

  # backport fix for josepy/cryptography/pyopenssl
  cd ..
  patch -p1 -i "$srcdir/dd876a40-minus-changelog.patch"
}

build() {
  cd "$_repo/acme"

  python -m build --wheel --no-isolation

  # create man page
  make -C docs man
}

check() {
  cd "$_repo/acme"

  python -m pytest
}

package() {
  cd "$_repo/acme"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # man pages
  install -vDm644 -t "$pkgdir/usr/share/man/man1" docs/_build/man/*.1
}
