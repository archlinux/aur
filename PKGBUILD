# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=3.5.2
pkgrel=1
pkgdesc="Manipulate DNS records on various DNS providers in a standardized/agnostic way"
arch=('any')
url="https://github.com/AnalogJ/lexicon"
license=('MIT')
depends=('python-beautifulsoup4' 'python-cryptography' 'python-future' 'python-yaml'
         'python-requests' 'python-tldextract' 'python-setuptools')
makedepends=('python-dephell')
optdepends=('python-pynamecheap: for Namecheap support'
            'python-boto3: for Route53 support'
            'python-softlayer: for SoftLayer support'
            'python-xmltodict: for Plesk support'
            'python-localzone: for localzone support'
            'python-zeep: for Gransy support')
checkdepends=('python-pytest-runner' 'python-vcrpy' 'python-softlayer' 'python-boto3' 'python-mock'
              'python-pynamecheap' 'python-zeep' 'python-xmltodict' 'python-beautifulsoup4'
              'python-localzone' 'python-html5lib' 'python-dnspython' 'bind-tools')
source=("https://github.com/AnalogJ/lexicon/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ba682cb7be854b0623eefa36398cd39c768d3090e23c663008964d9ca9117d85c1958a98dfd87cd09db384a467d3b536f435e59c3ddb50dcc0c63a152f309f03')

prepare() {
  cd lexicon-$pkgver

  # Wait for a proper fix
  sed -i 's/cache_file=TLDEXTRACT_CACHE_FILE, //' lexicon/client.py
  sed -i 's/tldextract = "\^2"/tldextract = ">=2"/' pyproject.toml

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
  python setup.py pytest --addopts '--deselect lexicon/tests/providers/test_transip.py'
}

package() {
  cd lexicon-$pkgver
  python setup.py install -O1 --prefix=/usr --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
