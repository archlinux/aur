# Maintainer: Saiem Saeed <saiem.saeed7 at gmail dot com>

pkgname=sayall-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='Linux voice dictation application and CLI (prebuilt)'
arch=('x86_64')
url='https://github.com/saiemsaeed/sayall'
license=('MIT')
depends=(
  'ca-certificates'
  'gcc-libs'
  'glibc'
  'gtk4'
  'gtk4-layer-shell'
  'libnotify'
  'pipewire-audio'
  'wl-clipboard'
  'wtype'
  'xdotool'
  'xsel'
)
provides=("sayall=$pkgver")
conflicts=('sayall' 'sayall-src' 'sayall-git')
options=('!debug')
install='sayall-bin.install'
source=("sayall-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/sayall-$pkgver-linux-x86_64.tar.gz")
sha256sums=('99587f875d3c26d8638c14cc8631c8df1e5ceba554a75b62b8884b855a9b9751')

package() {
  local src="$srcdir/sayall-$pkgver-linux-x86_64"

  [[ $("$src/bin/sayall" --version) == "sayall $pkgver" ]]
  [[ $("$src/bin/sayall-hud" --version) == "sayall-hud $pkgver" ]]
  [[ $("$src/lib/sayall/sayall-process" --version) == "sayall-process $pkgver" ]]

  install -Dm755 -t "$pkgdir/usr/bin" \
    "$src/bin/sayall" \
    "$src/bin/sayall-hud"
  install -Dm755 "$src/lib/sayall/sayall-process" \
    "$pkgdir/usr/lib/sayall/sayall-process"

  install -Dm644 "$src/share/applications/dev.sayall.Hud.desktop" \
    "$pkgdir/usr/share/applications/dev.sayall.Hud.desktop"
  install -Dm644 "$src/share/icons/hicolor/scalable/apps/dev.sayall.Hud.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.sayall.Hud.svg"
  install -Dm644 "$src/share/systemd/user/sayall-hud.service" \
    "$pkgdir/usr/lib/systemd/user/sayall-hud.service"
  sed -i 's|ExecStart=%h/.local/bin/|ExecStart=/usr/bin/|' \
    "$pkgdir/usr/lib/systemd/user/sayall-hud.service"

  install -Dm644 -t "$pkgdir/usr/share/doc/sayall" \
    "$src/share/doc/sayall/README.md" \
    "$src/share/doc/sayall/CHANGELOG.md"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$src/share/licenses/sayall/"*
}
