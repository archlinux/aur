# Maintainer: Miten <admin@m1ten.me>
# Maintainer: Anton Hvornum <anton@hvornum.se>

_name=archinstall
pkgname=archinstall-git
# pkgver=2.5.4.r1.g9f102a6
pkgrel=1
pkgdesc="Just another guided/automated Arch Linux installer with a twist"
arch=('any')
url="https://github.com/archlinux/$_name"
license=('GPL3')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-sphinx' 'python-build' 'python-installer' 'python-wheel')
provides=('python-archinstall')
conflicts=('python-archinstall')
replaces=('python-archinstall')
source=("git+https://github.com/archlinux/$_name.git")
sha256sums=('SKIP')


pkgver() {
  cd "$_name"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_name

  # Remove symlinks from the package source
  # and move the actual files in before packaging.
  rm -fv $_name/{examples,profiles}
  mv -v examples profiles $_name/
}

build() {
  cd "$_name"

  python -m build --wheel --no-isolation
  PYTHONDONTWRITEBYTECODE=1 make man -C docs
}

package() {
  cd "$_name"

  # We have previously added "--optimize=1", "--skip-build" and "--prefix=/usr" here.
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 docs/_build/man/archinstall.1 -t "${pkgdir}/usr/share/man/man1/"
}
