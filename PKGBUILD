# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ente-auth
pkgdesc="Open source 2FA authenticator, with end-to-end encrypted backups"
pkgver=4.1.5
pkgrel=1
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
  'git'
  'ninja'
  'unzip'
)
source=("git+https://github.com/ente-io/ente.git#tag=auth-v$pkgver"
        'git+https://github.com/ente-io/sentry-dart.git'
        'git+https://github.com/flutter/flutter.git'
        'git+https://github.com/simple-icons/simple-icons.git'
        'git+https://github.com/ente-io/PhotoSwipe.git'
        'enteauth.desktop')
sha256sums=('34c8a479221332a5cb0ead8097b36307c6647278f41791b05fcf6d5fa902c220'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'cc06c91a260d04fd7f62396a253702fb44c93125492235af022d2d417b2dcf78')

prepare() {
  cd ente/auth
  git submodule init
  git config submodule.thirdparty/sentry-dart.url "$srcdir/sentry-dart"
  git config submodule.flutter.url "$srcdir/flutter"
  git config submodule.assets/simple-icons.url "$srcdir/simple-icons"
  git config submodule.web/apps/photos/thirdparty/photoswipe.url "$srcdir/PhotoSwipe"
  git -c protocol.file.allow=always submodule update

  export FLUTTER_HOME="$srcdir/ente/auth/flutter"
  export PATH="${FLUTTER_HOME}/bin:${PATH}"

  # Disable analytics
  flutter --disable-analytics

  # Download dependencies
  flutter pub get
}

build() {
  cd ente/auth
  export FLUTTER_HOME="$srcdir/ente/auth/flutter"
  export PATH="${FLUTTER_HOME}/bin:${PATH}"
  flutter build linux
}

check() {
  cd ente/auth
  export FLUTTER_HOME="$srcdir/ente/auth/flutter"
  export PATH="${FLUTTER_HOME}/bin:${PATH}"
  flutter test
}

package() {
  cd ente/auth

  if [ $CARCH == "aarch64" ]; then
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

