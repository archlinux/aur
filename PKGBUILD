# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Brian <brain@derelict.garden>

pkgbase=ladybird
pkgname=(ladybird serenity-wallpapers)
pkgver=20221116
pkgrel=1
pkgdesc='Web browser built from scratch using the SerenityOS LibWeb engine'
arch=(x86_64)
url='https://github.com/SerenityOS/ladybird'
license=(BSD)
depends=(brotli less libgl python qt6-base qt6-wayland)
makedepends=(cmake gendesk git ninja qt6-tools unzip)
options=(!lto)
source=("git+$url#commit=b8812092b1cb7a1e91e0080b2088ee73187f74bc" # 2022-11-16
        ladybird.sh)
b2sums=('SKIP'
        '8a1124ade2b98ab0b8ef2e03616bdbe4340f16dd493283fccb5f69cb74fc172a936da1f5ea3d346e70792deb56e239170fcae2201d7e8a075d1f82750711b6c3')

prepare() {
  gendesk -f --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}

build() {
  cd $pkgname
  cmake \
    -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -G Ninja \
    -W no-dev
  cmake --build build
  ninja -C build
}

package_ladybird() {
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 $pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 $pkgname/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  cd $pkgname/build
  install -Dm755 $pkgname "$pkgdir/usr/share/serenity/Base/bin/$pkgname"

  # shared libraries
  find . -name "*.so.*" -type f -exec install -Dm644 -t "$pkgdir/usr/lib" {} \;
  cp -R _deps/lagom-build/*.so* "$pkgdir/usr/lib/"

  # resources needed by the browser
  cp -R serenity/Base/res "$pkgdir/usr/share/serenity/Base/"
  rm -r "$pkgdir/usr/share/serenity/Base/res/wallpapers"

  cp -R serenity/* "$pkgdir/usr/share/serenity/"
}

package_serenity-wallpapers() {
  pkgdesc='SerenityOS wallpapers'
  depends=()
  install -d "$pkgdir/usr/share/backgrounds"
  cp -R $pkgbase/build/serenity/Base/res/wallpapers "$pkgdir/usr/share/backgrounds/serenity"
  install -Dm644 $pkgbase/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
