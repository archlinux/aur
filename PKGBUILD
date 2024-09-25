# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ente-auth
pkgdesc="Open source 2FA authenticator, with end-to-end encrypted backups"
pkgver=4.0.2
pkgrel=1
_flutter_ver=3.24.3
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
        'git+https://github.com/abhinavkgrd/ffmpeg.wasm.git'
        'git+https://github.com/ente-io/PhotoSwipe.git'
        'ente_auth.desktop')
sha256sums=('ffb5c750bb8e371ac966716cf3b42fa60771b0d57dbc90724c9ed2282740736b'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '92368080b3a0381ede798c4fc76bce22dc3b4bdc0f2c01b317bb20f77aaf4fd6')

prepare() {
  cd ente/auth
  git submodule init
  git config submodule.thirdparty/sentry-dart.url "$srcdir/sentry-dart"
  git config submodule.flutter.url "$srcdir/flutter"
  git config submodule.assets/simple-icons.url "$srcdir/simple-icons"
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
  install -Dm644 linux/packaging/ente_auth.appdata.xml -t "$pkgdir/usr/share/metainfo/"

  # Remove insecure RUNPATH pointing to build dir
#  chrpath --delete "$pkgdir/opt/$pkgname"/lib/*.so
}

