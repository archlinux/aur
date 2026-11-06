# Python package author: Thomas Wucher <thomas.wucher@gtd-gmbh.de>
pkgname=elf-checker
pkgver=2.0.0
pkgrel=2
pkgdesc="A tool to visualize and check where ELF sections are located in different types of binaries"
arch=(any)
url="https://pypi.org/project/elf-checker"
license=(MPL-2.0)
makedepends=("python" "python-pip" "python-pytest")
depends=("python" "python-pyelftools" "python-rich")
source=("https://files.pythonhosted.org/packages/source/e/elf-checker/elf_checker-$pkgver.tar.gz")
sha256sums=('c25963d3aa8469fd5a691ed09a07febc4bf4828fcfe317786d0a091b11fad7c9')

build() {
  pip install --no-deps --target="$srcdir/$pkgname" $pkgname==$pkgver
}

check() {
  # The wheel carries no test files, so the suite runs from the source archive,
  # which is where its artifacts are named relative to the working directory.
  # There is no module of the package next to the tests, so the import reaches
  # the tree that build() installed, which python -m pytest would hide. The
  # options of the release ask for the coverage plugin, so they are dropped.
  cd "$srcdir/elf_checker-$pkgver"
  PYTHONPATH="$srcdir/$pkgname" pytest -o addopts="" -q test
}

package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r "$srcdir/$pkgname"/* $pkgdir/"$sitepackages"
  mkdir -p $pkgdir/usr/bin
  ln -s $sitepackages/bin/$pkgname $pkgdir/usr/bin/$pkgname
}
