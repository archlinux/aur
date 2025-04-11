# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=3.21.0
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
sha512sums=('515eb37adc4b645b0dc1b2b2ff07566f449169f9e4d09d177686d4bfabe00bfdb077fe19913a2a7b987973bac01d0b9eef0c24acc9e2f5f61a835d3c12a5b0f2')
b2sums=('7ce88d71b0f5a78b2ebaefb29afa48fa638c492cc939c6a5b4fa2d116501497c592b9d521c6de8eb6611d0fbb3ba0811964f64f4b3131bc7f7acef48d81125fe')

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
