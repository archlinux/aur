# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=cpptoml
pkgver=0.1.1
pkgrel=3
pkgdesc="A header-only library for parsing TOML"
arch=(any)
url="https://github.com/skystrife/cpptoml"
license=(MIT)
makedepends=(cmake)
source=(
  $url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz
  $pkgname-0.1.1-limit_header.patch::https://github.com/skystrife/cpptoml/pull/123/commits/c55a516e90133d89d67285429c6474241346d27a.patch
)
sha512sums=('14edce576514d53a7e13562d7f8d2b66ea2b95f44038396c0e26232ec81783042ebecec31ee272a99afef96d5c8582a8e81ea5167a787844b98de6ee6f545cc5'
            'ca47dbabd54043ffce74da1cb56dc698325e94c85e0049a3f0220efc787e8d1af90b47b0aab16c0417650872d282c34f8e929565d19387134587d0ffb2618322')
b2sums=('c0ce036bec4731c4dfe96d01076b9ca18a1c4108180d5dbc839dfc44b37eb0c7af85f685a6356ef92fa684219e2883dd341e64a2012505dacc3df73dfb9e28ca'
        '8225603953596ffaeff5aac63f602ea695d3af997f737ea4167d57772c39e3796e4b0ace167e876bd2135b3251f863800f2c9eb4f2f7190b8bf2314403a4cad7')

prepare() {
  # add missing header: https://github.com/skystrife/cpptoml/pull/123
  patch -Np1 -d $pkgname-$pkgver -i ../$pkgname-0.1.1-limit_header.patch
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -W no-dev
    -S $pkgname-$pkgver
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgname-$pkgver/README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
