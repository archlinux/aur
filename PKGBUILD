# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python38-sure
pkgver=2.0.0
pkgrel=5
pkgdesc="An idiomatic testing library for python with powerful and flexible assertions"
arch=('any')
url="https://github.com/gabrielfalcao/sure"
license=('GPL')
depends=('python38-six')
makedepends=('python38-setuptools' 'git')
# python38-nose is still imported in some tests https://github.com/gabrielfalcao/sure/issues/182
checkdepends=('python38-pytest' 'python38-nose')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gabrielfalcao/sure/archive/$pkgver.tar.gz"
        "use-unittest-mock.diff")
sha512sums=('d113b08afd63c379ec9f05169b1ad15f3bb616a1f6ad7d0ef6513e98ba7ebb7462254b2d25307906d9f63603fed4f9e4b83ccbca0ec53a2b483f9395fa0fb94a'
            'ad17f0bc171058cc488f844a55bd0cf2f83b391c6c47b4ac1864b5de0d0842eb086dd1413c249a05684a45c67542c15eadfa2a7cdff095669e327d0e80f09183')

prepare() {
  export LC_CTYPE=en_US.UTF-8

  cd "$srcdir"/sure-$pkgver
  # https://github.com/gabrielfalcao/sure/issues/169
  patch -Np1 -i ../python3.8.diff

  # Based on the first two commits in https://github.com/gabrielfalcao/sure/pull/161
  patch -Np1 -i ../use-unittest-mock.diff

  sed -i 's#--cov=sure##' setup.cfg
}

build() {
  cd "$srcdir"/sure-$pkgver
  python3.8 setup.py build
}

check() {
  cd "$srcdir"/sure-$pkgver
  PYTHONPATH="$PWD" pytest
}

package() {
  cd sure-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
