# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=musicpod-git
_app_id=org.feichtmeier.Musicpod
pkgver=1.1.0.r3.ge190e3e
pkgrel=1
_flutter_ver=3.19.3
pkgdesc="Music, radio, television and podcast player"
arch=('x86_64' 'aarch64')
url="https://github.com/ubuntu-flutter-community/musicpod"
license=('GPL-3.0-or-later')
depends=('gstreamer' 'gtk3' 'mpv')
makedepends=('chrpath' 'clang' 'cmake' 'git' 'ninja')
checkdepends=('appstream')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/ubuntu-flutter-community/musicpod.git'
        "flutter-${_flutter_ver}.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${_flutter_ver/.hotfix/+hotfix}-stable.tar.xz")
sha256sums=('SKIP'
            'ddb712be586281afd51a3f96db3681f99f242278201e0ae3322c03706e4004ad')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
  appstreamcli validate --no-net "flatpak/${_app_id}.appdata.xml"
  desktop-file-validate "flatpak/${_app_id}.desktop"
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
