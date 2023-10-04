# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=3.14.0
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
sha512sums=('1a74694935993a131f6f1d10a4bf541e9efe794c5aa6a8a976b50bb8430bd7b38e587a11b5b1e40a6db6dd1de4bbc6ba8887d61a950921d29802e4b35a64d60f')

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
