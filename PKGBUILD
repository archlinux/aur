# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=qtscrcpy
_pkgname=QtScrcpy
pkgver=1.8.0
pkgrel=1
pkgdesc="Android real-time screencast control tool"
arch=('x86_64')
url="https://github.com/barry-ran/QtScrcpy"
license=('Apache')
depends=('android-tools' 'ffmpeg' 'qt5-x11extras')
makedepends=('cmake' 'qt5-tools')
conflicts=('qt-scrcpy')
replaces=('qt-scrcpy')
backup=("etc/$pkgname/config.ini")
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'path-fix.patch'
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('1afdc592cac608e785327891d47092a91886a9d539aaf213a9015cd6ed04aa66'
            'e3ed3f795ec088f766f9c41cbd422224b1f3bfa31f76115028017719f55dcc97'
            '0dc5b08698162c8a0172a9c2e92b18fa7cd9df4b295bd350329b1e4dbd892a6e'
            '26335d1e208c47ddfc4abaabce3f32734788a80a6663577b3ff462346d8dec6f')

prepare() {
  cd "$_pkgname-$pkgver"

  # Use system packages instead of static bundled tools
  rm -rf third_party/{adb,ffmpeg}

  patch --strip=1 "$_pkgname/main.cpp" < "$srcdir/path-fix.patch"

  sed -i '/-Wno-c++17-extensions/d' "$_pkgname/CMakeLists.txt"
  sed -i 's/-Wall -Wextra -pedantic -Werror/-Wall -Wextra -pedantic/g' "$_pkgname/CMakeLists.txt"
}

build() {
  cmake -B build -S "$_pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -Wno-dev
  cmake --build build
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "output/x64/None/$_pkgname" -t "$pkgdir/opt/$pkgname"
  install -Dm644 backup/logo.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 config/config.ini -t "$pkgdir/etc/$pkgname"
  install -Dm644 third_party/scrcpy-server -t "$pkgdir/opt/$pkgname"

  cp -r keymap "$pkgdir/opt/$pkgname"
  chmod 666 "$pkgdir/opt/$pkgname/keymap"

  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -r docs/* "$pkgdir/usr/share/doc/$pkgname"

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
