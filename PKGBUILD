# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-ioflo
pkgver=2.0.2
pkgrel=6
pkgdesc='Flo based programming interface in python'
arch=('any')
url='https://ioflo.com'
license=('Apache')
depends=('python')
makedepends=('python-setuptools-git')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ioflo/ioflo/archive/v$pkgver.tar.gz"
        python310.patch)
sha512sums=('7485924ce329889afb1c3e0555b54fdbfb11eafce48fb0ac15bacd229fea512c44fcc118bbc4368ebc7c770d62129ee6b895b982f73a269de7131ea37daac02b'
            'b588703d653848401fb8e13be949f6de4ff41143eae669ccdcae8edaaac1883be0a684112dacfdf11fa3f2842dbde0dce2b47a7680cb87761d30ffa4018569e8')

prepare() {
  cd ioflo-$pkgver
  patch -Np1 -i ../python310.patch # patch from Gentoo
  sed -i "s/encoding='utf-8',//" ioflo/aio/http/httping.py
  sed -i "s/encoding='utf-8'/'utf-8'/" ioflo/aio/http/clienting.py
}

build() {
  cd ioflo-$pkgver
  python setup.py build
}

check() {
  cd ioflo-$pkgver
  pytest --deselect ioflo/aio/tcp/test/test_tcping.py::BasicTestCase::testTLSConnectionVerifyBothTLSv1
}

package() {
  cd ioflo-$pkgver
  python setup.py install --root="$pkgdir" -O1
}
