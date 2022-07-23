# Maintainer: AmberArch <amber@mail.cyborgtrees.com>

pkgname=show-git
_pkgname=Show
pkgver=r86.f966da3
pkgrel=2
arch=(any)
pkgdesc="Realtime GLSL shader wallpapers"
url="https://github.com/danielfvm/Show"
license=("GPL")
# Show needs xrandr to build, but I don't know if its required for wayland systems.
depends=(python-xcffib python-cairocffi python-opengl python-screeninfo python-mouse python-opencv python-scipy python-glfw glfw)
optdepends=("glfw-wayland: wayland support")
makedepends=(git python-build python-installer python-wheel python-setuptools)
source=('git+https://github.com/danielfvm/Show.git') 
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

#prepare() {
#  cd "$srcdir/$_pkgname"
#  git apply "$srcdir/show.patch"
#}

build() {
  cd "$srcdir/$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
mkdir -p "$pkgdir/usr/share/show"
cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
	cp example/* LICENSE README.md "$pkgdir/usr/share/show"
  #installs directly to site-packages instead of making a subdirectory
  cd "$pkgdir/usr/lib/python3.10/site-packages"
  mkdir Show
  mv ./*.py Show/
  mv __pycache__ Show/
  chmod +x Show/show.py
  #executable
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/lib/python3.10/site-packages/Show/show.py" "$pkgdir/usr/bin/show"
}
