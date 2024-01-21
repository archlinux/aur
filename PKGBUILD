# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=('qtscrcpy' 'qtscrcpy-docs')
pkgbase=qtscrcpy
pkgver=2.1.2
pkgrel=1
pkgdesc="Android real-time screencast control tool"
arch=('x86_64' 'aarch64')
url="https://github.com/barry-ran/QtScrcpy"
license=('Apache-2.0')
depends=('android-tools' 'qt5-multimedia' 'qt5-x11extras')
makedepends=('chrpath' 'cmake' 'git' 'qt5-tools')
conflicts=('qt-scrcpy')
replaces=('qt-scrcpy')
backup=("etc/$pkgbase/config.ini")
_commit=6692ee15d4f635a802079b33834d44bb10b0064f  #tags/v2.1.2^0
source=("git+https://github.com/barry-ran/QtScrcpy.git#commit=${_commit}"
        'git+https://github.com/barry-ran/QtScrcpyCore.git'
        'path-fix.patch'
        "$pkgbase.desktop"
        "$pkgbase.sh")
sha256sums=('SKIP'
            'SKIP'
            'a80a69c96361e671db319be612dc08f26142886875a35c9cd5df57c100ddae3a'
            '0dc5b08698162c8a0172a9c2e92b18fa7cd9df4b295bd350329b1e4dbd892a6e'
            '26335d1e208c47ddfc4abaabce3f32734788a80a6663577b3ff462346d8dec6f')

pkgver() {
  cd "$srcdir/QtScrcpy"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$srcdir/QtScrcpy"
  git submodule init
  git config submodule.QtScrcpy/QtScrcpyCore.url "$srcdir/QtScrcpyCore"
  git -c protocol.file.allow=always submodule update

  patch --strip=1 QtScrcpy/main.cpp < "$srcdir/path-fix.patch"

  # Not ready for Qt6 yet
  sed -i 's/Qt6 Qt5/Qt5/g' QtScrcpy/CMakeLists.txt
}

build() {
  cmake -B build -S QtScrcpy \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build

  cd "$srcdir/QtScrcpy"

  # Remove insecure RPATH
  chrpath --delete output/x64/None/QtScrcpy
}

package_qtscrcpy() {
  cd "$srcdir/QtScrcpy"
  install -Dm755 output/x64/None/QtScrcpy -t "$pkgdir/opt/$pkgbase/"
  install -Dm644 output/x64/None/scrcpy-server -t "$pkgdir/opt/$pkgbase/"
  install -Dm644 output/x64/None/sndcpy.apk "$pkgdir/opt/$pkgbase/"
  install -Dm755 output/x64/None/sndcpy.sh "$pkgdir/opt/$pkgbase/"
  install -Dm644 backup/logo.png "$pkgdir/usr/share/pixmaps/$pkgbase.png"
  install -Dm644 config/config.ini -t "$pkgdir/etc/$pkgbase/"

  cp -r keymap "$pkgdir/opt/$pkgbase/"
  chmod 666 "$pkgdir/opt/$pkgbase/keymap"

  install -Dm755 "$srcdir/$pkgbase.sh" "$pkgdir/usr/bin/$pkgbase"
  install -Dm644 "$srcdir/$pkgbase.desktop" -t "$pkgdir/usr/share/applications/"

  ln -s "/opt/$pkgbase/sndcpy.sh" "$pkgdir/usr/bin/"
}

package_qtscrcpy-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  cd "$srcdir/QtScrcpy"
  install -d "$pkgdir/usr/share/doc/$pkgbase"
  cp -r docs/* "$pkgdir/usr/share/doc/$pkgbase/"
}
