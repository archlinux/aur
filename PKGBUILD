# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: hexchain <i@hexchain.org>
pkgname=python-requirements-parser
_name=${pkgname#python-}
pkgver=0.5.0
pkgrel=2
pkgdesc="A Pip requirements file parser."
arch=('any')
url="https://github.com/davidfischer/requirements-parser"
license=('BSD')
depends=('python-future' 'python-setuptools' 'python-types-setuptools')
makedepends=('python-build' 'python-installer' 'python-poetry')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz") #{,.asc}
sha256sums=('3336f3a3ae23e06d3f0f88595e4052396e3adf91688787f637e5d2ca1a904069')
#validpgpkeys=('301078D634936CEB7FCDF13BF0C9B0ADA737AB60') # David Fischer <djfische@gmail.com>

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license to proper directory
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "${pkgdir}${site_packages}/requirements_parser-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/"

  # Remove duplicate license
  rm "${pkgdir}${site_packages}/LICENSE"

  # Move files to proper directory
  mv "${pkgdir}${site_packages}"/{AUTHORS.rst,README.md} \
    "${pkgdir}${site_packages}/requirements_parser-$pkgver.dist-info/"
}
