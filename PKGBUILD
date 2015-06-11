# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-html2text-git
pkgver=r400.80a0b93
pkgrel=2
pkgdesc='Python 3 package that converts a page of HTML into clean, easy-to-read plain ASCII text. Better yet, that ASCII also happens to be valid Markdown (a text-to-HTML format)'
arch=('any')
url='http://alir3z4.github.io/html2text'
license=('GPL3')
depends=('python' 'python-setuptools')
source=('git+https://github.com/Alir3z4/html2text.git')
sha256sums=('SKIP')
conflicts=('python-html2text')
provides=('python-html2text')
makedepends=('git')

pkgver() {
  cd html2text
  set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd html2text

  python2 setup.py build
}

check() {
   cd html2text
   python2 setup.py test --verbose
}

package() {
  cd html2text

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Remove html2text binary since it conflicts with the community package html2text
  # and the other python versions of this package
  rm "$pkgdir/usr/bin/html2text"
  rmdir "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
