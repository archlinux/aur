# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=3.21.1
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
sha512sums=('562b6749d657b8fe0d89f88b06e0c9c1b30462c9818a89cea33cdc72ada72779e47418ae2228835e1e00b0155314808f46d94686d60b50be30107b1b1c595317')
b2sums=('078c73ef67ef17b8e12b399e4519db858ca0e8bc86a130b65cfc4363671024983ae03bb0989418c913558386da3495ce7063912793ed9cf9e8ee077757e45d49')

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
