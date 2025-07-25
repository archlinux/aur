# Maintainer: Parhammed <parhammed@gmail.com>
# Contributor: Tuhana GAYRETLİ <aur at tuhana dot me>
# shellcheck disable=SC2034,SC2148,SC2164,SC2154

pkgname=kde-material-you-colors-git
_pkgname=${pkgname%-git}
branch='main'
pkgver=1.10.1.r0.gd4c8998
pkgrel=1
pkgdesc='Automatic Material You Colors generator from your wallpaper for the Plasma Desktop'
arch=(x86_64)
url='https://github.com/luisbocanegra/kde-material-you-colors'
license=(GPL3)
makedepends=(
    'git' 
    'extra-cmake-modules' 
    'python-setuptools' 
    'python-build' 
    'python-installer' 
    'python-wheel' 
    'libplasma'
)
depends=(
    'python'
    'python-dbus' 
    'python-numpy'
    'python-materialyoucolor'
    'plasma5support'
    'python-pillow' 
    'python-pywal16'
)
conflicts=("$_pkgname")
provides=("$_pkgname")
options=(!debug)
source=("$pkgname::git+${url}.git#branch=$branch")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  # backend
  python -m build --wheel --no-isolation
  # plasmoid & screenshot helper
  cmake -B build -S . \
    -DINSTALL_PLASMOID=ON
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname"
  # backend
  python -m installer --destdir="$pkgdir" dist/*.whl
  # plasmoid & screenshot helper
  DESTDIR="$pkgdir" cmake --install build
}
