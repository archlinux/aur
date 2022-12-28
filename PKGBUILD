# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-pysmf
pkgver=0.1.1
pkgrel=1
pkgdesc='Python module for reading & writing Standard MIDI Files'
arch=('x86_64')
url='https://das.nasophon.de/pysmf/'
license=('custom:BSD') # some form of 2-clause BSD
depends=('python' 'libsmf')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'cython'
)
checkdepends=('python-pytest')
_commit='84806d212c98f56563eacffb472d4114d2ad42a1'
source=(
  "$pkgname::git+https://github.com/dsacre/pysmf#commit=$_commit"
  'update-pytest-references.patch'
)
sha512sums=('SKIP'
            '475231e66e77472418571a585c99f4c347d50a4c29f33c3fe5fbe6ab5602b3ea86ec237fc0454a54b8e70304c3726256e4d267ed024fa987bb8b3034c0686142')
b2sums=('SKIP'
        '3eb8d25197e68a352819bdef8a57abe17312c5cc938c61bc9a31cc1064949b036eff314e4a21d50daf81a7749a4424ed7371e7fbaab32eed46ef348ddbc7ee73')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # update deprecated references to pytest
  patch -p1 -i "$srcdir/update-pytest-references.patch"

  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')

  PYTHONPATH="build/lib.linux-$CARCH-cpython-$python_version:$PYTHONPATH" pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" NEWS README
  cp -vr examples "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
