# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Maintainer: Mark Stenglein <aur@markstenglein.com>
# Contributor: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-beets
_name=mopidy_beets
pkgver=5.0.0
pkgrel=1
pkgdesc="Mopidy extension for playing music from a Beets collection"
arch=('any')
url='https://mopidy.com/ext/beets/'
license=('MIT')
depends=(
  'python'
  'mopidy>=4.0.0'
  'python-pykka>=4.1'
  'python-requests>=2.32')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm')
checkdepends=(
  'beets'
  'python-pytest'
  'python-flask'
  'python-responses'
  'python-werkzeug')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'beets-rsrc-path.patch')
sha256sums=('086a5a3904324e881b71611b8d8e5e564b668bb6ee31513df3a755b740fe7d04'
            'bcb8d167719de6e2402fd0607ae547453ef43c2b0392d6029f8e0ec982461dcb')

prepare() {
  cd "$_name-$pkgver"
  # beets >= 2.x test helper expects RSRC as a Path, not bytes
  patch -Np1 -i "$srcdir/beets-rsrc-path.patch"
}

build() {
  cd "$srcdir/$_name-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  local venv="$srcdir/test-env"
  python -m venv --system-site-packages "$venv"
  "$venv/bin/python" -m installer dist/*.whl
  "$venv/bin/python" -m pytest
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
