# Maintainer: Marcel Campello <marcel.campello@prafrentex.com.br>
# Contributor: David Birks <david@birks.dev>

pkgname='aws-cli-v2'
pkgver='2.7.34'
pkgrel='1'

pkgdesc='Unified command line interface for Amazon Web Services (version 2)'
arch=('x86_64')
url='https://github.com/aws/aws-cli/tree/v2'
license=('Apache')

depends=(
  'python-awscrt'
  'python-colorama'
  'python-cryptography'
  'python-distro'
  'python-docutils'
  'python-jmespath'
  'python-prompt_toolkit'
  'python-ruamel-yaml'
  'python-urllib3'
)
makedepends=(
  'python-setuptools'
)

provides=('aws-cli')
conflicts=('aws-cli' 'aws-cli-git' 'aws-cli-v2-bin')

source=("$pkgname-$pkgver.tar.gz::https://github.com/aws/aws-cli/archive/$pkgver.tar.gz")
sha256sums=('09ae8596b582f8750a5947973d3e24d3b62c3349ca28e1582ca9243df73eb208')

build() {
  cd "$srcdir"/aws-cli-$pkgver
  python setup.py build

  echo "Generating auto-complete index. Takes 5-10 minutes..."
  PYTHONPATH=. ./scripts/gen-ac-index --index-location=./ac.index
}

package() {
    cd "$srcdir"/aws-cli-$pkgver
    python setup.py install --root="$pkgdir"

    install -Dm 644 ac.index "$pkgdir"/usr/lib/python3.10/site-packages/awscli/data/ac.index
    install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm 644 bin/aws_bash_completer "$pkgdir"/usr/share/bash-completion/completions/aws
}
