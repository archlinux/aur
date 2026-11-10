pkgbase=neon-lasertag
pkgname=('neon-lasertag' 'neon-lasertag-server')
pkgver=0.4.0
pkgrel=1
pkgdesc='Red vs Blue lasertag in procedurally generated neon arenas, in VR or on the flat screen'
arch=('x86_64' 'aarch64')
url='https://github.com/dividebysandwich/neon-lasertag'
license=('LicenseRef-unknown')
makedepends=('cargo' 'alsa-lib' 'libx11' 'libxcursor' 'libxi' 'libxkbcommon' 'libxrandr'
             'systemd-libs' 'vulkan-icd-loader' 'wayland')
options=('!lto')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'neon-lasertag-server.service'
        'neon-lasertag-server.conf')
sha256sums=('570070dd5ddea51e19290c01ecc19958fe7cf3355c489b10e76994052b46f127'
            '6154f26c3bbebc23bc454d68f5044dbee6a5fd3025cda1efddd5cb8b27045c0c'
            'b6a954668df79eeeb9923c6123a2fdbd97671c199f3ee2fa1d2ec273e9cef354')

prepare() {
  cd "$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Release builds drop the default `dev` feature (bevy/dynamic_linking).
  cargo build --frozen --release -p neon-lasertag -p lt-server --no-default-features \
    --features neon-lasertag/xr
}

package_neon-lasertag() {
  depends=('alsa-lib' 'glibc' 'hicolor-icon-theme' 'libx11' 'libxcursor' 'libxi' 'libgcc'
           'libxkbcommon' 'libxrandr' 'systemd-libs' 'vulkan-icd-loader' 'wayland')
  optdepends=('openxr: VR headset support (--vr)'
              'neon-lasertag-server: dedicated server')

  cd "$pkgbase-$pkgver"
  install -Dm755 target/release/neon-lasertag -t "$pkgdir/usr/lib/$pkgname/"
  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r --no-preserve=ownership assets "$pkgdir/usr/share/$pkgname/"

  # The game reads its assets from $BEVY_ASSET_ROOT; settings go to $XDG_CONFIG_HOME/lasertag.
  # Started from a launcher rather than a terminal, the log goes to $XDG_STATE_HOME/lasertag.
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" <<WRAPPER
#!/bin/sh
export BEVY_ASSET_ROOT="\${BEVY_ASSET_ROOT:-/usr/share/$pkgname}"
if [ ! -t 2 ]; then
    logdir="\${XDG_STATE_HOME:-\$HOME/.local/state}/lasertag"
    if mkdir -p "\$logdir" 2> /dev/null; then
        NO_COLOR=1 exec /usr/lib/$pkgname/$pkgname "\$@" > "\$logdir/lasertag.log" 2>&1
    fi
fi
exec /usr/lib/$pkgname/$pkgname "\$@"
WRAPPER
  chmod 755 "$pkgdir/usr/bin/$pkgname"

  install -Dm644 packaging/linux/lasertag.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 packaging/linux/lasertag.png -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_neon-lasertag-server() {
  pkgdesc='Dedicated server for Neon Lasertag'
  depends=('glibc' 'libgcc')
  backup=('etc/conf.d/neon-lasertag-server')

  cd "$pkgbase-$pkgver"
  install -Dm755 target/release/lt-server "$pkgdir/usr/bin/neon-lasertag-server"
  install -Dm644 "$srcdir/neon-lasertag-server.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "$srcdir/neon-lasertag-server.conf" "$pkgdir/etc/conf.d/neon-lasertag-server"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
