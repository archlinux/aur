# Maintainer: Christian Finnberg <christian at finnberg dot net>
# Based on AUR package [marcel](https://aur.archlinux.org/packages/marcel) by Jiri Pospisil

pkgname=marcel-git
_pkgbase=marcel
pkgver=v0.30.0.r0.g17f66cc
pkgrel=1
pkgdesc='A modern shell that accepts Python code and uses Python objects for piping'
url='https://www.marceltheshell.org/'
source=("git+https://github.com/geophile/marcel.git")
arch=('any')
depends=('python' 'python-dill' 'python-psutil')
provides=($_pkgbase)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
conflicts=($_pkgbase)
license=('GPL-3.0-only')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgbase"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgbase"

  rm -rf test
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgbase"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # Force the use of System's Python with Marcel, not the one that can be defined in the user's environment (i.e. with pyenv)
  sed -i "s:^python:/usr/bin/python:" "$pkgdir/usr/bin/marcel"
}
