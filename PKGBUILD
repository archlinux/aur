# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=musicpod-git
_app_id=org.feichtmeier.Musicpod
pkgver=r802.e051973
pkgrel=1
_flutter_ver=3.16.8
pkgdesc="Music, radio, television and podcast player"
arch=('x86_64')
url="https://github.com/ubuntu-flutter-community/musicpod"
license=('GPL-3.0-or-later')
depends=('gstreamer' 'gtk3' 'mpv')
makedepends=('chrpath' 'clang' 'cmake' 'git' 'ninja')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/ubuntu-flutter-community/musicpod.git'
        "flutter-${_flutter_ver}.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${_flutter_ver/.hotfix/+hotfix}-stable.tar.xz")
sha256sums=('SKIP'
            '7cb12032cf615a92a7bc9042100f3f2af62df7df3ca3bee27f4b153fe218b239')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  export FLUTTER_HOME="$srcdir/flutter"
  export PATH="${PATH}:${FLUTTER_HOME}/bin:"
  flutter pub get
  flutter build linux
}

check() {
  cd "${pkgname%-git}"
  appstream-util validate-relax --nonet "flatpak/${_app_id}.appdata.xml"
  desktop-file-validate "flatpak/${_app_id}.desktop"
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "build/linux/x64/release/bundle/${pkgname%-git}" -t \
    "$pkgdir/opt/${pkgname%-git}/"
  cp -r build/linux/x64/release/bundle/{data,lib} "$pkgdir/opt/${pkgname%-git}"

  for i in 64 128; do
    install -Dm644 "flatpak/icon${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/${_app_id}.png"
  done

  install -Dm644 "flatpak/${_app_id}.appdata.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "flatpak/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-git}/${pkgname%-git}" "$pkgdir/usr/bin/"

  # Remove insecure RUNPATH pointing to build dir
  chrpath --delete "$pkgdir/opt/${pkgname%-git}"/lib/*.so
}
