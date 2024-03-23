# https://aur.archlinux.org/packages/passy
groups=('modified')

pkgname=passy
_app_id=com.glitterware.passy
pkgver=1.8.0
pkgrel=1
pkgdesc="Offline password manager with cross-platform synchronization"
arch=('x86_64' 'aarch64')
url="https://glitterware.github.io/Passy"
license=('GPL-3.0-or-later')
depends=('gtk3')
makedepends=('chrpath' 'clang' 'cmake' 'git' 'ninja' 'unzip')
_commit=7fee2f6210bb358e89a95f1d0dab625875f1c9d8  # tags/1.8.0^0
source=("git+https://github.com/GlitterWare/Passy.git#commit=${_commit}"
        'git+https://github.com/flutter/flutter.git')
sha256sums=('SKIP'
            'SKIP')

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

  if [ $CARCH == "aarch64" ]; then
    FLUTTER_ARCH=arm64
  else
    FLUTTER_ARCH=x64
  fi

  install -Dm755 "build/linux/${FLUTTER_ARCH}/release/bundle/$pkgname" -t \
    "$pkgdir/opt/$pkgname/"
  cp -r "build/linux/${FLUTTER_ARCH}/release/bundle"/{data,lib} "$pkgdir/opt/$pkgname"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/"

  install -Dm644 logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"
  install -Dm644 "linux_assets/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "linux_assets/${_app_id}.appdata.xml" -t "$pkgdir/usr/share/metainfo/"

  # Remove insecure RUNPATH pointing to build dir
  chrpath --delete "$pkgdir/opt/$pkgname"/lib/*.so
}
