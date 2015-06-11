# Maintainer:  jyantis <yantis@yantis.net>

# There is some confusion between this and the community python-markdown
# That is a different immlementation. From the readme:

# "There is another Python markdown.py. However, at least at the time this
# project was started, markdown2.py was faster (see the Performance Notes)
# and, to my knowledge, more correct (see Testing Notes). That was a while ago
# though, so you shouldn't discount Python-markdown from your consideration."

pkgname=python-markdown2-git
pkgver=2.3.0.r13.g596d48b
pkgrel=1
pkgdesc='A fast and complete implementation of Markdown in Python 3'
arch=('any')
url='https://github.com/trentm/python-markdown2'
license=('MIT')
depends=('python' 'python-setuptools')
source=('git+https://github.com/trentm/python-markdown2.git')
sha256sums=('SKIP')
makedepends=('git')
optdepends=('python-pygments: testing')
provides=('python-markdown2')
conflicts=('python-markdown2')

pkgver() {
  cd python-markdown2
  set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd python-markdown2
  python setup.py build
}

# Tests fail under python 3 as it has some python 3 code
# check() {
#  cd python-markdown2
#  cd test
#  python testall.py
#}

package() {
  cd python-markdown2

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Conflicts happen because of the /usr/bin/markdown2 file if someone installs both the python2 and 3 packages
  # Since there are multiple versions of python2 and no other python3 versions
  # lets rename the python3 version to markdown3
  mv "${pkgdir}/usr/bin/markdown2" "${pkgdir}/usr/bin/markdown3"
}

# vim:set ts=2 sw=2 et:
