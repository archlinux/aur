# Maintainer: jdigi78 <jdigiovanni78 at gmail dot com>
pkgname=varia
pkgdesc='Download manager based on aria2'
url='https://github.com/giantpinkrobots/varia'
license=('MPL2')
arch=('any')
depends=('aria2' 'aria2p')
makedepends=('meson')

# Update following lines for each new release
pkgver=2023.11.22
pkgrel=1
sha256sums=('09d3cf834e6b58c513b19e6898aa457938d7def65e7216b9668eba3a91051af3'
            'SKIP')

source=("https://github.com/giantpinkrobots/varia/archive/refs/tags/v$pkgver.tar.gz"
        "aria2.patch")

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
