# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=3.8.0
pkgrel=1
pkgdesc="Manipulate DNS records on various DNS providers in a standardized/agnostic way"
arch=('any')
url="https://github.com/AnalogJ/lexicon"
license=('MIT')
depends=('python-beautifulsoup4' 'python-cryptography' 'python-future' 'python-yaml'
         'python-requests' 'python-tldextract')
makedepends=('python-dephell')
optdepends=('python-pynamecheap: for Namecheap support'
            'python-boto3: for Route53 support'
            'python-softlayer: for SoftLayer support'
            'python-xmltodict: for Plesk support'
            'python-localzone: for localzone support'
            'python-zeep: for Gransy support')
            # 'python-oci: for Oracle Cloud Infrastructure (OCI) support'
checkdepends=('python-pytest-runner' 'python-vcrpy' 'python-softlayer' 'python-boto3' 'python-mock'
              'python-pynamecheap' 'python-zeep' 'python-xmltodict' 'python-beautifulsoup4'
              'python-localzone' 'python-html5lib' 'python-dnspython' 'bind-tools')
source=("https://github.com/AnalogJ/lexicon/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a730852550eefd3461fd07c441cea65add2f6c0757a09c7f868da4ccdcd7cd2f1cdca96a652d11eeadab5e6dadceaba1dafc5b1d753efc6c6ec7a2fa2a5f342a')

prepare() {
  cd lexicon-$pkgver

  # poetry-generated setup.py is badly broken in several ways, including
  # distribution of tests in the built package as well as using distutils for
  # bad metadata. See https://github.com/sdispater/poetry/issues/866
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd lexicon-$pkgver
  python setup.py build
}

check() {
  cd lexicon-$pkgver
  python setup.py pytest --addopts '--deselect lexicon/tests/providers/test_transip.py --deselect lexicon/tests/providers/test_oci.py'
}

package() {
  cd lexicon-$pkgver
  python setup.py install -O1 --prefix=/usr --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
