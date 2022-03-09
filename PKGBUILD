# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: epitron <chris@ill-logic.com>

pkgname=gitless
pkgver=0.9.16
pkgrel=1
pkgdesc="A scientifically proven easier-to-use git interface"
arch=("any")
url="https://github.com/goldstar611/gitless"
license=("MIT")
depends=('python' 'git' 'python-pygit2>=1.4.0' 'python-setuptools' 'python-argcomplete')
source=("https://github.com/goldstar611/gitless/archive/$pkgver.tar.gz")
sha256sums=('c54386b5972caa749720a464be394b766d80fc59f45aa2c66d6f1a838747f575')

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
