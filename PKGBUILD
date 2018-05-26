# Maintainer: Daniël de Kok <me@danieldk.eu>
pkgbase=fasttext-git
pkgname=(fasttext-git python-fasttext-git)
pkgver=v0.1.0.r67.geefbf95
pkgrel=2
pkgdesc="Library for fast text representation and classification."
arch=("x86_64")
url="https://fasttext.cc/"
license=('BSD')
depends=('gcc-libs')
makedepends=(
  # official repositories:
  'git' 'cmake' 'python-wheel' 'python-setuptools'

  # AUR:
  'pybind11'
)
source=('git+https://github.com/facebookresearch/fastText.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/fastText"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir "$srcdir/fastText/build"
  cd "$srcdir/fastText/build"
  cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    .. 
  make

  cd "$srcdir/fastText"
  python setup.py build
}

package_fasttext-git() {
  cd "$srcdir/fastText"

  (
    cd build
    make DESTDIR="${pkgdir}/" install
  )

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 PATENTS "$pkgdir/usr/share/licenses/$pkgname/PATENTS"

  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp docs/*.md "$pkgdir/usr/share/doc/$pkgname"
  install -m644 README.md "$pkgdir/usr/share/doc/$pkgname"
}

package_python-fasttext-git() {
  depends=('python-numpy')

  cd "$srcdir/fastText"

  python setup.py install --prefix=/usr --root="${pkgdir}"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 PATENTS "$pkgdir/usr/share/licenses/$pkgname/PATENTS"

  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -r python/doc/examples "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 python/README.md "$pkgdir/usr/share/doc/$pkgname"
}
