# https://aur.archlinux.org/packages/passy
pkgname=passy
_app_id=com.glitterware.passy
pkgver=1.9.4+pre
pkgrel=1
pkgdesc="Offline password manager with cross-platform synchronization"
arch=('x86_64' 'aarch64')
url="https://glitterware.github.io/Passy"
license=('GPL-3.0-or-later')
depends=('gtk3' 'libayatana-appindicator' 'mpv')
makedepends=('chrpath' 'clang' 'cmake' 'git' 'ninja' 'unzip' 'llvm-libs' 'llvm18-libs')
_commit=30c79e0a9fdb6cb57412e2b66b3eada03eaed3d0  # tags/1.9.4-pre^0
source=("git+https://github.com/GlitterWare/Passy.git#commit=${_commit}")
sha256sums=('SKIP')
# Required for Passy CLI
options=("!strip")

pkgver() {
  cd Passy
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd Passy
  git submodule init
  git config submodule.submodules/flutter.url "$srcdir/flutter"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd Passy
  export FLUTTER_HOME="${PWD}/submodules/flutter"
  export PATH="${FLUTTER_HOME}/bin:${PATH}"
  flutter --disable-analytics
  flutter pub get
  flutter build linux --dart-define=UPDATES_POPUP_ENABLED=false
}

package() {
  cd Passy

  if [ "$CARCH" == "aarch64" ]; then
    FLUTTER_ARCH=arm64
  else
    FLUTTER_ARCH=x64
  fi

  install -Dm755 "build/linux/${FLUTTER_ARCH}/release/bundle/$pkgname" -t \
    "$pkgdir/opt/$pkgname/"
  cp -r "build/linux/${FLUTTER_ARCH}/release/bundle"/{data,lib} "$pkgdir/opt/$pkgname"
  install -Dm755 "build/linux/${FLUTTER_ARCH}/release/bundle/${pkgname}"{_cli,_cli_native_messaging.sh} -t \
    "$pkgdir/opt/$pkgname/"
  install -Dm644 "build/linux/${FLUTTER_ARCH}/release/bundle/${pkgname}_cli_native_messaging.json" -t \
    "$pkgdir/opt/$pkgname/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/"
  ln -s "/opt/$pkgname/${pkgname}_cli" "$pkgdir/usr/bin/"

  install -Dm644 logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"
  install -Dm644 "linux_assets/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "linux_assets/${_app_id}.appdata.xml" -t "$pkgdir/usr/share/metainfo/"

  # Remove insecure RUNPATH pointing to build dir
  chrpath --delete "$pkgdir/opt/$pkgname"/lib/*.so
}
