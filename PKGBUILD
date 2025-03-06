# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=3.20.1
pkgrel=1
pkgdesc="Manipulate DNS records on various DNS providers in a standardized/agnostic way"
arch=('any')
url="https://github.com/dns-lexicon/dns-lexicon"
license=('MIT')
depends=(
  'python-beautifulsoup4'
  'python-cryptography'
  'python-yaml'
  'python-requests'
  'python-tldextract'
  'python-importlib-metadata'
  'python-pyotp'
  'python-dnspython'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-hatchling'
)
optdepends=(
  'python-boto3: for Route53 support'
  'python-localzone: for localzone support'
  'python-softlayer: for SoftLayer support'
  'python-zeep: for Gransy support')
  # 'python-oci: for Oracle Cloud Infrastructure (OCI) support'
  # 'python-tencentcloud-sdk-python: for QCloud support'
checkdepends=(
  'python-pytest'
  'python-vcrpy'
  'python-boto3'
  'python-localzone'
  'python-softlayer'
  'python-zeep'
  'bind'
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('1c4d1ea4e500e4579d803fa166ef813e1fbc402886b974231945bb7d5755f02c28c57cf94fdd772f130d9c7a46f591bb4eefeae6187b2b626eb4f8d85845a3a7')
b2sums=('2805c2dbe6192fe7386097cd956bd7c270eb7def432020ef770a4b3855e4c5c05de43841762ebb683f6a4dc8d0afcbd4c80c673df2e568a036d8e9300394769c')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  PYTHONPATH="$PWD/src" pytest --deselect tests/providers/test_oci.py
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
