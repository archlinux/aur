# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python38-cfn-lint
# https://github.com/aws-cloudformation/cfn-lint/blob/main/CHANGELOG.md
pkgver=0.68.1
pkgrel=1
pkgdesc='CloudFormation Linter'
arch=(any)
url='https://github.com/aws-cloudformation/cfn-lint'
license=('custom:MIT No Attribution')
depends=(python3.8 python-yaml python-aws-sam-translator
         python38-jsonpatch python38-jsonschema python38-networkx
         python-junit-xml python-jschema-to-python python-sarif-om)
makedepends=(python38-setuptools)
checkdepends=(python38-pytest python38-pydot)
optdepends=(
  'python38-pydot: for building graphs from templates'
)
source=("https://github.com/aws-cloudformation/cfn-lint/archive/v$pkgver/cfn-lint-$pkgver.tar.gz")
sha256sums=('f684d2831def3fb91712e5b3ac404e5a9faf73c1e97c6cfe8a03899618c2d7cd')

build() {
  cd cfn-lint-$pkgver
  python3.8 setup.py build
}

check() {
  cd cfn-lint-$pkgver

  # Tests in test/integration need the cfn-lint binary
  python3.8 setup.py install_scripts --install-dir="$srcdir"/tmp_install

  export PYTHONPATH="$PWD/src"
  export PATH="$PATH:$srcdir/tmp_install"
  # test_update_docs requires cfn-lint as a git repo
  pytest test -k 'not test_update_docs'
}

package() {
  cd cfn-lint-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
