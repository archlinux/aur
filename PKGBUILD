# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=pymunk
_munk2d_commit=47b0e6b200c1aedb7b9ee09a998a2ef0bbad8f82
pkgname=python-$_name
pkgver=7.3.1
pkgrel=1
pkgdesc='Pymunk is a easy-to-use pythonic 2D physics library.'
arch=('any')
url='https://github.com/viblo/pymunk'
license=('MIT')
depends=('python'
         'python-cffi')
makedepends=('python-setuptools'
             'python-build'
             'python-installer'
             'python-wheel'
             'git'
             'cmake'
             'gcc')
checkdepends=('python-pyglet'
              'python-pygame'
              'python-pillow'
              'python-matplotlib'
              'python-numpy')
optdepends=('python-pyglet'
            'python-pygame'
            'python-matplotlib')
source=("$url/archive/refs/tags/$pkgver.tar.gz"
        "Munk2D::git+https://github.com/viblo/Munk2D.git#commit=$_munk2d_commit")
sha256sums=('bca3d4b3da475e242d95b17d01404c3aa8afc235ae09850765a8e721dfeb2bd0'
            '8de048933171aee3f10f925a85b297b5b10cafbc247845c6595c969f7506bf14')

prepare(){
  cd "$srcdir"
  rm -rf $_name-$pkgver/Munk2D
  mv Munk2D $_name-$pkgver/Munk2D
}

build(){
  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation
}


check(){
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  cd "$srcdir"/$_name-$pkgver/build/lib.linux-$CARCH-cpython-$python_version
  python -m pymunk.tests
}

package(){
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
