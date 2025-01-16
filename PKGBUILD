# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ente-auth
pkgdesc="Open source 2FA authenticator, with end-to-end encrypted backups"
pkgver=4.2.8
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://ente.io/auth"
license=('AGPL-3.0-or-later')
depends=(
  'gtk3'
  'libayatana-appindicator'
  'libsecret'
  'libsodium-1.0.18'
  'sqlite'
)
makedepends=(
#  'chrpath'
  'clang'
  'cmake'
  'git'
  'ninja'
  'unzip'
)
source=("git+https://github.com/ente-io/ente.git#tag=auth-v$pkgver"
        'git+https://github.com/ente-io/sentry-dart.git'
        'git+https://github.com/flutter/flutter.git'
        'git+https://github.com/simple-icons/simple-icons.git'
        'git+https://github.com/ente-io/PhotoSwipe.git'
        'git+https://github.com/prateekmedia/flutter_distributor.git#branch=develop'
        'enteauth.desktop')
sha256sums=('106e24c52f7b05f7fccb5b50ccb391aca15045173b190b9f294cf9cff1adae46'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'c06f6e30813bd035245e1fb79a8c1b6c5284d98cd98a70e46b18c5a39e7b9aee')

prepare() {
  cd ente/auth
  git submodule init
  git config submodule.thirdparty/sentry-dart.url "$srcdir/sentry-dart"
  git config submodule.flutter.url "$srcdir/flutter"
  git config submodule.assets/simple-icons.url "$srcdir/simple-icons"
  git config submodule.web/apps/photos/thirdparty/photoswipe.url "$srcdir/PhotoSwipe"
  git -c protocol.file.allow=always submodule update

  ln -sf "$srcdir/flutter_distributor" flutter/packages

  export FLUTTER_HOME="$srcdir/ente/auth/flutter"
  export PATH="${FLUTTER_HOME}/bin:${PATH}"

  # Disable analytics
  flutter --disable-analytics

  # Ensure no build artifacts are cached
  flutter clean

  # Download dependencies
  flutter pub get
}

build() {
  cd ente/auth
  export FLUTTER_HOME="$srcdir/ente/auth/flutter"
  export HOME="${FLUTTER_HOME}"
  export PATH="${FLUTTER_HOME}/bin:${PATH}"
  export PATH="${PATH}":"${HOME}/.pub-cache/bin"
  export LIBSODIUM_USE_PKGCONFIG=1
  export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/lib/sodium-1.0.18/pkgconfig/"
  export LIBRARY_PATH="${LIBRARY_PATH}:/usr/lib/sodium-1.0.18/"
  flutter config --no-analytics
  dart --disable-analytics
  dart pub global activate \
    --source git https://github.com/prateekmedia/flutter_distributor \
    --git-ref develop \
    --git-path packages/flutter_distributor
  flutter_distributor package --platform=linux --targets=zip --skip-clean
}

check() {
  cd ente/auth
  export FLUTTER_HOME="$srcdir/ente/auth/flutter"
  export PATH="${FLUTTER_HOME}/bin:${PATH}"
  flutter test
}

package() {
  cd ente/auth

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

