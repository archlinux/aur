# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-hipsterplot' 'python2-hipsterplot')
pkgver=0.1
pkgrel=2
pkgdesc="ASCII plotting, because matplotlib is too mainstream"
arch=('any')
url='https://github.com/imh/hipsterplot'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('aba3c68d5d4ae4d08fc44badbe716968405b15d1442b03555028e0c20135428a')

prepare() {
  _dir=$srcdir/hipsterplot-$pkgver # Extracted source tarball directory

  # Creates a standalone license file, slicing the module source from the
  # license name up to the first empty line and removing the comment prefix
  sed -n '/MIT/,/^\s*$/s/^#\s\?//p' "$_dir/hipsterplot.py" > LICENSE

  # A copy for each Python version at "$srcdir/$pkgname"
  cp -a "$_dir" "$srcdir/${pkgname[0]}"
  mv "$_dir" "$srcdir/${pkgname[1]}"

  # Updates the shebang in Python scripts for Python 2
  find "$srcdir"/python2* -name "*.py" -exec sed -i 1s/python/python2/ '{}' \;
}

_package='package_{py}-hipsterplot() {
  depends=({py})
  cd "$srcdir/$pkgname"
  ./setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}'
for _py in python python2 ; do eval "${_package//\{py\}/$_py}" ; done
