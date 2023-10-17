# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=3.14.1
pkgrel=1
pkgdesc="Manipulate DNS records on various DNS providers in a standardized/agnostic way"
arch=('any')
url="https://github.com/AnalogJ/lexicon"
license=('MIT')
depends=('python-beautifulsoup4' 'python-cryptography' 'python-yaml'
         'python-requests' 'python-tldextract' 'python-importlib-metadata')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
optdepends=('python-boto3: for Route53 support'
            'python-localzone: for localzone support'
            'python-softlayer: for SoftLayer support'
            'python-zeep: for Gransy support'
            'python-dnspython: for DDNS/DuckDNS support')
            # 'python-oci: for Oracle Cloud Infrastructure (OCI) support'
checkdepends=('python-pytest' 'python-vcrpy' 'python-boto3' 'python-localzone' 'python-softlayer'
              'python-zeep' 'python-dnspython' 'bind')
source=("https://github.com/AnalogJ/lexicon/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('13e4c5b046cad28e487b246b7c16a3ee71b2dbca4c40e513b234cee62e483e7702ce293c11ef96b245409229a7cd3a39c1771ebfc7b2430cd5b017d33e32a924')

build() {
  cd lexicon-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd lexicon-$pkgver
  PYTHONPATH="$PWD/src" pytest --deselect tests/providers/test_oci.py
}

package() {
  cd lexicon-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
