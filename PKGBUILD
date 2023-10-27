# Maintainer: xiota / aur.chaotic.cx

_module="climage"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgdesc="Convert images to beautiful ANSI escape codes"
pkgver=0.2.0
pkgrel=1
# https://pypi.org/project/climage
url='https://github.com/pnappa/CLImage'
license=('GPL3')
arch=('any')

depends=(
  'python'
  'python-pillow'
  'python-setuptools' # silence namcap warning

  # AUR
  'python-kdtree'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)

if [ x"$pkgname" == x"$_pkgname" ] ; then
  _pkgsrc="$_module-${pkgver%%.r*}"
  _pkgext="tar.gz"

  # normal package
  source=(
    "$_pkgsrc.$_pkgext"::"https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_pkgsrc.$_pkgext"
  )
  sha256sums=(
    '9cb97697279294faeacd5fcfd38c84ca29a53daf8fb6aca49f59b024cb0c2c08'
  )

  pkgver() {
    echo "${pkgver%%.r*}"
  }
else
  # git package
  makedepends+=('git')

  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
fi

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="${pkgdir:?}" dist/*.whl
}
