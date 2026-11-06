# Maintainer: Thomas Wucher <thomas.wucher@gtd-gmbh.de>

pkgname=mcdc-checker
pkgver=1.6.0
pkgrel=2
pkgdesc="A tool to check C/C++ source code for non tree-like binary decisions so that its MCDC test coverage can be assessed with GCov"
arch=(any)
url=https://gitlab.com/gtd-gmbh/mcdc-checker/mcdc-checker
license=(MPL-2.0)
makedepends=("python" "python-pip" "python-pytest" "python-deepdiff")
depends=("python>=3.11" "clang>=19.1.0")
source=("https://files.pythonhosted.org/packages/source/m/mcdc-checker/mcdc_checker-$pkgver.tar.gz")
sha256sums=('6e182fef2c7dd3216623faf59832e08adc1c31012bfee2dca427ed57cd52ed01')

build() {
  pip install --no-deps --target="$srcdir/$pkgname" $pkgname==$pkgver
}

check() {
  # The wheel carries no test files, so the suite runs from the source archive,
  # of which its test module is a part, next to the fixture of the analysis that
  # the test names relative to the working directory. The options of the release
  # ask for the coverage plugin, so they are dropped.
  cd "$srcdir/mcdc_checker-$pkgver"
  PYTHONPATH="$srcdir/$pkgname" pytest -o addopts="" -q mcdc_checker/tests
}

package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r "$srcdir/$pkgname"/* $pkgdir/"$sitepackages"
  mkdir -p $pkgdir/usr/bin
  ln -s $sitepackages/bin/$pkgname $pkgdir/usr/bin/$pkgname
}
