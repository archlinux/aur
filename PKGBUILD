# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=yubico-authenticator
_app_id=com.yubico.yubioath
pkgdesc="Yubico Authenticator for Desktop"
pkgver=7.3.3
pkgrel=1
_flutter_ver=3.41.6  ## Check .github/workflows/env for version
arch=('x86_64' 'aarch64')
url="https://github.com/Yubico/yubioath-flutter"
license=('Apache-2.0')
depends=(
  'ccid'
  'gtk3'
  'libayatana-appindicator'
  'libnotify'
  'pcsclite'
  'python-click'
  'python-fido2'
  'python-mss'
  'python-pillow'
  'python-pyscard'
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
sha256sums=('9aa06c52ce65db05bb9b4752a09fd6b38346888bf0aa946ee3c5dc01c6da3216')
validpgpkeys=('20EE325B86A81BCBD3E56798F04367096FBA95E8'   # Dain Nilsson <dain@yubico.com>
              'C28ED3753F01B4B097A1B306948B29C5F1E063ED')  # Elias Bonnici <elias.bonnici@yubico.com>

prepare() {
  cd yubioath-flutter
  git -C helper clean -dfx

  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm install "${_flutter_ver}"
  fvm global "${_flutter_ver}"

  fvm flutter --disable-analytics
  fvm flutter pub get

  desktop-file-edit --set-key=Exec --set-value="$pkgname" --set-icon="${_app_id}" \
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
  ln -s "/opt/$pkgname/authenticator" "$pkgdir/usr/bin/$pkgname"

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
