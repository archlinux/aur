# Maintainer: Alex Brinister <alex_brinister at yahoo dot com>

pkgbase=python-cheetah3-git
_pkgbase=${pkgbase%-git}
pkgname=('python-cheetah3-git' 'python-cheetah3-docs-git')
pkgver=3.3.1.r4.g4948522
pkgrel=1
pkgdesc='A Python powered template engine and code generator'
arch=('x86_64')
url="https://cheetahtemplate.org"
license=('MIT' 'custom:Public') # manpage released by Debian in public domain
makedepends=('git' 'python' 'python-setuptools' 'python-sphinx')
checkdepends=('python-markdown' 'python-pygments')
optdepends=(
  'python-markdown: for markdown filter'
  'python-pygments: for codehighlight filter'
)
conflicts=("${_pkgbase}")
source=(
  "${pkgbase}::git+https://github.com/CheetahTemplate3/${_pkgbase##python-}.git"
  'cheetah.1'     
)
b2sums=('SKIP'
        '59c0689df18640aea8e671cd267741d1bff4b3954147a34ac71c67ec8399c08460976ecabdce7c7b866bd895c8963b6f03059e496eb7dfa2710d99deba78503d')

pkgver() {
  cd "${pkgbase}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgbase}"
  python setup.py build

  # generate documentation
  PYTHONPATH="$PWD:$PYTHONPATH" make -C docs html
}

check() {
  cd "${pkgbase}"

  export PYTHONPATH="$PWD:$PYTHONPATH"
  export PATH="$PWD/bin:$PATH"
  python Cheetah/Tests/Test.py
}

package_python-cheetah3-git() {
  depends=('python')
  optdepends=(
    'python-markdown: for markdown filter'
    'python-memcache: for caching'
    'python-pygments: for code highlight filter'
    'python-cheetah3-docs: documentation'
  )

  cd "${pkgbase}"
  python setup.py install --root="${pkgdir}" --optimize=1

  # man pages
  install -vDm644 -t "${pkgdir}/usr/share/man/man1" "${srcdir}/cheetah.1"
  ln -sf cheetah.1.gz "${pkgdir}/usr/share/man/man1/cheetah-compile.1.gz"
  ln -sf cheetah.1.gz "${pkgdir}/usr/share/man/man1/cheetah-analyze.1.gz"

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-cheetah3-docs-git() {
  pkgdesc+=' (documentation)'

  cd "${pkgbase}"
  
  # documentation
  install -vDm644 -t "${pkgdir}/usr/share/doc/${pkgbase}" README.rst
  cp -vr docs/_build/html "${pkgdir}/usr/share/doc/${pkgbase}"

  # license
  install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
