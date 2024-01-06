# Maintainer: Mark Wagie <mark at proton dot me>
pkgname=python-libsass
_name=${pkgname#python-}
pkgver=0.23.0
pkgrel=1
pkgdesc="Sass for Python: A straightforward binding of libsass for Python."
arch=('x86_64' 'aarch64')
url="https://sass.github.io/libsass-python/"
license=('MIT')
depends=('libsass' 'python-setuptools')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
#makedepends+=('python-sphinx')  # needed for docs
provides=('_sass.abi3.so')
checkdepends=('python-pip' 'python-pytest' 'python-werkzeug')
_commit=af3c4bf4ab0b852447fc2b2f46001e499c615011  # tags/0.23.0^0
source=("git+https://github.com/sass/libsass-python.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$_name-python"
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "$_name-python"
  export SYSTEM_SASS="1"
  python -m build --wheel --no-isolation

#  pushd docs
  # There are differences between Python's naming of architectures and the
  # ${CARCH} variable. We need to ask Python for the platform name
#  local PLATFORM=$(python -c "import sysconfig; print(sysconfig.get_platform())")
#  export PYTHONPATH=$(echo ../build/lib.${PLATFORM}-*)
#  make man
#  popd
}

check() {
  cd "$_name-python"
  local PLATFORM=$(python -c "import sysconfig; print(sysconfig.get_platform())")
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  export PYTHONPATH=build/lib.${PLATFORM}-cpython-${python_version//./}
  pytest sasstests.py
}

package() {
  cd "$_name-python"
  export SYSTEM_SASS="1"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  # We don't want to install tests
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm "${pkgdir}${site_packages}/sasstests.py" \
    "${pkgdir}${site_packages}"/__pycache__/sasstests.*.pyc
}
