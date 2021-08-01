# Maintainer: Eshan Ramesh find me at esrh.sdf.org

pkgname=jrnl-git
_gitname=jrnl
pkgver=v2.8.2.r1.gb23c831d
pkgrel=1
pkgdesc="Collect your thoughts and notes without leaving the command line"
arch=('any')
url="https://jrnl.sh/"
license=('GPL3')
depends=('python' 'python-ansiwrap' 'python-asteval' 'python-colorama' 'python-cryptography' 'python-keyring' 'python-parsedatetime' 'python-dateutil' 'python-pyxdg' 'python-pyaml')
checkdepends=('python-behave' 'python-pytest' 'python-black')
makedepends=('git' 'python-dephell' 'python-setuptools')
conflicts=("jrnl")
source=("git+https://github.com/jrnl-org/jrnl.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "$_gitname"
  behave --no-skipped --format progress

  black setup.py --diff | patch
  black --check --diff .
}

prepare() {
  cd "$_gitname"
  dephell deps convert --from pyproject.toml --to setup.py --envs main
}

build() {
  cd "$_gitname"
  python setup.py build
}

package() {
  cd "$_gitname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

