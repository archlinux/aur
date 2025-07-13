# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: RadioactiveRadio <barraiser59@gmail.com>
pkgname=blue-recorder-git
_app_id=sa.sy.bluerecorder
pkgver=r202.dfdb73e
pkgrel=1
pkgdesc="Simple Screen Recorder written in Rust based on Green Recorder"
arch=('x86_64')
url="https://github.com/xlmnxp/blue-recorder"
license=('GPL-3.0-or-later')
depends=(
  'ffmpeg'
  'gstreamer'
  'gtk4'
  'libappindicator-gtk3'
  'xorg-xwininfo'
)
makedepends=(
  'cargo'
  'clang'
  'git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
#options=('!lto')  # gettext-sys crate fails with LTO enabled
source=('git+https://github.com/xlmnxp/blue-recorder.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"

  # We don't care if it builds on Ubuntu 20.04 or not
  git revert --no-commit ee02a8f0ba930e6e0f9a96636ea95b80fb4695c1

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  CFLAGS+=" -ffat-lto-objects"
  export GETTEXT_SYSTEM=true
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "target/release/${pkgname%-git}" -t "$pkgdir/opt/${pkgname%-git}/"
  install -Dm644 interfaces/main.ui -t "$pkgdir/opt/${pkgname%-git}/interfaces/"
  install -Dm644 "data/${pkgname%-git}.desktop" \
    "$pkgdir/usr/share/applications/${_app_id}.desktop"
  install -Dm644 "data/${pkgname%-git}.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "data/${pkgname%-git}.png" -t \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
  install -Dm644 "data/${pkgname%-git}@x96.png" \
    "$pkgdir/usr/share/icons/hicolor/96x96/apps/${pkgname%-git}.png"
  install -Dm644 "data/${pkgname%-git}@x128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/${pkgname%-git}.png"
  install -Dm644 data/screenshot-ui-{area,display,window}-{symbolic,symbolic-white}.svg -t \
    "$pkgdir/usr/share/icons/hicolor/symbolic/actions/"
  install -Dm644 "flatpak/sa.sy.bluerecorder.metainfo.xml" -t \
    "$pkgdir/usr/share/metainfo/"

  # Fails to run without these files in these specific locations
  install -Dm644 "data/${pkgname%-git}@x96.png" -t \
    "$pkgdir/opt/${pkgname%-git}/data/"
  install -Dm644 data/screenshot-ui-{area,display,window}-{symbolic,symbolic-white}.svg -t \
    "$pkgdir/opt/${pkgname%-git}/data/"
  install -Dm644 po/*.po -t "$pkgdir/opt/${pkgname%-git}/po/"

  cd po
  for lang in $(ls *.po); do
    echo "lang: ${lang}"
    lang=${lang::-3}
    install -d "$pkgdir/usr/share/locale/${lang//_/-}/LC_MESSAGES"
    msgfmt -c -o "$pkgdir/usr/share/locale/${lang//_/-}/LC_MESSAGES/${pkgname%-git}.mo" "${lang}.po"
  done

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-git}/${pkgname%-git}" "$pkgdir/usr/bin/"
}
