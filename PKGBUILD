# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=yubico-authenticator
_app_id=com.yubico.yubioath
pkgdesc="Yubico Authenticator for Desktop"
pkgver=7.3.1
pkgrel=2
_flutter_ver=3.35.3  ## Check .github/workflows/env for version
arch=('x86_64' 'aarch64')
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
  'zenity'
)
makedepends=(
  'chrpath'
  'clang'
  'cmake'
  'fvm'
  'git'
  'ninja'
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
source=("git+https://github.com/Yubico/yubioath-flutter.git#tag=$pkgver?signed")
sha256sums=('682d5468b563d3c137060ab3fd66c814ff9ed36ebc109294291a615969fe94ee')
validpgpkeys=('20EE325B86A81BCBD3E56798F04367096FBA95E8')  # Dain Nilsson <dain@yubico.com>

prepare() {
  cd yubioath-flutter
  git -C helper clean -dfx

  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm install "${_flutter_ver}"
  fvm global "${_flutter_ver}"

  # Disable analytics
  fvm flutter --disable-analytics

  # Pull dependencies within prepare, allowing for offline builds later on
  fvm flutter pub get

  # tray_manager_plugin: Ignore app_indicator_new deprecation warning
  sed -i '15 i target_compile_options(${PLUGIN_NAME} PRIVATE -Wno-deprecated)' \
    linux/flutter/ephemeral/.plugin_symlinks/tray_manager/linux/CMakeLists.txt

  desktop-file-edit --set-key=Exec --set-value="authenticator" --set-icon="${_app_id}" \
    "resources/linux/linux_support/${_app_id}.desktop"

  # Don't copy the Helper since we're not using Pyinstaller
  sed -i '/build\/linux\/helper/d' linux/CMakeLists.txt
}

build() {
  cd yubioath-flutter

  pushd helper
  GIT_DIR='.' python -m build --wheel --no-isolation
  popd

  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm flutter build linux
}

check() {
  cd yubioath-flutter
  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm flutter test
}

package() {
  cd yubioath-flutter

  if [ $CARCH == "aarch64" ]; then
    FLUTTER_ARCH=arm64
  else
    FLUTTER_ARCH=x64
  fi

  pushd helper
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm755 authenticator-helper.py "$pkgdir/opt/$pkgname/helper/authenticator-helper"
  install -Dm755 shell.py -t "$pkgdir/opt/$pkgname/helper/"
  popd

  install -Dm755 build/linux/${FLUTTER_ARCH}/release/bundle/authenticator -t \
    "$pkgdir/opt/$pkgname/"
  cp -r build/linux/${FLUTTER_ARCH}/release/bundle/{data,lib} "$pkgdir/opt/$pkgname"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/authenticator" "$pkgdir/usr/bin/"

  install -Dm644 "resources/icons/${_app_id}.png" -t \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/"
  install -Dm644 "resources/icons/${_app_id}-32x32.png" \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/${_app_id}.png"
  install -Dm644 "resources/icons/${_app_id}-1000x1000.png" \
    "$pkgdir/usr/share/icons/hicolor/1000x1000/apps/${_app_id}.png"
  install -Dm644 "resources/linux/linux_support/${_app_id}.desktop" -t \
    "$pkgdir/usr/share/applications/"

  # Remove insecure RUNPATH pointing to build dir
  chrpath --delete "$pkgdir/opt/$pkgname"/lib/*.so
}

