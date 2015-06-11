# Maintainer:  jyantis <yantis@yantis.net>

# Note: the primary use of this package is with aws-cli
# If you are having problems with aws-cli try aws-cli-git and this package
# as aws-cli wasn't working with python-botocore after yesterdays update

pkgname=python-botocore-git
pkgver=1.0.0b1.r1885.61b194d
pkgrel=2
pkgdesc='A low-level interface to a growing number of Amazon Web Services (AWS). This package is the foundation for AWS-CLI'
arch=('any')
url='https://github.com/boto/botocore'
license=('custom')
depends=('python'
         'python-six>=1.1.0'
         'python-tox>=1.4'
         'python-sphinx>=1.1.3'
         'python-dateutil>=2.1'
         'python-nose>=1.3.0'
         'python-mock>=1.0.1'
         'python-jmespath'
        )
source=('git+https://github.com/boto/botocore.git')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
provides=('python-botocore')
conflicts=('python-botocore')

pkgver() {
  cd botocore
  printf "%s." "$(grep "__version__ =" botocore/__init__.py | awk -F\' '{print $2}')"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd botocore
  python setup.py build
}

check() {
  cd botocore
  python setup.py test --verbose
}

package() {
  cd botocore

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
