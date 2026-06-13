# Maintainer: texas0295 <texas0295@outlook.com>

_reponame="Solian"
pkgname=solian-git
pkgver=r2618.21ce6b8b
pkgrel=1
pkgdesc="Next Generation Network Center (unstable)"
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

provides=('solian')
conflicts=('solian' 'solian-bin' 'solian-bin-git')

source=(
    "git+https://github.com/Solsynth/${_reponame}.git"
    "icon-padded.png"
)

sha256sums=(
    'SKIP'
    '448670e6164b577892733ebdd267830e21509136175df35abb87717d14a63a05'
)

options=('!debug')

_binname="island"

_flutter_ver=3.44.1
_flutter_repo=https://github.com/flutter/flutter.git

pkgver() {
  cd "$srcdir/$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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

  cd "$srcdir/$_reponame"

  flutter precache --linux
  flutter pub get
  dart run build_runner build --delete-conflicting-outputs
  flutter build linux --no-pub --release
}

package() {
  install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 "icon-padded.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/solian.png"

  cd "$srcdir/$_reponame"

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
