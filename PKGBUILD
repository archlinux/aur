# Maintainer:
# Contributor: quellen <lodgerz@gmail.com>

_pkgname="amitools"
pkgname="$_pkgname"
pkgver=0.7.0
pkgrel=4
pkgdesc="Various tools for using AmigaOS programs on other platforms"
arch=('i686' 'x86_64')
url="https://github.com/cnvogelg/amitools"
license=('GPL')

depends=(
  'glibc'
  'python'
  'python-lhafile'
)
makedepends=(
  'cython'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)

if [ x"$_pkgname" == x"$pkgname" ] ; then
  # normal package
  _pkgsrc="$_pkgname-$pkgver"
  _module="amitools"

  url="https://pypi.org/project/amitools"

  source+=(
    "$_pkgname-$pkgver.tar.gz"::"https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
  )
  sha256sums+=(
    '0a5b6a1a15c317cf7542c467dc7c8e3240f06ace320a597d25793a34c1e8c492'
  )
else
  # x-git package
  _pkgsrc="$_pkgname"

  makedepends+=('git')

  provides+=("$_pkgname")
  conflicts+=(${provides[@]})

  source+=("$_pkgname"::"git+$url")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$srcdir/$_pkgsrc"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g; s/^v//'
  }
fi

build() {
  cd "$srcdir/$_pkgsrc"
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
} 
