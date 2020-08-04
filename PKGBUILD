# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=3.3.28
pkgrel=2
pkgdesc="Manipulate DNS records on various DNS providers in a standardized/agnostic way"
arch=('any')
url="https://github.com/AnalogJ/lexicon"
license=('MIT')
depends=('python-beautifulsoup4' 'python-cryptography' 'python-future' 'python-setuptools'
         'python-tldextract' 'python-yaml' 'python-zeep'
         # requests[security] Expanded:
         'python-requests' 'python-pyopenssl')
optdepends=('python-pynamecheap: for Namecheap support'
            'python-boto3: for Route53 support'
            'python-softlayer: for SoftLayer support'
            'python-xmltodict: for Plesk support'
            'python-localzone: for localzone support')
checkdepends=('python-pytest-runner' 'python-vcrpy' 'python-softlayer' 'python-boto3' 'python-mock'
              'python-pynamecheap' 'python-zeep' 'python-xmltodict' 'python-beautifulsoup4'
              'python-localzone' 'python-html5lib' 'python-dnspython' 'bind-tools')
source=("https://github.com/AnalogJ/lexicon/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        $pkgname-dependency-fix.patch::https://github.com/AnalogJ/lexicon/commit/f805aa3a660e72040c91bcd734612c37a6493e49.patch)
sha512sums=('17890696d495a5656e994965ea3f0a45debed2ac87a2c5b6ad010a23a795c51fd391ba40842e47c1af1823b4f24693bbfd91ae3fa2f62a94d127c16ce486de45'
            '3370c6896ee5b228c35b9fc2aef20a5006620cc579dcbe2212091ac3960d7240555bb06e2f4da05728a71a27a679609cce28827d4a02131d3cb9c2a4c045d6e0')

prepare() {
  cd lexicon-$pkgver
  # recent commits are quite broken
  patch -p1 -i ../$pkgname-dependency-fix.patch
  sed -i 's/from bs4 import BeautifulSoup/from bs4 import BeautifulSoup, Tag/' lexicon/providers/easyname.py
}

build() {
  cd lexicon-$pkgver
  python setup.py build
}

check() {
  cd lexicon-$pkgver
  python setup.py pytest --addopts '--ignore lexicon/tests/providers/test_transip.py'
}

package() {
  cd lexicon-$pkgver
  python setup.py install -O1 --prefix=/usr --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
