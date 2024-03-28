# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=musicpod-git
_app_id=org.feichtmeier.Musicpod
pkgver=1.3.1.r3.g9ba506e
pkgrel=1
_flutter_ver=3.19.5
pkgdesc="Music, radio, television and podcast player"
arch=('x86_64' 'aarch64')
url="https://github.com/ubuntu-flutter-community/musicpod"
license=('GPL-3.0-or-later')
depends=('gstreamer' 'gtk3' 'mpv')
#makedepends=('chrpath' 'clang' 'cmake' 'git' 'ninja')
makedepends=('clang' 'cmake' 'git' 'ninja')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/ubuntu-flutter-community/musicpod.git'
        "flutter-${_flutter_ver}.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${_flutter_ver/.hotfix/+hotfix}-stable.tar.xz")
sha256sums=('SKIP'
            '6590607e7f2fb23bcc7e0a2d6aac292f9208cbf12a40862c281058c758604fb3')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  desktop-file-edit  --set-icon="${pkgname%-git}" "snap/gui/${pkgname%-git}.desktop"
}

build() {
  cd "${pkgname%-git}"
  export FLUTTER_HOME="$srcdir/flutter"
  export PATH="${FLUTTER_HOME}/bin:${PATH}"
  flutter --disable-analytics
  flutter pub get
  flutter build linux
}

check() {
  cd "${pkgname%-git}"
  desktop-file-validate "snap/gui/${pkgname%-git}.desktop"
}

package() {
  cd "${pkgname%-git}"

  if [ $CARCH == "aarch64" ]; then
    FLUTTER_ARCH=arm64
  else
    FLUTTER_ARCH=x64
  fi

  install -Dm755 "build/linux/${FLUTTER_ARCH}/release/bundle/${pkgname%-git}" -t \
    "$pkgdir/opt/${pkgname%-git}/"
  cp -r build/linux/${FLUTTER_ARCH}/release/bundle/{data,lib} "$pkgdir/opt/${pkgname%-git}"

  install -Dm644 "snap/gui/${pkgname%-git}.png" -t "$pkgdir/usr/share/pixmaps/"
  install -Dm644 "snap/gui/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-git}/${pkgname%-git}" "$pkgdir/usr/bin/"

  # Remove insecure RUNPATH pointing to build dir
#  chrpath --delete "$pkgdir/opt/${pkgname%-git}"/lib/*.so
}
