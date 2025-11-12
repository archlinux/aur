# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=3.22.0
pkgrel=1
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
sha512sums=('6ec6624128e8371f353ee0c23b17ef8550452b3f4108ad675fb0babbb22d33a87591f0b5fbd59da7ddb0e765676539d17a7fc369e6357eff7d70578976550805')
b2sums=('cddd10aac9b45eead2a85f2e0960aa019d3357f85182a48d06bf3ca04bb0cde822de91b2928bb86dbc6039587e342b6ea658eb745af3b3fe8b53ce8ff876300c')

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
