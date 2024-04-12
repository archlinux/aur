# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=3.17.0
pkgrel=2
pkgdesc="Manipulate DNS records on various DNS providers in a standardized/agnostic way"
arch=('any')
url="https://github.com/AnalogJ/lexicon"
license=('MIT')
depends=('python-beautifulsoup4' 'python-cryptography' 'python-yaml'
         'python-requests' 'python-tldextract' 'python-importlib-metadata'
         'python-pyotp' 'python-dnspython')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
optdepends=('python-boto3: for Route53 support'
            'python-localzone: for localzone support'
            'python-softlayer: for SoftLayer support'
            'python-zeep: for Gransy support')
            # 'python-oci: for Oracle Cloud Infrastructure (OCI) support'
checkdepends=('python-pytest' 'python-vcrpy' 'python-boto3' 'python-localzone' 'python-softlayer'
              'python-zeep' 'bind')
source=("https://github.com/AnalogJ/lexicon/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('1bc182f5881d6acfac72b84331ba50da1219178d274c92e532ed11e73aa79696681d28a002cd1e23f48590953f48e50b62c2ef2db020a07ecf88547717508c0c')

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

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/dns_lexicon-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
