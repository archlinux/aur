# Maintainer: texas0295 <texas0295@outlook.com>

_reponame="Solian"
pkgname=solian
pkgver=3.9.0+229
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
  'icu76'
)

makedepends=(
  'git'
  'unzip'
  'xz'
  'clang'
  'cmake'
  'ninja'
)

conflicts=('solian-git' 'solian-bin' 'solian-bin-git')

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Solsynth/${_reponame}/archive/refs/tags/${pkgver}.tar.gz"
    "icon-padded.png"
)
sha256sums=(
    '5ad0f4180f199f03ceab76a5f5af6e45bed39f9297851f06857a0f8638691771'
    '448670e6164b577892733ebdd267830e21509136175df35abb87717d14a63a05'
)

options=('!debug')

_binname="island"
_pkgver_fixed="${pkgver//+/-}"
_srcdir="$_reponame-$_pkgver_fixed"

_flutter_ver=3.44.1
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
}


build() {
  export PUB_CACHE="$srcdir/.pub_cache"
  export PATH="$srcdir/flutter-sdk/bin:$PATH"
  export CMAKE_BUILD_PARALLEL_LEVEL=${CMAKE_BUILD_PARALLEL_LEVEL:-4}
  export CFLAGS="${CFLAGS} -Wno-error"
  export CXXFLAGS="${CXXFLAGS} -Wno-error"

  cd "$srcdir/$_srcdir"

  flutter precache --linux
  flutter pub get --enforce-lockfile
  dart run build_runner build --delete-conflicting-outputs
  flutter build linux --no-pub --release
}

package() {

  install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 "assets/icons/icon-padded.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/solian.png"

  cd "$srcdir/$_srcdir"

  install -dm755 "$pkgdir/usr/lib/solian"
  cp -r build/linux/x64/release/bundle/* "$pkgdir/usr/lib/solian/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/solian" << 'EOF'
#!/bin/sh
cd /usr/lib/solian
exec ./island "$@"
EOF

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
