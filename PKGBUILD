# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-html2text-git
pkgver=r400.80a0b93
pkgrel=2
pkgdesc='Python 2 package that converts a page of HTML into clean, easy-to-read plain ASCII text. Better yet, that ASCII also happens to be valid Markdown (a text-to-HTML format)'
arch=('any')
url='http://alir3z4.github.io/html2text'
license=('GPL3')
depends=('python2' 'python2-setuptools')
source=('git+https://github.com/Alir3z4/html2text.git')
sha256sums=('SKIP')
makedepends=('git')
conflicts=('python2-html2text')
provides=('python2-html2text')

pkgver() {
  cd html2text
  set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd html2text

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

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

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Remove html2text binary since it conflicts with the community package html2text
  # and the other python versions of this package
  rm "$pkgdir/usr/bin/html2text"
  rmdir "$pkgdir/usr/bin"

}

# vim:set ts=2 sw=2 et:
