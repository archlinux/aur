# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: epitron <chris@ill-logic.com>

pkgname=gitless
pkgver=0.9.15
pkgrel=2
pkgdesc="A scientifically proven easier-to-use git interface"
arch=("any")
url="https://github.com/goldstar611/gitless"
license=("MIT")
depends=('python' 'git' 'python-pygit2>=1.4.0' 'python-setuptools' 'python-argcomplete')
source=("https://github.com/goldstar611/gitless/archive/$pkgver.tar.gz")
sha256sums=('fe53c5c3fc38dca68c88cac117a557ae1002a7b0981f6e7a113dfd6405e867d7')

prepare() {
  cd $pkgname-$pkgver
  
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1 --skip-build
  
  # copy custom license:
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
