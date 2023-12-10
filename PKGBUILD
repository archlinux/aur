# Maintainer: jdigi78 <jdigiovanni78 at gmail dot com>

pkgname=varia
pkgver=2023.12.7
pkgrel=3

source=("https://github.com/giantpinkrobots/varia/archive/refs/tags/v$pkgver.tar.gz"
        "aria2.patch")
        
sha256sums=('ebc877ab7c53cdb1d647d94c005c2c1d13f5105101a9d79eb06efcd7bf8c01fd'
            'c3fe196ebb295a8874792e4d259ec6154eb9993bbea3ca4f115f5d9424e0e26c')

pkgdesc='Download manager based on aria2'
arch=('any')
url='https://github.com/giantpinkrobots/varia'
license=('MPL2')
depends=('aria2' 'aria2p' 'python' 'python-setuptools')
makedepends=('meson')

prepare() {
  # aria2c cannot be found without this patch
  patch --directory="$pkgname-$pkgver" --forward --strip=1 -i "${srcdir}/aria2.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  meson setup builddir
  cd builddir
  meson compile
}

package() {
  cd "$srcdir/$pkgname-$pkgver/builddir"
  meson configure -Dprefix="/usr"
  meson install --destdir "$pkgdir"
  chmod -R 755 "$pkgdir"
  
  # Install license
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
