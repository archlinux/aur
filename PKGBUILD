# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=musicpod-git
_app_id=org.feichtmeier.Musicpod
pkgver=1.4.4.r0.gb73b97f
pkgrel=1
pkgdesc="Music, radio, television and podcast player"
arch=('x86_64' 'aarch64')
url="https://github.com/ubuntu-flutter-community/musicpod"
license=('GPL-3.0-or-later')
depends=('gstreamer' 'gtk3' 'mpv')
#makedepends=('chrpath' 'clang' 'cmake' 'fvm' 'git' 'ninja')
makedepends=('clang' 'cmake' 'fvm' 'git' 'ninja')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/ubuntu-flutter-community/musicpod.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm install 3.22.0
  fvm global 3.22.0

  # Disable analytics
  fvm flutter --disable-analytics

  # Pull dependencies within prepare, allowing for offline builds later on
  fvm flutter pub get

  desktop-file-edit  --set-icon="${pkgname%-git}" "snap/gui/${pkgname%-git}.desktop"
}

build() {
  cd "${pkgname%-git}"
  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm flutter build linux
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
