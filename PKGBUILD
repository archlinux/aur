pkgname=data-vantage
pkgver=1.0.0
pkgrel=2
pkgdesc="High-performance file scanner and duplicate detector with a modern web UI"
arch=('x86_64')
url="https://github.com/roshanbinoj-iiitk/Data-Vantage"
license=('Apache')
depends=('sqlite')
makedepends=('cmake' 'gcc' 'make' 'pkgconf' 'nodejs' 'npm' 'cpp-httplib')
optdepends=('zenity: GTK directory picker' 'kdialog: KDE directory picker')
source=("$pkgname-$pkgver.tar.gz::https://github.com/roshanbinoj-iiitk/Data-Vantage/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('872011d26860c8066f83d6a424bb5cc2f5e4d4d5337ff9342a8853093ca6b736')

build() {
  cd "$srcdir/Data-Vantage-$pkgver/backend"
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_SYSTEM_HTTPLIB=ON \
    -DENABLE_NATIVE_OPT=OFF
  cmake --build build

  cd "$srcdir/Data-Vantage-$pkgver/frontend"
  npm ci
  VITE_API_BASE=/api npm run build
}

package() {
  cd "$srcdir/Data-Vantage-$pkgver/backend"
  DESTDIR="$pkgdir" cmake --install build

  install -d "$pkgdir/usr/share/data-vantage/web"
  cp -r "$srcdir/Data-Vantage-$pkgver/frontend/dist/"* "$pkgdir/usr/share/data-vantage/web/"

  install -Dm644 "$srcdir/Data-Vantage-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
