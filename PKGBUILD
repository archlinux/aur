# Python package author: Thomas Wucher <thomas.wucher@gtd-gmbh.de>
pkgname=occtre
pkgver=1.0.0
pkgrel=2
pkgdesc="A tool for producing and collecting test coverage on assembler level"
arch=(any)
url="https://pypi.org/project/occtre"
license=(MPL-2.0)
makedepends=("python" "python-pip" "python-pytest" "python-pytest-mock" "binutils")
depends=("python" "python-tomlkit" "python-tabulate" "python-dataclass-binder")
source=("https://files.pythonhosted.org/packages/source/o/occtre/occtre-$pkgver.tar.gz")
sha256sums=('87edfde9ffbf58cd88fe88cdb81b9f6a9baf061a0f4803dc03a51bd934280a66')

build() {
  pip install --no-deps --target="$srcdir/$pkgname" occtre==$pkgver
}

check() {
  # The wheel carries no test files, so the suite runs from the source archive,
  # which is where its fixtures are. The test directories carry no module of
  # their own, so the import reaches the tree that build() installed, which
  # python -m pytest would hide. The options of the release ask for the coverage
  # plugin, so they are dropped.
  cd "$srcdir/occtre-$pkgver"
  PYTHONPATH="$srcdir/$pkgname" pytest -o addopts="" -q test
}

package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r "$srcdir/$pkgname"/* $pkgdir/"$sitepackages"
  mkdir -p $pkgdir/usr/bin
  ln -s $sitepackages/bin/$pkgname $pkgdir/usr/bin/$pkgname
}
