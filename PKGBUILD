# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python-billiard
pkgver=3.6.3.0
pkgrel=3
pkgdesc="Python multiprocessing fork with improvements and bugfixes."
arch=('x86_64')
url="https://pypi.org/project/billiard/"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-case' 'python-psutil')
source=("https://pypi.io/packages/source/b/billiard/billiard-$pkgver.tar.gz"
        $pkgname-py39.patch::https://github.com/celery/billiard/commit/ca3220ba4596.patch)
sha512sums=('8fde933c7f605aa4958a6f9da7aa876f42ef7250845b113fc175f8e8af1760063ac6b2a7a222d2c0bac4715f18986a2ee1a5528cc14925b2060dca8a5bd2333c'
            'e4cb47ca4038d530f80f2491c43067f11833a1d2110f878f28e2fc585904d203a78ed11fa8f5ca17ea7dd801cce73ac0b4e85c2dbd4e37c3b02632a06324b43c')

prepare() {
  cd "$srcdir"/billiard-$pkgver
  sed -i 's/< *5/<6/' requirements/test.txt
  sed '/diff --git a\/tox.ini/,$d' ../$pkgname-py39.patch | patch -Np1
}

build() {
  cd "$srcdir"/billiard-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/billiard-$pkgver
  python setup.py pytest
}

package() {
  cd "$srcdir"/billiard-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm0664 "$srcdir"/billiard-$pkgver/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
