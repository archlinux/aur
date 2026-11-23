# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ente-auth
_app_id=io.ente.auth
pkgver=4.4.27
pkgrel=1
_flutter_ver=3.47.8  ## Check .github/actions/setup-flutter/action.yml for FLUTTER_VERSION
pkgdesc="Open source 2FA authenticator, with end-to-end encrypted backups"
arch=('x86_64' 'aarch64')
url="https://ente.com/auth"
license=('AGPL-3.0-or-later')
depends=(
  'gtk3'
  'libayatana-appindicator'
  'libsecret'
  'libsodium'
  'org.freedesktop.secrets'
  'polkit'
  'sqlite'
  'xdg-user-dirs'
)
makedepends=(
  'clang'
  'cmake'
  'fvm'
  'git'
  'imagemagick'
  'java-environment'
  'ninja'
  'patchelf'
  'rustup'
  'unzip'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)

# Disable LTO to avoid undefined symbols
# libente_auth_frb.so: undefined symbol: ring_core_0_17_14__LIMB_is_zero
options=('!lto')

source=("git+https://github.com/ente/ente.git#tag=auth-v$pkgver"
        'git+https://github.com/simple-icons/simple-icons.git'
        'enteauth.sh')
sha256sums=('a5b0047c6e270f10c9b2f9d52e82b117f6058f0c703efe851aeac6b92aa39215'
            'SKIP'
            '21df8c9d913d7f91e5078a3842eb5d8e609e44b4570ed2e9fe2a6299651fd289')

prepare() {
  cd ente
  git submodule init
  git config submodule.mobile/apps/auth/assets/simple-icons.url "$srcdir/simple-icons"
  git -c protocol.file.allow=always submodule update

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --manifest-path rust/Cargo.toml --locked --target host-tuple

  cd mobile/apps/auth
  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm install "${_flutter_ver}"
  fvm global "${_flutter_ver}"

  # Disable analytics
  fvm flutter config --no-analytics

  # Ensure no build artifacts are cached
  fvm flutter clean

  # Download dependencies
  fvm flutter pub get --enforce-lockfile
}

build() {
  cd ente
  export FVM_CACHE_PATH="$srcdir/fvm"

  # Disable analytics
  fvm flutter config --no-analytics
  fvm dart --disable-analytics

  pushd rust
  export RUSTUP_TOOLCHAIN=stable

  # codegen runs dart directly, add Flutter SDK bin to PATH
  export PATH="$FVM_CACHE_PATH/versions/${_flutter_ver}/bin:$PATH"

  cargo codegen frb auth
  popd

  cd mobile/apps/auth

  # Avoid build failure due to newer Clang versions
  # https://github.com/juliansteenbakker/flutter_secure_storage/issues/965
  CXXFLAGS+=" -Wno-error=deprecated-literal-operator"

  # Use system libsodium
  export LIBSODIUM_USE_PKGCONFIG=1

  # Disable update notifications and auto-update functionality
  fvm flutter build linux --release --dart-define=app.flavor=independent

  # Generate icons
  for i in 16 32 48 64 128 256 512; do
    magick assets/icons/auth-icon.png -resize "${i}x${i}" \
      "assets/icons/${_app_id}_${i}x${i}.png"
  done
}

check() {
  cd ente/mobile/apps/auth
  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm flutter test

  appstreamcli validate --no-net linux/packaging/enteauth.appdata.xml || :
  desktop-file-validate linux/packaging/enteauth.desktop
}

package() {
  cd ente/mobile/apps/auth

  if [ "$CARCH" == "aarch64" ]; then
    FLUTTER_ARCH=arm64
  else
    FLUTTER_ARCH=x64
  fi

  install -Dm755 build/linux/${FLUTTER_ARCH}/release/bundle/enteauth -t \
    "$pkgdir/opt/$pkgname/"
  cp -r build/linux/${FLUTTER_ARCH}/release/bundle/{data,lib} "$pkgdir/opt/$pkgname"

  # Fix library permissions
  chmod 0755 "$pkgdir/opt/$pkgname"/lib/*.so

  # Use wrapper script to preload libsodium.so
  install -Dm755 "$srcdir/enteauth.sh" "$pkgdir/usr/bin/enteauth"

  for i in 16 32 48 64 128 256 512; do
    install -Dm644 "assets/icons/${_app_id}_${i}x${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/${_app_id}.png"
  done

  install -d "$pkgdir/usr/share/icons/hicolor/1024x1024/apps"
  ln -s /opt/ente-auth/data/flutter_assets/assets/icons/auth-icon.png \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/${_app_id}.png"

  install -d "$pkgdir/usr/share/polkit-1/actions"
  ln -s /opt/ente-auth/data/flutter_assets/assets/polkit/com.ente.auth.policy \
    "$pkgdir/usr/share/polkit-1/actions/"

  install -Dm644 linux/packaging/enteauth.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 linux/packaging/enteauth.appdata.xml -t "$pkgdir/usr/share/metainfo/"

  # Set RPATH
  patchelf --set-rpath '$ORIGIN' "$pkgdir/opt/$pkgname/lib/libflutter_linux_gtk.so"
}
