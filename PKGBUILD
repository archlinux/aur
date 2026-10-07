# Maintainer: vaishnav <vaishnav.sabari.girish@gmail.com>

pkgname=gtm-player-bin
_pkgname=gtm
pkgver=0.2.88
pkgrel=2
pkgdesc='Reimagined terminal audio player with background daemon, YouTube/Spotify, radio and podcasts (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://gtmd.dev'
license=('GPL-3.0-only')
depends=('alsa-lib' 'dbus' 'gcc-libs' 'glibc')
optdepends=('yt-dlp: download YouTube audio and resolve Spotify tracks for offline playback'
  'ffmpeg: audio conversion for downloaded tracks'
  'pipewire-alsa: PipeWire audio output through the ALSA backend')
provides=('gtm-player')
conflicts=('gtm-player')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/prjctimg/gtm/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-arch-x86_64-$pkgver.tar.gz::https://github.com/prjctimg/gtm/releases/download/v$pkgver/gtm-arch-x86_64.tar.gz")
source_aarch64=("$_pkgname-arch-aarch64-$pkgver.tar.gz::https://github.com/prjctimg/gtm/releases/download/v$pkgver/gtm-arch-aarch64.tar.gz")
sha256sums=('74baee093d1aaf8c77670ceafecb2185b4ce18cbd3e4237e9cac60617f3b5d20')
sha256sums_x86_64=('b7c5cb3bbe75606e8681504a55a83b13216ed86bd136f5f001958466863ae875')
sha256sums_aarch64=('10e2cdfb5809cb4eee2a94d338e5a4b5d70dd2b03ac0242508b5a58dcfcbecbc')

package() {
  cd "$srcdir/$_pkgname-arch-$CARCH"

  # Binaries
  install -Dm755 bin/gtm "$pkgdir/usr/bin/gtm"
  install -Dm755 bin/gtmd "$pkgdir/usr/bin/gtmd"

  # Man pages
  install -Dm644 man/man1/gtm.1 "$pkgdir/usr/share/man/man1/gtm.1"
  install -Dm644 man/man1/gtmd.1 "$pkgdir/usr/share/man/man1/gtmd.1"
  install -Dm644 man/man1/gtmd-ipc.1 "$pkgdir/usr/share/man/man1/gtmd-ipc.1"

  # Shell completions (bash, zsh, fish)
  install -Dm644 completions/gtm.bash "$pkgdir/usr/share/bash-completion/completions/gtm"
  install -Dm644 completions/gtmd.bash "$pkgdir/usr/share/bash-completion/completions/gtmd"
  install -Dm644 completions/_gtm "$pkgdir/usr/share/zsh/site-functions/_gtm"
  install -Dm644 completions/_gtmd "$pkgdir/usr/share/zsh/site-functions/_gtmd"
  install -Dm644 completions/gtm.fish "$pkgdir/usr/share/fish/vendor_completions.d/gtm.fish"
  install -Dm644 completions/gtmd.fish "$pkgdir/usr/share/fish/vendor_completions.d/gtmd.fish"

  # systemd user unit, pointed at the packaged binary path
  install -Dm644 systemd/gtmd.service "$pkgdir/usr/lib/systemd/user/gtmd.service"
  sed -i 's|^ExecStart=[^ ]*gtmd\b|ExecStart=/usr/bin/gtmd|' \
    "$pkgdir/usr/lib/systemd/user/gtmd.service"

  # Desktop entry and icon
  install -Dm644 desktop/gtm.desktop "$pkgdir/usr/share/applications/gtm.desktop"
  install -Dm644 icons/gtm.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/gtm.svg"

  # License
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
