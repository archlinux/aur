# Python package author: Thomas Wucher <thomas.wucher@gtd-gmbh.de>
pkgname=ocgraph
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to visualize object code as control flow graph"
arch=(any)
url="https://pypi.org/project/ocgraph"
license=(MPL-2.0)
makedepends=("python" "python-pip" "python-pytest")
depends=("python" "python-graphviz")
source=("https://files.pythonhosted.org/packages/source/o/ocgraph/ocgraph-$pkgver.tar.gz")
sha256sums=('867b0464e80b8f596bfbae69e07d0ea12967918a0f62d6aa7b6c3b262720c2a7')

build() {
  pip install --no-deps --target="$srcdir/$pkgname" $pkgname==$pkgver
}

check() {
  # The wheel carries no test files, so the suite runs from the source archive,
  # which is where its fixtures are. The test directories carry no module of
  # their own, so the import reaches the tree that build() installed, which
  # python -m pytest would hide. The options of the release ask for the coverage
  # plugin, so they are dropped.
  cd "$srcdir/ocgraph-$pkgver"
  PYTHONPATH="$srcdir/$pkgname" pytest -o addopts="" -q test
  # The module and the entry point run from the tree that the package ships.
  cd "$srcdir/$pkgname"
  PATH="$srcdir/$pkgname/bin:$PATH" python -c "import ocgraph; print('module of the install:', ocgraph.__file__)"
  PATH="$srcdir/$pkgname/bin:$PATH" "$pkgname" --version
}

package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r "$srcdir/$pkgname"/* $pkgdir/"$sitepackages"
  mkdir -p $pkgdir/usr/bin
  ln -s $sitepackages/bin/$pkgname $pkgdir/usr/bin/$pkgname
}
