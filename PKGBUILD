# Maintainer: Andrea Di Saverio <disaverio [dot] andrea [at] gmail [dot] com>

pkgname=wayshot-gnome
_pkgname=wayshot
_app_id=io.github.gutopardini.wayshot

pkgver=0.2.0
pkgrel=1

pkgdesc="Fast screenshot and annotation tool for GNOME on Wayland"
arch=('x86_64')
url="https://github.com/gutopardini/wayshot"
license=('MIT')

depends=(
  'bash'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
  'libgcc'
  'wl-clipboard'
  'xdg-desktop-portal-gnome'
)

makedepends=(
  'cargo'
)

checkdepends=(
  'appstream'
  'desktop-file-utils'
)

conflicts=(
  'wayshot'
  'wayshot-bin'
  'wayshot-git'
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=('41fdf7f127e584a39de2a156fca852f714e14f4a2677f7f9dfc2d5dcc0794702')

prepare() {
  cd "$_pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo-home"

  cargo fetch \
    --locked \
    --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release
}

check() {
  cd "$_pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target

  cargo test --frozen

  desktop-file-validate \
    "data/${_app_id}.desktop"

  appstreamcli validate --no-net \
    "data/${_app_id}.metainfo.xml"
}

package() {
  cd "$_pkgname-$pkgver"

  install -Dm755 \
    target/release/wayshot \
    "$pkgdir/usr/bin/wayshot"

  install -Dm755 \
    scripts/wayshot-gnome-capture \
    "$pkgdir/usr/bin/wayshot-gnome-capture"

  install -Dm644 \
    "data/${_app_id}.desktop" \
    "$pkgdir/usr/share/applications/${_app_id}.desktop"

  install -Dm644 \
    "data/${_app_id}.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/${_app_id}.metainfo.xml"

  install -Dm644 \
    assets/icons/wayshot-icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"

  for size in 256 512 1024; do
    install -Dm644 \
      "assets/app-icons/${size}x${size}/apps/${_app_id}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/${_app_id}.png"
  done

  install -Dm644 \
    LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
