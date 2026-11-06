pkgname=data-vantage
pkgver=1.1.0
pkgrel=1
_commit=d6c38eec2e78770df0a69e8bf9d1edf02d6c5f5f
_httplibver=0.15.3
pkgdesc="High-performance file scanner and duplicate detector with a modern web UI"
arch=('x86_64')
url="https://github.com/roshanbinoj-iiitk/Data-Vantage"
license=('Apache-2.0')
depends=('sqlite' 'gcc-libs' 'glibc')
makedepends=('cmake' 'gcc' 'make' 'pkgconf' 'nodejs' 'npm' 'nlohmann-json' 'xxhash')
optdepends=('zenity: GTK folder picker'
            'kdialog: KDE folder picker'
            'xdg-utils: open files and show them in the file manager')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        "cpp-httplib-$_httplibver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/refs/tags/v$_httplibver.tar.gz")
sha256sums=('85b268dca901c7ef78d628f014faa6d4f4f3e8ea6cdf995f21633da0cb6c325c'
            '2121bbf38871bb2aafb5f7f2b9b94705366170909f434428352187cb0216124e')

build() {
  cd "$srcdir/Data-Vantage-$_commit/backend"
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFETCHCONTENT_SOURCE_DIR_HTTPLIB="$srcdir/cpp-httplib-$_httplibver" \
    -DUSE_SYSTEM_JSON=ON \
    -DUSE_SYSTEM_XXHASH=ON \
    -DENABLE_NATIVE_OPT=OFF
  cmake --build build

  cd "$srcdir/Data-Vantage-$_commit/frontend"
  npm ci
  VITE_API_BASE=/api npm run build
}

package() {
  cd "$srcdir/Data-Vantage-$_commit/backend"
  DESTDIR="$pkgdir" cmake --install build

  install -d "$pkgdir/usr/share/data-vantage/web"
  cp -r "$srcdir/Data-Vantage-$_commit/frontend/dist/"* "$pkgdir/usr/share/data-vantage/web/"

  install -Dm644 "$srcdir/Data-Vantage-$_commit/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
