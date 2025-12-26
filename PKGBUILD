# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=3.23.2
pkgrel=3
pkgdesc="Manipulate DNS records on various DNS providers in a standardized/agnostic way"
arch=(any)
url="https://github.com/dns-lexicon/dns-lexicon"
license=(MIT)
depends=(
  python-beautifulsoup4
  python-cryptography
  python-yaml
  python-requests
  python-tldextract
  python-importlib-metadata
  python-pyotp
  python-dnspython
)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
)
checkdepends=(
  python-pytest
  python-vcrpy
  python-boto3
  python-localzone
  python-softlayer
  python-zeep
  bind
)
optdepends=(
  'python-boto3: for Route53 support'
  'python-localzone: for localzone support'
  'python-softlayer: for SoftLayer support'
  'python-zeep: for Gransy support')
  # 'python-oci: for Oracle Cloud Infrastructure (OCI) support'
  # 'python-tencentcloud-sdk-python: for QCloud support'
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('2ebf5668926776dccc3928c808b48eb8774e323ed96ffdf3dcf8151343f40c652cd7bd07198a1565ac9c5bf73071a993aebf27ed117459086eedc2daa3715ce1')
b2sums=('30d3fd2d95d5265a7ad3c25849b07c5b7e84a48d44771679fd0ec94d74d451c81643c7ba4fa26bf20089f6db7d7cfc99be8eb60133641276319b1f58f445c06d')

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
