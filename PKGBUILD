# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=musicpod-git
_app_id=org.feichtmeier.Musicpod
pkgver=r741.cbe57c7
pkgrel=1
_flutter_ver=3.16.5
pkgdesc="Music, radio, television and podcast player"
arch=('x86_64')
url="https://github.com/ubuntu-flutter-community/musicpod"
license=('GPL3')
depends=('gstreamer' 'gtk3' 'mpv')
makedepends=('clang' 'cmake' 'git' 'ninja')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/ubuntu-flutter-community/musicpod.git'
        "flutter-${_flutter_ver}.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${_flutter_ver/.hotfix/+hotfix}-stable.tar.xz")
sha256sums=('SKIP'
            '57e59fa3a31be7e87b3847cdf782f1323578bbf70a0cd35f3615f01ab429ac29')

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
}
