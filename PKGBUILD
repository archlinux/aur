# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=3.18.0
pkgrel=2
pkgdesc="Manipulate DNS records on various DNS providers in a standardized/agnostic way"
arch=('any')
url="https://github.com/AnalogJ/lexicon"
license=('MIT')
depends=('python-beautifulsoup4' 'python-cryptography' 'python-yaml'
         'python-requests' 'python-tldextract' 'python-importlib-metadata'
         'python-pyotp' 'python-dnspython')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
optdepends=('python-boto3: for Route53 support'
            'python-localzone: for localzone support'
            'python-softlayer: for SoftLayer support'
            'python-zeep: for Gransy support')
            # 'python-oci: for Oracle Cloud Infrastructure (OCI) support'
            # 'python-tencentcloud-sdk-python: for QCloud support'
checkdepends=('python-pytest' 'python-vcrpy' 'python-boto3' 'python-localzone' 'python-softlayer'
              'python-zeep' 'bind')
source=("git+https://github.com/AnalogJ/lexicon.git#tag=v$pkgver")
sha512sums=('ae6b17bfb8e9a7b6391f4b4b13381caf3324d052990e49136d8567c5e81ed43f79c4bfc964bfc3eda37bd000be3958ded345d617f9f5d54041bd8ba9cf9e0e2a')

build() {
  cd lexicon
  python -m build --wheel --no-isolation
}

check() {
  cd lexicon
  PYTHONPATH="$PWD/src" pytest --deselect tests/providers/test_oci.py
}

package() {
  cd lexicon
  python -m installer --destdir="$pkgdir" dist/*.whl

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/dns_lexicon-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
