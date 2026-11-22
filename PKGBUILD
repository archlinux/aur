# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=speedtest-librespeed
_app_id=xyz.ketok.Speedtest
pkgver=1.4.0
pkgrel=2
pkgdesc="A graphical librespeed client written using gtk4 + libadwaita"
arch=('any')
url="https://github.com/Ketok4321/speedtest"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'python-aiohttp'
  'python-cairo'
  'python-gobject'
)
makedepends=(
  'blueprint-compiler'
  'desktop-file-utils'
  'git'
  'meson'
)
checkdepends=('appstream')
source=("git+https://github.com/Ketok4321/speedtest.git#tag=v$pkgver")
sha256sums=('9707ff20d70a2961ed62bea99f7bb756bd0f7a209a042559a0d2bdbf6464438b')

build() {
  arch-meson speedtest build
  meson compile -C build
}

check() {

  # Only validate schema & desktop file
  meson test -C build "Validate schema file" "Validate desktop file" --no-rebuild --print-errorlogs

  # Use appstreamcli instead of failing with appstream-util
  appstreamcli validate --no-net "build/data/${_app_id}.metainfo.xml"
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  # Binary name conflicts with speedtest-cli & ookla-speedtest-bin
  desktop-file-edit --set-key=Exec --set-value="$pkgname" \
    "$pkgdir/usr/share/applications/${_app_id}.desktop"
  mv "$pkgdir/usr/bin/speedtest" "$pkgdir/usr/bin/$pkgname"
}
