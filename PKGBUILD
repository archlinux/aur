# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ente-auth
pkgver=4.4.4
pkgrel=1
pkgdesc="Open source 2FA authenticator, with end-to-end encrypted backups"
arch=('x86_64' 'aarch64')
url="https://ente.io/auth"
license=('AGPL-3.0-or-later')
depends=(
  'gtk3'
  'libayatana-appindicator'
  'libsecret'
  'libsodium-1.0.18'
  'sqlite'
  'zenity'
)
makedepends=(
#  'chrpath'
  'clang'
  'cmake'
  'git'
  'jdk17-openjdk'
  'ninja'
  'unzip'
)
source=("git+https://github.com/ente-io/ente.git#tag=auth-v$pkgver"
        'git+https://github.com/ente-io/sentry-dart.git'
        'git+https://github.com/flutter/flutter.git'
        'git+https://github.com/simple-icons/simple-icons.git'
        'git+https://github.com/ente-io/flutter_distributor_fork.git#branch=develop'
        'enteauth.desktop')
sha256sums=('30195d33c992b5944bec73e69b01759c7f2b985ba6e5a87e6b0b5032cb7cfc38'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'c06f6e30813bd035245e1fb79a8c1b6c5284d98cd98a70e46b18c5a39e7b9aee')

prepare() {
  cd ente
  git submodule init
  git config submodule.auth/thirdparty/sentry-dart.url "$srcdir/sentry-dart"
  git config submodule.auth/flutter.url "$srcdir/flutter"
  git config submodule.auth/assets/simple-icons.url "$srcdir/simple-icons"
  git -c protocol.file.allow=always submodule update

  cd mobile/apps/auth
  ln -sf "$srcdir/flutter_distributor_fork" flutter/packages/flutter_distributor

  export FLUTTER_HOME="$srcdir/ente/mobile/apps/auth/flutter"
  export PATH="${FLUTTER_HOME}/bin:${PATH}"

  # Disable analytics
  flutter --disable-analytics

  # Ensure no build artifacts are cached
  flutter clean

  # Download dependencies
  flutter pub get
}

build() {
  cd ente/mobile/apps/auth
  export FLUTTER_HOME="$srcdir/ente/mobile/apps/auth/flutter"
  export HOME="${FLUTTER_HOME}"
  export PATH="${FLUTTER_HOME}/bin:${PATH}"
  export PATH="${PATH}":"${HOME}/.pub-cache/bin"
  export LIBSODIUM_USE_PKGCONFIG=1
  export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/lib/sodium-1.0.18/pkgconfig/"
  export LIBRARY_PATH="${LIBRARY_PATH}:/usr/lib/sodium-1.0.18/"

  # Treat deprecation errors as warnings
  export CXXFLAGS+=' -Wno-error=deprecated-declarations -Wno-error=deprecated-literal-operator'

  # Disable analytics
  flutter config --no-analytics
  dart --disable-analytics

  dart pub global activate \
    --source git https://github.com/ente-io/flutter_distributor_fork \
    --git-ref develop \
    --git-path packages/flutter_distributor
  flutter_distributor package --platform=linux --targets=zip --skip-clean
}

check() {
  cd ente/mobile/apps/auth
  export FLUTTER_HOME="$srcdir/ente/mobile/apps/auth/flutter"
  export PATH="${FLUTTER_HOME}/bin:${PATH}"
  flutter test
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

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/enteauth" "$pkgdir/usr/bin/"

  install -Dm644 assets/icons/auth-icon.png "$pkgdir/usr/share/pixmaps/enteauth.png"
  install -Dm644 "$srcdir/enteauth.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 linux/packaging/enteauth.appdata.xml -t "$pkgdir/usr/share/metainfo/"

  # Remove insecure RUNPATH pointing to build dir
#  chrpath --delete "$pkgdir/opt/$pkgname"/lib/*.so
}

