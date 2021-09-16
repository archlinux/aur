# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgbase=libjio
pkgname=(libjio python-libjio python2-libjio)
pkgver=1.02
pkgrel=2
pkgdesc="Userspace library for journaled, transaction-oriented I/O"
arch=('x86_64')
url="https://blitiri.com.ar/p/libjio/"
license=('custom:BOLA' 'custom:Public Domain')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://blitiri.com.ar/p/$pkgname/files/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('2a52024f853f32f062ed47a54ecb9983f0bc1527b0128ae5b0a5ee5d50b2c64f')

prepare() {
  cd "$pkgbase-$pkgver/bindings/"
  cp -a python python2
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package_libjio() {
  depends=('glibc')
  provides=('libjio.so=1-64')

  cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_python-libjio() {
  pkgdesc+=' (Python 3 bindings)'
  depends=('python' 'libjio.so')

  cd "$pkgbase-$pkgver"
  pushd bindings/python/
  python setup.py install --root="$pkgdir/" --optimize=1
  popd
  install -d "$pkgdir/usr/share/licenses/" "$pkgdir/usr/share/doc/"
  ln -s "/usr/share/licenses/$pkgbase/" "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/share/doc/$pkgbase/" "$pkgdir/usr/share/doc/$pkgname"
}

package_python2-libjio() {
  pkgdesc+=' (Python 2 bindings)'
  depends=('python2' 'libjio.so')

  cd "$pkgbase-$pkgver"
  pushd bindings/python2/
  python2 setup.py install --root="$pkgdir/" --optimize=1
  popd
  install -d "$pkgdir/usr/share/licenses/" "$pkgdir/usr/share/doc/"
  ln -s "/usr/share/licenses/$pkgbase/" "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/share/doc/$pkgbase/" "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
