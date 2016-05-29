# Maintainer: Sascha Shaw <sascha.shaw@t-online.de>
pkgname=('python-odfpy-git' 'python2-odfpy-git')
pkgbase='python-odfpy-git'
pkgver=1.3.3
pkgrel=1
pkgdesc='tools and libraries for manipulating OpenDocument 1.2 files in Python'
arch=(any)
url="https://github.com/eea/odfpy"
license=('GPL')
makedepends=('git')

_gitroot=https://github.com/eea/odfpy.git
_gitname=odfpy

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

package_python-odfpy-git() {
  depends=('python')
  conflicts=('python-odfpy' 'python2-odfpy' 'odfpy' 'odfpy-git')
  cd "$srcdir/$_gitname-build"
  python setup.py build
  python setup.py install --root="$pkgdir/"
}

# The python2 version depends on the python3 version at the moment
# until I find a more elegant way to split the tools.

package_python2-odfpy-git() {
depends=('python2' 'python-odfpy-git')  
  conflicts=('python2-odfpy' 'odfpy' 'odfpy-git')
  cd "$srcdir/$_gitname-build"
  python2 setup.py build
  python2 setup.py install --root="$pkgdir/"
  rm -r $pkgdir/usr/bin
  rm -r $pkgdir/usr/share
}

# vim:set ts=2 sw=2 et:
