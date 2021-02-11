# Maintainer: Jonas Malaco <jonas@protocubo.io>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Kevin Azzam <arch@kevin.azz.am>

pkgname=python-hidapi-git
pkgver=0.10.1.r10.g2353c96
pkgrel=1
arch=('any')
pkgdesc="A Cython interface to the hidapi from signal11/hidapi"
url="https://github.com/trezor/cython-hidapi"
depends=('python' 'hidapi')
makedepends=('cython' 'python-setuptools' 'udev')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
license=('custom')
source=("$pkgname::git+$url#branch=master")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"

  git describe --tags --long --abbrev=7 | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  python setup.py build \
        --without-libusb --with-system-hidapi
}

check() {
  cd "$srcdir/$pkgname"

  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-${python_version}" python tests.py
}

package() {
  cd "$srcdir/$pkgname"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build \
        --without-libusb --with-system-hidapi

  install -Dm 755 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  install -Dm 755 LICENSE-bsd.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-bsd.txt
  install -Dm 755 LICENSE-gpl3.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-gpl3.txt
  install -Dm 755 LICENSE-orig.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-orig.txt
}
