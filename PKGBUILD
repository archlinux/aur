# Maintainer: texas0295 <texas0295@outlook.com>

_reponame="Solian"
pkgname=solian
pkgver=3.3.0+136
pkgrel=1
pkgdesc="Next Generation Network Center"
arch=('x86_64')
url="https://solsynth.dev"
license=('AGPL3')

depends=(
  'gtk3'
  'libnotify'
  'gstreamer'
  'libayatana-appindicator'
  'libayatana-indicator'
  'libkeybinder3'
  'mpv'
  'libsecret'
  'libpdfium-nojs'
)

makedepends=(
  'git'
  'unzip'
  'xz'
  'clang'
  'cmake'
  'ninja'
)

provides=('solian')
conflicts=('solian' 'solian-bin' 'solian-bin-git')

source=("$pkgname-$pkgver.tar.gz::https://github.com/Solsynth/${_reponame}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f2119f7f6fc1f2e6b8ebe1d808edb327158372c5d96c470fde588edca10dec47')

options=('!debug')

_binname="island"
_pkgver_fixed="${pkgver//+/-}"
_srcdir="$_reponame-$_pkgver_fixed"

_flutter_ver=3.35.6
_flutter_repo=https://github.com/flutter/flutter.git

prepare() {
  cd "$srcdir"

  if [[ ! -d flutter-sdk ]]; then
    git clone --depth=1 -b "$_flutter_ver" "$_flutter_repo" flutter-sdk
  else
    pushd flutter-sdk >/dev/null
    git fetch --depth=1 origin "refs/tags/$_flutter_ver:refs/tags/$_flutter_ver" || true
    git checkout -f "tags/$_flutter_ver" || git checkout -f "$_flutter_ver"
    popd >/dev/null
  fi

  export PUB_CACHE="$srcdir/.pub_cache"

  cd "$srcdir/$_srcdir"
  cat > pubspec_overrides.yaml <<'YAML'
dependency_overrides:
  vector_math: ^2.2.0
YAML
}


build() {
  export PUB_CACHE="$srcdir/.pub_cache"
  export PATH="$srcdir/flutter-sdk/bin:$PATH"
  export CMAKE_BUILD_PARALLEL_LEVEL=${CMAKE_BUILD_PARALLEL_LEVEL:-4}
  export CFLAGS="${CFLAGS} -Wno-error"
  export CXXFLAGS="${CXXFLAGS} -Wno-error"

  cd "$srcdir/$_srcdir"

  flutter precache --linux
  flutter pub upgrade --major-versions
  flutter pub get --enforce-lockfile
  flutter build linux --no-pub --release
}

package() {
  cd "$srcdir/$_srcdir"

  install -dm755 "$pkgdir/usr/lib/solian"
  cp -r build/linux/x64/release/bundle/* "$pkgdir/usr/lib/solian/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/solian" << 'EOF'
#!/bin/sh
cd /usr/lib/solian
exec ./island "$@"
EOF

  install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 "assets/icons/icon-padded.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/solian.png"

  install -dm755 "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/solian.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Version=1.0
Name=Solian
Comment=Next Generation Network Center (unstable)
Exec=solian %u
Icon=solian
Terminal=false
Categories=Network;InstantMessaging;
EOF

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
