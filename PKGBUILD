# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=pymunk
pkgname=python-$_name
pkgver=7.4.0
pkgrel=1
pkgdesc='Pymunk is a easy-to-use pythonic 2D physics library.'
arch=('x86_64' 'aarch64')
url='https://github.com/viblo/pymunk'
license=('MIT')
depends=('python'
         'python-cffi'
         'glibc')
makedepends=('python-setuptools'
             'python-wheel'
             'python-cffi'
             'python-build'
             'python-installer'
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
_munk2d_commit=47e051689dcd747ad0cc329669d0768767279101
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "Munk2D::git+https://github.com/viblo/Munk2D.git#commit=$_munk2d_commit")
sha256sums=('969a62f8517739208fe42eb31561260535be3735884295b483ed91a14546bd81'
            '4b721a7efced1c3eacd2589ce5a6c01bb4119376339beef86f0e74c655b5ff66')

prepare(){
  cd "$_name-$pkgver"
  rm -rf Munk2D
  mv "$srcdir"/Munk2D Munk2D
  # Use the cffi version shipped by Arch
  sed -i '/^requires = \[/,/\]/s/"cffi *[<>=!~][^;"]*/"cffi/' pyproject.toml
}

build(){
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check(){
  cd "$_name-$pkgver"
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  cd "build/lib.linux-$CARCH-cpython-$python_version"
  python -m pymunk.tests
}

package(){
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
