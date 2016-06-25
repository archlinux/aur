# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-hipsterplot' 'python2-hipsterplot')
pkgver=0.1
pkgrel=1
pkgdesc="ASCII plotting, because matplotlib is too mainstream"
arch=('any')
url='https://github.com/imh/hipsterplot'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('aba3c68d5d4ae4d08fc44badbe716968405b15d1442b03555028e0c20135428a')

prepare() {
  _pkg=${pkgname[0]#*-} # Package name on setup.py (suffix, after 1st hyphen)
  _dir=$srcdir/$_pkg-$pkgver # Extracted source tarball directory

  # Creates a standalone license file, slicing the module source from the
  # license name up to the first empty line and removing the comment prefix
  sed -n '/MIT/,/^\s*$/s/^#\s\?//p' "$_dir/hipsterplot.py" > LICENSE

  # Updates the shebang in Python scripts for Python 2, keeping a different
  # source directory for each Python version, prefixing with $pkgname values
  cp -a "$_dir" "$srcdir/${pkgname[0]}-$pkgver"
  mv "$_dir" "$srcdir/${pkgname[1]}-$pkgver"  
  find "$srcdir"/python2* -name "*.py" -exec sed -i 1s/python/python2/ {} \;
}

# Prints the dependencies whitespace-separated
_depends() {
  _py=${pkgname%%-*} # Python version/executable (prefix, before 1st hyphen)
  echo $_py
}

_install() {
  cd "$pkgname-$pkgver"
  ./setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# To generate .SRCINFO properly, "depends" has to be on each of these
package_python-hipsterplot() { depends=($(_depends)) ; _install ; }
package_python2-hipsterplot() { depends=($(_depends)) ; _install ; }
