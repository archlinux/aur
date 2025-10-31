# Maintainer: Your Name <alex@ahpohl.com>
pkgname=libfronius
pkgver=1.0.2
pkgrel=1
pkgdesc="Library to access Fronius inverters and smart meters"
arch=('x86_64' 'aarch64')
url="https://github.com/ahpohl/libfronius"
license=('MIT')
depends=('libmodbus')
makedepends=('cmake' 'git' 'doxygen')
source=("$pkgname-$pkgver::git+https://github.com/ahpohl/libfronius.git#tag=v${pkgver}")
sha256sums=('2cccd7d52c939ad1a920ddf630d473d7a6f54b91da61f76e2ebc11f554854b8f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
  doxygen Doxyfile
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake --install build --prefix "${pkgdir}/usr"
  
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  if [[ -d "$srcdir/$pkgname-$pkgver/docs/html" ]]; then
    cp -r "$srcdir/$pkgname-$pkgver/docs/html" "$pkgdir/usr/share/doc/$pkgname"
  else
    echo "Warning: Doxygen HTML documentation not found. Did you run doxygen in build()?"
  fi
}
