# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-ovh
pkgver=5.2.0
pkgrel=1
pkgdesc='OVH DNS Authenticator plugin for Certbot'
arch=('any')
license=('Apache-2.0')
url='https://pypi.python.org/pypi/certbot-dns-ovh'
depends=(
  "certbot=$pkgver"
  "python-acme=$pkgver"
  'dns-lexicon'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
# git repository is used because certbot is a huge monorepo and it's easier to
# share the entire repository across all certbot related packages than a few
# hundred tarballs.
_repo='github.com-certbot-certbot'
source=("$_repo::git+https://github.com/certbot/certbot#tag=v$pkgver")
sha512sums=('9914dfcf0e6e0fc53e893ecba2d4c207c2b53cde45660122e2106cfa511d0073a1262bafeb81e17b9a73a3a96faa01c73f4ceb2b6810f381eb496ed18a2103e6')
b2sums=('153ec236ddd387ad4751015273249df3b43bc2dbdcb66c0196163facff2a137df3b72fac2c5390ae69811932341d451778c0976b889f576dc47b75bc30c31a54')

build() {
  cd "$_repo/$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_repo/$pkgname"

  # https://github.com/certbot/certbot/issues/9606
  pytest -v -W ignore::DeprecationWarning
}

package() {
  cd "$_repo/$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
