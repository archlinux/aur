# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=3.8.3
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
sha512sums=('3035e9c5d073feb0dd910b79d8de02f2e9bfc81f922bce34ad33c22b583896a781e50f85104799a13133121ab5e88a372667cf0014399df50c5a829747d98073')

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
