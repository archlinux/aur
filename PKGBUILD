# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ente-auth
pkgdesc="2FA app with free end-to-end encrypted backup and sync"
pkgver=3.0.8
pkgrel=1
_flutter_ver=3.19.3
arch=('x86_64' 'aarch64')
url="https://ente.io/auth"
license=('AGPL-3.0-or-later')
depends=(
  'gtk3'
  'libayatana-appindicator'
  'libsecret'
  'libsodium'
  'sqlite'
  'webkit2gtk'
)
makedepends=(
#  'chrpath'
  'clang'
  'cmake'
  'fvm'
  'git'
  'ninja'
)
source=("git+https://github.com/ente-io/ente.git#tag=auth-v$pkgver"
        'git+https://github.com/ente-io/sentry-dart.git'
        'git+https://github.com/flutter/flutter.git'
        'git+https://github.com/simple-icons/simple-icons.git'
        'git+https://github.com/ente-io/clip-ggml.git'
        'git+https://github.com/abhinavkgrd/ffmpeg.wasm.git'
        'git+https://github.com/ente-io/PhotoSwipe.git'
        'ente_auth.desktop')
sha256sums=('8a8fe749d6cc6e0cf1f2b5d5be293e37f318c6971b5d446ee827cb8d6a6613a1'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '55bc5058368c60b521b9f183c6ac8a73ca6bafbf775399fb9a8c91bd67a3e246')

prepare() {
  cd ente/auth
  git submodule init
  git config submodule.thirdparty/sentry-dart.url "$srcdir/sentry-dart"
  git config submodule.flutter.url "$srcdir/flutter"
  git config submodule.assets/simple-icons.url "$srcdir/simple-icons"
  git config submodule.mobile/plugins/clip_ggml.url "$srcdir/clip-ggml"
  git config submodule.web/apps/photos/thirdparty/ffmpeg-wasm.url "$srcdir/ffmpeg.wasm"
  git config submodule.web/apps/photos/thirdparty/photoswipe.url "$srcdir/PhotoSwipe"
  git -c protocol.file.allow=always submodule update

  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm install "${_flutter_ver}"
  fvm global "${_flutter_ver}"

  # Disable analytics
  fvm flutter --disable-analytics

  # Download dependencies
  fvm flutter pub get
}

build() {
  cd ente/auth
  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm flutter build linux
}

check() {
  cd ente/auth
  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm flutter test
}

package() {
  cd ente/auth

  if [ $CARCH == "aarch64" ]; then
    FLUTTER_ARCH=arm64
  else
    FLUTTER_ARCH=x64
  fi

  install -Dm755 build/linux/${FLUTTER_ARCH}/release/bundle/ente_auth -t \
    "$pkgdir/opt/$pkgname/"
  cp -r build/linux/${FLUTTER_ARCH}/release/bundle/{data,lib} "$pkgdir/opt/$pkgname"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/ente_auth" "$pkgdir/usr/bin/"

  install -Dm644 assets/icons/auth-icon.png "$pkgdir/usr/share/pixmaps/ente_auth.png"
  install -Dm644 "$srcdir/ente_auth.desktop" -t "$pkgdir/usr/share/applications/"

  # Remove insecure RUNPATH pointing to build dir
#  chrpath --delete "$pkgdir/opt/$pkgname"/lib/*.so
}

