# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=yubico-authenticator
_app_id=com.yubico.yubioath
pkgdesc="Yubico Authenticator for Desktop"
pkgver=6.4.0
pkgrel=1
_flutter_ver=3.19.0
arch=('x86_64')
url="https://github.com/Yubico/yubioath-flutter"
license=('Apache-2.0')
depends=(
  'ccid'
  'gtk3'
  'libayatana-appindicator'
  'libnotify'
  'pcsclite'
  'python-mss'
  'python-pillow'
  'python-zxing-cpp'
  'yubikey-manager'
)
makedepends=(
  'chrpath'
  'clang'
  'cmake'
  'git'
  'ninja'
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
_commit=c44d65eb6efc9e82b74eb44f228c3937bdc1e071  # tags/6.4.0^0
source=("git+https://github.com/Yubico/yubioath-flutter.git#commit=${_commit}?signed"
        "flutter-${_flutter_ver}.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${_flutter_ver/.hotfix/+hotfix}-stable.tar.xz")
validpgpkeys=('AF511D2CBC0F973E5D308054325C8E4AE2E6437D'  # Adam Velebil <adam.velebil@yubico.com>
              '20EE325B86A81BCBD3E56798F04367096FBA95E8')  # Dain Nilsson <dain@yubico.com>
sha256sums=('SKIP'
            '4cc1706fbd6e2a5c0ee34a6f8de875aae20904c9f47e18c88d2fcb25d9ea1a79')

prepare() {
  cd yubioath-flutter
  desktop-file-edit --set-key=Exec --set-value="authenticator" --set-icon="${_app_id}" \
    resources/linux/linux_support/com.yubico.authenticator.desktop

  # Don't copy the Helper since we're not using Pyinstaller
  sed -i '/build\/linux\/helper/d' linux/CMakeLists.txt
}

build() {
  cd yubioath-flutter

  pushd helper
  GIT_DIR='.' python -m build --wheel --no-isolation
  popd

  export FLUTTER_HOME="$srcdir/flutter"
  export PATH="${PATH}:${FLUTTER_HOME}/bin:"
  flutter pub get
  flutter build linux --suppress-analytics
}

check() {
  cd yubioath-flutter
  export FLUTTER_HOME="$srcdir/flutter"
  export PATH="${PATH}:${FLUTTER_HOME}/bin:"
  flutter test
}

package() {
  cd yubioath-flutter

  pushd helper
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm755 authenticator-helper.py "$pkgdir/opt/$pkgname/helper/authenticator-helper"
  install -Dm755 shell.py -t "$pkgdir/opt/$pkgname/helper/"
  popd

  install -Dm755 build/linux/x64/release/bundle/authenticator -t \
    "$pkgdir/opt/$pkgname/"
  cp -r build/linux/x64/release/bundle/{data,lib} "$pkgdir/opt/$pkgname"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/authenticator" "$pkgdir/usr/bin/"

  install -Dm644 "resources/icons/${_app_id}.png" -t \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/"
  install -Dm644 "resources/icons/${_app_id}-32x32.png" \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/${_app_id}.png"
  install -Dm644 "resources/icons/${_app_id}-1000x1000.png" \
    "$pkgdir/usr/share/icons/hicolor/1000x1000/apps/${_app_id}.png"
  install -Dm644 resources/linux/linux_support/com.yubico.authenticator.desktop -t \
    "$pkgdir/usr/share/applications/"

  # Remove insecure RUNPATH pointing to build dir
  chrpath --delete "$pkgdir/opt/$pkgname"/lib/*.so
}
