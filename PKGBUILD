# Maintainer:  jyantis <yantis@yantis.net>
# Maintainer:  Matthew McGinn <mamcgi@gmail.com>

pkgname=geeknote-improved-git
pkgver=2.0.17.r833.21cbc2b
pkgrel=1
pkgdesc='Work with Evernote & Yinxiang from the command line. This fork has everything geeknote does and more for example the ability to upload documents. It also has much more active development.'
arch=('any')
url='https://github.com/jeffkowalski/geeknote'
license=('GPL')
depends=(
  'evernote-sdk-python'
  'python2'
  'python2-backports.ssl_match_hostname'
  'python2-beautifulsoup4'
  'python-docker-pycreds'
  'python2-html2text'
  'python2-lxml'
  'python2-markdown2-git'
  'python2-oauth2'
  'python2-proxyenv-git'
  'python2-sqlalchemy'
  'python2-thrift'
)
source=('git+https://github.com/jeffkowalski/geeknote.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
provides=('geeknote' 'geeknote-git')
conflicts=('geeknote' 'geeknote-git')

pkgver() {
  cd geeknote
  set -o pipefail
  _gitversion=$( git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  if [ -f "geeknote/__init__.py" ]; then
      printf "%s.%s" "$(grep -R "__version__ =" geeknote/__init__.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
  else
    printf "%s" $_gitversion
  fi
}

build() {
  cd geeknote
  python2 setup.py build
}

# Tests fail miserably
#check() {
#  cd geeknote
#  python2 setup.py test --verbose
#}

package() {
  cd geeknote

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
