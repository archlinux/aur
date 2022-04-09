# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('qtscrcpy' 'qtscrcpy-docs')
pkgbase=qtscrcpy
_pkgname=QtScrcpy
pkgver=1.9.0
pkgrel=1
pkgdesc="Android real-time screencast control tool"
arch=('x86_64' 'aarch64')
url="https://github.com/barry-ran/QtScrcpy"
license=('Apache')
depends=('android-tools' 'qt5-x11extras')
makedepends=('cmake' 'qt5-tools')
conflicts=('qt-scrcpy')
replaces=('qt-scrcpy')
backup=("etc/$pkgbase/config.ini")
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'path-fix.patch'
        "$pkgbase.desktop"
        "$pkgbase.sh")
sha256sums=('b978a3b87d2aa57318d6f8991bc27d61686a74d66a412bc026434d86b7a19109'
            'e3ed3f795ec088f766f9c41cbd422224b1f3bfa31f76115028017719f55dcc97'
            '0dc5b08698162c8a0172a9c2e92b18fa7cd9df4b295bd350329b1e4dbd892a6e'
            '26335d1e208c47ddfc4abaabce3f32734788a80a6663577b3ff462346d8dec6f')

prepare() {
  cd "$_pkgname-$pkgver"

  # Use system packages instead of static bundled tools
  rm -rf third_party/adb

  patch --strip=1 "$_pkgname/main.cpp" < "$srcdir/path-fix.patch"

  # Not ready for Qt6 yet
  sed -i 's/Qt6 Qt5/Qt5/g' "$_pkgname/CMakeLists.txt"
}

build() {
  cmake -B build -S "$_pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

package_qtscrcpy() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "output/x64/None/$_pkgname" -t "$pkgdir/opt/$pkgbase"
  install -Dm644 backup/logo.png "$pkgdir/usr/share/pixmaps/$pkgbase.png"
  install -Dm644 config/config.ini -t "$pkgdir/etc/$pkgbase"
  install -Dm644 third_party/scrcpy-server -t "$pkgdir/opt/$pkgbase"

  cp -r keymap "$pkgdir/opt/$pkgbase"
  chmod 666 "$pkgdir/opt/$pkgbase/keymap"

  install -Dm755 "$srcdir/$pkgbase.sh" "$pkgdir/usr/bin/$pkgbase"
  install -Dm644 "$srcdir/$pkgbase.desktop" -t "$pkgdir/usr/share/applications"
}

package_qtscrcpy-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  cd "$_pkgname-$pkgver"
  install -d "$pkgdir/usr/share/doc/$pkgbase"
  cp -r docs/* "$pkgdir/usr/share/doc/$pkgbase"
}
