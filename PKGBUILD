# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ente-auth
_app_id=io.ente.auth
pkgver=4.4.25
pkgrel=2
_flutter_ver=3.38.10
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
  'java-environment=17'
  'ninja'
  'patchelf'
  'unzip'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
source=("git+https://github.com/ente/ente.git#tag=auth-v$pkgver"
        'git+https://github.com/simple-icons/simple-icons.git'
        'enteauth.sh')
sha256sums=('4886399408a9ac567522caa7c49c851eb2f8bc56f3780a33435286f32d85f1f4'
            'SKIP'
            '21df8c9d913d7f91e5078a3842eb5d8e609e44b4570ed2e9fe2a6299651fd289')

prepare() {
  cd ente
  git submodule init
  git config submodule.mobile/apps/auth/assets/simple-icons.url "$srcdir/simple-icons"
  git -c protocol.file.allow=always submodule update

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
  export LIBSODIUM_USE_PKGCONFIG=1

  # Treat deprecation errors as warnings & avoid build failure due to newer Clang versions
  # https://github.com/juliansteenbakker/flutter_secure_storage/issues/965
  CXXFLAGS+=" -Wno-error=deprecated-declarations -Wno-error=deprecated-literal-operator -Wno-error=incompatible-pointer-types-discards-qualifiers"

  # Disable analytics
  fvm flutter config --no-analytics
  fvm dart --disable-analytics

  cd mobile/apps/auth

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

  # Not required at runtime as it's only used on Android
  rm -fv "build/linux/${FLUTTER_ARCH}/release/bundle/lib/libdartjni.so"

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

  # Remove insecure RUNPATH pointing to build dir
  patchelf --remove-rpath "$pkgdir/opt/$pkgname"/lib/*.so
}
