# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-tubes
pkgver=0.2.1
pkgrel=6
arch=(any)
pkgdesc='A data-processing and flow-control engine for event-driven programs'
url='https://github.com/twisted/Tubes'
license=(MIT)
depends=(python python-six python-twisted)
makedepends=(python-setuptools)
source=("https://github.com/twisted/tubes/archive/v$pkgver/tubes-v$pkgver.tar.gz"
        "py312.patch")
sha512sums=('6f4666f1591c96d0d7f0514f511ad700f6c3976fcf561f0d967f26aead089e682540b74f85b26a68ff6877d5d7775654c9f6959d8a41c25804375ca837ac1815'
            '793ac1e3aa02f7e5fdd2391aa36227311e9d7ff72b9604d52160055dee74a30f90e8b185f0f2d3b121de0541dda542bf21f517c330e82c3782d01b7f985618b2')

prepare() {
  cd tubes-$pkgver
  # Cherry-pick https://github.com/twisted/tubes/commit/dac81e7c934ab0f7afaba9e7894e3770c5859b77
  # Part of https://github.com/twisted/tubes/pull/95 (merged)
  patch -Np1 -i ../py312.patch
}

build() {
  cd tubes-$pkgver
  python setup.py build
}

check() {
  cd tubes-$pkgver
  PYTHONPATH=. trial tubes
}

package() {
  cd tubes-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
