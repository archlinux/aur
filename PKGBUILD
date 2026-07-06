# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ente-auth
pkgver=4.4.24
pkgrel=1
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
  'chrpath'
  'clang'
  'cmake'
  'fvm'
  'git'
  'java-environment=17'
  'ninja'
  'unzip'
)
source=("git+https://github.com/ente/ente.git#tag=auth-v$pkgver"
        'git+https://github.com/simple-icons/simple-icons.git'
        'enteauth.desktop')
sha256sums=('5d8cd43064e8d7b3ad936552608ce21a85eea48d5434a270c062af68343d8f23'
            'SKIP'
            'c06f6e30813bd035245e1fb79a8c1b6c5284d98cd98a70e46b18c5a39e7b9aee')

prepare() {
  cd ente
  git submodule init
  git config submodule.auth/assets/simple-icons.url "$srcdir/simple-icons"
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
}

check() {
  cd ente/mobile/apps/auth
  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm flutter test
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

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/enteauth" "$pkgdir/usr/bin/"

  install -d "$pkgdir/usr/share/pixmaps"
  ln -s /opt/ente-auth/data/flutter_assets/assets/icons/auth-icon.png \
    "$pkgdir/usr/share/pixmaps/"

  install -d "$pkgdir/usr/share/polkit-1/actions"
  ln -s /opt/ente-auth/data/flutter_assets/assets/polkit/com.ente.auth.policy \
    "$pkgdir/usr/share/polkit-1/actions/"

  install -Dm644 linux/packaging/enteauth.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 linux/packaging/enteauth.appdata.xml -t "$pkgdir/usr/share/metainfo/"

  # Remove insecure RUNPATH pointing to build dir
  chrpath --delete "$pkgdir/opt/$pkgname"/lib/*.so
}
