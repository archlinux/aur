# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=pytype
pkgver=2023.01.31
pkgrel=1
pkgdesc='A static type analyzer for Python code'
arch=('x86_64')
url='https://google.github.io/pytype/'
license=('MIT' 'Apache')
depends=(
  'python'
  'python-attrs'
  'python-importlab'
  'python-jinja'
  'python-libcst'
  'python-networkx'
  'ninja'
  'python-pydot'
  'python-tabulate'
  'python-toml'
  'python-typing_extensions'
  'python-typed-ast' # only for <3.8
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'pybind11'
)
_commit='06e3d79110e39ca1c61500719fc8efaabfa4ecfb'
source=(
  "$pkgname::git+https://github.com/google/pytype#commit=$_commit"
  'github.com-python-typeshed::git+https://github.com/python/typeshed'
  'remove-version-constraints.patch'
  'use-system-ninja.patch'
)
b2sums=('SKIP'
        'SKIP'
        '66171ed53b45ef3198c462fdc9689db245a48df327faaa1b62b9eb5cca99febc915010dc4127d7ec7c5a3c2f939a29d5bb7b84f3e32a93510eac57a7843038ec'
        '2180276a2f7ef1be1036ca092243356d039c91f70077527358c76eb00d83c4866417df6a81e32a1dee105bb90c70db29582c1617c9e5b961d75ce846008bf9b1')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # remove version constraints from setup.cfg
  patch -p1 -i "$srcdir/remove-version-constraints.patch"

  # use system ninja
  patch -p1 -i "$srcdir/use-system-ninja.patch"

  # setup git submodules
  # only typeshed - rely on system pybind11
  git submodule init typeshed
  git config submodule.typeshed.url "$srcdir/github.com-python-typeshed"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
