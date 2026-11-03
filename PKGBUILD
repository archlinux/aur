# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=yubico-authenticator
_app_id=com.yubico.yubioath
pkgdesc="Yubico Authenticator for Desktop"
pkgver=7.5.0
pkgrel=1
_flutter_ver=3.47.8  ## Check .github/workflows/env for version
arch=('x86_64' 'aarch64')
url="https://developers.yubico.com/yubioath-flutter"
license=('Apache-2.0')
depends=(
  'ccid'
  'dbus'
  'gtk3'
  'libepoxy'
  'libgcc'
  'libnotify'
  'libstdc++'
  'libx11'
  'libxi'
  'pcsclite'
  'systemd-libs'
)
makedepends=(
  'cargo'
  'cargo-about'
  'clang'
  'cmake'
  'desktop-file-utils'
  'fvm'
  'git'
  'imagemagick'
  'ninja'
  # 'patchelf'
)
source=("git+https://github.com/Yubico/yubioath-flutter.git#tag=$pkgver?signed"
        'git+https://github.com/Yubico/yubikey-manager.git')
sha256sums=('b23683226deee6f800999b1f544f1618126224373e437b40bbcacc8b4f00b5ee'
            'SKIP')
# https://developers.yubico.com/Software_Projects/Software_Signing.html
validpgpkeys=('20EE325B86A81BCBD3E56798F04367096FBA95E8'  # Dain Nilsson <dain@yubico.com>
              'C28ED3753F01B4B097A1B306948B29C5F1E063ED'  # Elias Bonnici <elias.bonnici@yubico.com>
              'AF511D2CBC0F973E5D308054325C8E4AE2E6437D') # Adam Velebil <adam.velebil@yubico.com>

if [ $CARCH == "aarch64" ]; then
  FLUTTER_ARCH=arm64
else
  FLUTTER_ARCH=x64
fi

prepare() {
  cd yubioath-flutter
  git submodule init
  git config submodule.yubikey-manager.url "$srcdir/yubikey-manager"
  git -c protocol.file.allow=always submodule update

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --manifest-path helper/Cargo.toml --locked --target host-tuple
  cargo fetch --manifest-path yubikey-manager/Cargo.toml --locked --target host-tuple

  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm install "${_flutter_ver}"
  fvm global "${_flutter_ver}"

  fvm flutter --disable-analytics
  fvm flutter pub get

  mkdir -p "build/linux/helper"

  desktop-file-edit --set-key=Exec --set-value="$pkgname" --set-icon="${_app_id}" \
    "resources/linux/linux_support/${_app_id}.desktop"
}

build() {
  cd yubioath-flutter

  pushd helper
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CARGO_PROFILE_RELEASE_LTO=true
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  cargo build --frozen --release

  cp target/release/authenticator-helper ../build/linux/helper/

  # Generate license files
  cargo about generate --locked about.hbs --config about.toml \
    -o ../assets/licenses/helper.txt
  popd

  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm flutter build linux

  # Generate icons
  for i in 16 48 64 256 512; do
    magick "resources/icons/${_app_id}-1000x1000.png" -resize "${i}x${i}" \
      "resources/icons/${_app_id}_${i}x${i}.png"
  done
}

check() {
  cd yubioath-flutter
  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm flutter test

  desktop-file-validate "resources/linux/linux_support/${_app_id}.desktop"
}

package() {
  cd yubioath-flutter
  install -Dm755 helper/target/release/authenticator-helper -t \
    "$pkgdir/opt/$pkgname/helper/"

  install -Dm755 build/linux/${FLUTTER_ARCH}/release/bundle/authenticator -t \
    "$pkgdir/opt/$pkgname/"
  cp -a build/linux/${FLUTTER_ARCH}/release/bundle/{data,lib} "$pkgdir/opt/$pkgname"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/authenticator" "$pkgdir/usr/bin/$pkgname"

  for i in 16 48 64 256 512; do
    install -Dm644 "resources/icons/${_app_id}_${i}x${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/${_app_id}.png"
  done
  install -Dm644 "resources/icons/${_app_id}-32x32.png" \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/${_app_id}.png"
  install -Dm644 "resources/icons/${_app_id}.png" -t \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/"

  install -Dm644 "resources/linux/linux_support/${_app_id}.desktop" -t \
    "$pkgdir/usr/share/applications/"

  # Remove insecure RUNPATH pointing to build dir
  # patchelf --remove-rpath "$pkgdir/opt/$pkgname"/lib/*.so
}
