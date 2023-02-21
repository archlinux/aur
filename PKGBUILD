# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=mustache-d
pkgver=0.1.5
pkgrel=8
pkgdesc='Moustache template engine for D'
arch=('x86_64')
url='https://github.com/repeatedly/mustache-d'
license=('Boost')
makedepends=('meson' 'ldc' 'liblphobos')
source=("$pkgname-$pkgver::https://github.com/repeatedly/mustache-d/archive/v$pkgver.tar.gz")
sha512sums=('f6a84e69c5345ebe1c8aae3e6a214fd0b57055180f8c689468decab9d4e3cb92d88b1ca51b918eaec2134e2f7f86a17a69b07dfa58783286a66286fefa206eec')

prepare() {
  mkdir -p build

  cd "$srcdir"/$pkgname-$pkgver
  # Fixes 'ERROR: Got unknown keyword arguments "soversion", "version"'
  sed -i "/install: true/{n;N;d}" meson.build
}

build() {
  cd build

  # Build with LDC
  export DC=ldc
  # ldc does not have -flto=auto
  export LDFLAGS="$(echo -ne $LDFLAGS | sed -e 's/-flto=auto/-flto=full/')"
  arch-meson ../$pkgname-$pkgver

  ninja
}

package() {
  cd build

  DESTDIR="$pkgdir" ninja install
}
