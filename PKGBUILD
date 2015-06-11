# Maintainer:  jyantis <yantis@yantis.net>

# There is some confusion between this and the community python2-markdown
# That is a different immlementation. From the readme:

# "There is another Python markdown.py. However, at least at the time this
# project was started, markdown2.py was faster (see the Performance Notes)
# and, to my knowledge, more correct (see Testing Notes). That was a while ago
# though, so you shouldn't discount Python-markdown from your consideration."

pkgname=python2-markdown2-git
pkgver=2.3.0.r13.g596d48b
pkgrel=3
pkgdesc='A fast and complete implementation of Markdown in Python 2'
arch=('any')
url='https://github.com/trentm/python-markdown2'
license=('MIT')
depends=('python2')
source=('git+https://github.com/trentm/python-markdown2.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
optdepends=('python2-pygments: testing')

# These are the python2 version even though named wrong
provides=('python2-markdown2')
conflicts=('python2-markdown2')

pkgver() {
  cd python-markdown2
  set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd python-markdown2

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

check() {
  cd python-markdown2
  cd test
  python2 testall.py
}

package() {
  cd python-markdown2

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
