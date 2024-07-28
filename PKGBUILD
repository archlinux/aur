# Maintainer:
# Contributor: X3n0m0rph59 <x3n0m0rph59@gmail.com>

## links
# https://eruption-project.org/
# https://github.com/X3n0m0rph59/eruption

## options
: ${_commit:=b0f3f80dad6ef9976b447992337c2483bbb3725a} # 0.3.6

## basic info
_pkgname='eruption'
pkgname='eruption'
pkgdesc='Realtime RGB LED Driver for Linux'
pkgver='0.3.6'
pkgrel='1'
url='https://github.com/X3n0m0rph59/eruption'
license=('GPL-3.0-or-later')
arch=('i686' 'x86_64')

depends=(
  'dbus'
  'gtksourceview4'
  'hidapi'
  'libevdev'
  'libpulse'
  'libusb'
  'lua'
  'lua-socket'
  'systemd-libs'
)
makedepends=(
  'cmake'
  'git'
  'gtk3'
  'libxrandr'
  'pkgconf'
  'protobuf'
  'rust'
  'xorg-server-devel'
)

backup=(
  'etc/eruption/audio-proxy.conf'
  'etc/eruption/eruption.conf'
  'etc/eruption/fx-proxy.conf'
  'etc/eruption/process-monitor.conf'
  'usr/share/eruption/scripts/lib/keymaps/default.keymap'
)

install='eruption.install'

_pkgsrc="$_pkgname-$_commit"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/archive/$_commit.$_pkgext")
sha256sums=('357ed6ab085e59ed0758553b11d54128dd411292400649eada9837cf319a3c68')

_cargo_env() {
  export CARGO_HOME="$SRCDEST/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  CFLAGS+=" -ffat-lto-objects"
}

prepare() {
  _cargo_env

  cd "$_pkgsrc"

  sed '/hidapi-rs\.git/s&branch=master&branch=main&' -i Cargo.lock */Cargo.lock
  sed '/hidapi-rs\.git/s&"master"&"main"&' -i *.toml */*.toml

  cargo update
}

build() {
  _cargo_env

  cd "$_pkgsrc"
  cargo build --release
}

package() {
  cd "$_pkgsrc"

  install -Dm755 "target/release/eruption" -t "$pkgdir/usr/bin/"
  install -Dm755 "target/release/eruptionctl" -t "$pkgdir/usr/bin/"
  install -Dm755 "target/release/eruption-hwutil" -t "$pkgdir/usr/bin/"
  install -Dm755 "target/release/eruption-macro" -t "$pkgdir/usr/bin/"
  install -Dm755 "target/release/eruption-keymap" -t "$pkgdir/usr/bin/"
  install -Dm755 "target/release/eruption-netfx" -t "$pkgdir/usr/bin/"
  install -Dm755 "target/release/eruption-cmd" -t "$pkgdir/usr/bin/"
  install -Dm755 "target/release/eruption-util" -t "$pkgdir/usr/bin/"
  install -Dm755 "target/release/eruption-debug-tool" -t "$pkgdir/usr/bin/"
  install -Dm755 "target/release/eruption-hotplug-helper" -t "$pkgdir/usr/bin/"
  install -Dm755 "target/release/eruption-fx-proxy" -t "$pkgdir/usr/bin/"
  install -Dm755 "target/release/eruption-audio-proxy" -t "$pkgdir/usr/bin/"
  install -Dm755 "target/release/eruption-process-monitor" -t "$pkgdir/usr/bin/"
  install -Dm755 "target/release/eruption-gui-gtk3" -t "$pkgdir/usr/bin/"

  install -Dm644 "support/assets/eruption-gui-gtk3/eruption-gui-gtk3.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "support/assets/eruption-gui-gtk3/eruption-gui.png" -t "$pkgdir/usr/share/pixmaps/"
  install -Dm644 "eruption-gui-gtk3/schemas/gschemas.compiled" -t "$pkgdir/usr/share/eruption-gui-gtk3/schemas/"

  install -Dm755 "support/systemd/eruption-suspend.sh" "$pkgdir/usr/lib/systemd/system-sleep/eruption"

  rm -f "support/config"/*-dev.conf
  install -Dm644 "support/config"/*.conf -t "$pkgdir/etc/eruption/"

  install -Dm644 "support/profile.d/eruption.sh" -t "$pkgdir/etc/profile.d/"

  install -Dm644 "support/systemd/eruption.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "support/systemd/eruption.preset" "$pkgdir/usr/lib/systemd/system-preset/50-eruption.preset"

  install -Dm644 "support/systemd/eruption-fx-proxy.service" -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 "support/systemd/eruption-fx-proxy.preset" "$pkgdir/usr/lib/systemd/user-preset/50-eruption-fx-proxy.preset"

  install -Dm644 "support/systemd/eruption-audio-proxy.service" -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 "support/systemd/eruption-audio-proxy.preset" "$pkgdir/usr/lib/systemd/user-preset/50-eruption-audio-proxy.preset"

  install -Dm644 "support/systemd/eruption-process-monitor.service" -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 "support/systemd/eruption-process-monitor.preset" "$pkgdir/usr/lib/systemd/user-preset/50-eruption-process-monitor.preset"

  install -Dm644 "support/systemd/eruption-hotplug-helper.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "support/systemd/eruption-hotplug-helper.preset" "$pkgdir/usr/lib/systemd/system-preset/50-eruption-hotplug-helper.preset"

  install -Dm644 "support/udev/99-eruption.rules" -t "$pkgdir/usr/lib/udev/rules.d/"

  install -Dm644 "support/dbus/org.eruption.control.conf" -t "$pkgdir/usr/share/dbus-1/system.d/"
  install -Dm644 "support/dbus/org.eruption.process_monitor.conf" -t "$pkgdir/usr/share/dbus-1/session.d/"
  install -Dm644 "support/dbus/org.eruption.fx_proxy.conf" -t "$pkgdir/usr/share/dbus-1/session.d/"

  install -Dm644 "support/policykit/org.eruption.policy" -t "$pkgdir/usr/share/polkit-1/actions/"

  rm -f "support/man"/pyroclasm*
  install -Dm644 "support/man"/*.8 -t "$pkgdir/usr/share/man/man8/"
  install -Dm644 "support/man"/*.5 -t "$pkgdir/usr/share/man/man5/"
  install -Dm644 "support/man"/*.1 -t "$pkgdir/usr/share/man/man1/"

  install -Dm644 "eruption/src/scripts"/*.lua -t "$pkgdir/usr/share/eruption/scripts/"
  install -Dm644 "eruption/src/scripts"/*.lua.manifest -t "$pkgdir/usr/share/eruption/scripts/"
  install -Dm644 "eruption/src/scripts"/examples/*.lua -t "$pkgdir/usr/share/eruption/scripts/examples/"
  install -Dm644 "eruption/src/scripts"/lib/*.lua -t "$pkgdir/usr/share/eruption/scripts/lib"
  install -Dm644 "eruption/src/scripts"/lib/*.lua.manifest -t "$pkgdir/usr/share/eruption/scripts/lib"
  install -Dm644 "eruption/src/scripts"/lib/hwdevices/keyboards/*.lua -t "$pkgdir/usr/share/eruption/scripts/lib/hwdevices/keyboards/"
  install -Dm644 "eruption/src/scripts"/lib/hwdevices/mice/*.lua -t "$pkgdir/usr/share/eruption/scripts/lib/hwdevices/mice/"
  install -Dm644 "eruption/src/scripts"/lib/hwdevices/misc/*.lua -t "$pkgdir/usr/share/eruption/scripts/lib/hwdevices/misc/"
  install -Dm644 "eruption/src/scripts"/lib/keymaps/*.keymap -t "$pkgdir/usr/share/eruption/scripts/lib/keymaps/"
  install -Dm644 "eruption/src/scripts"/lib/keymaps/*.lua -t "$pkgdir/usr/share/eruption/scripts/lib/keymaps/"
  install -Dm644 "eruption/src/scripts"/lib/macros/*.lua -t "$pkgdir/usr/share/eruption/scripts/lib/macros/"
  install -Dm644 "eruption/src/scripts"/lib/themes/*.lua -t "$pkgdir/usr/share/eruption/scripts/lib/themes/"

  install -Dm644 "support/sfx"/*.wav -t "$pkgdir/usr/share/eruption/sfx/"
  ln -sf "phaser1.wav" "$pkgdir/usr/share/eruption/sfx/key-down.wav"
  ln -sf "phaser2.wav" "$pkgdir/usr/share/eruption/sfx/key-up.wav"

  install -Dm644 "support/profiles"/*.profile -t "$pkgdir/var/lib/eruption/profiles/"

  install -Dm644 "support/shell/completions/en_US/eruption-cmd.bash-completion" "$pkgdir/usr/share/bash-completion/completions/eruption-cmd"
  install -Dm644 "support/shell/completions/en_US/eruption-hwutil.bash-completion" "$pkgdir/usr/share/bash-completion/completions/eruption-hwutil"
  install -Dm644 "support/shell/completions/en_US/eruption-debug-tool.bash-completion" "$pkgdir/usr/share/bash-completion/completions/eruption-debug-tool"
  install -Dm644 "support/shell/completions/en_US/eruption-macro.bash-completion" "$pkgdir/usr/share/bash-completion/completions/eruption-macro"
  install -Dm644 "support/shell/completions/en_US/eruption-keymap.bash-completion" "$pkgdir/usr/share/bash-completion/completions/eruption-keymap"
  install -Dm644 "support/shell/completions/en_US/eruption-netfx.bash-completion" "$pkgdir/usr/share/bash-completion/completions/eruption-netfx"
  install -Dm644 "support/shell/completions/en_US/eruption-fx-proxy.bash-completion" "$pkgdir/usr/share/bash-completion/completions/eruption-fx-proxy"
  install -Dm644 "support/shell/completions/en_US/eruption-audio-proxy.bash-completion" "$pkgdir/usr/share/bash-completion/completions/eruption-audio-proxy"
  install -Dm644 "support/shell/completions/en_US/eruption-process-monitor.bash-completion" "$pkgdir/usr/share/bash-completion/completions/eruption-process-monitor"
  install -Dm644 "support/shell/completions/en_US/eruptionctl.bash-completion" "$pkgdir/usr/share/bash-completion/completions/eruptionctl"

  install -Dm644 "support/shell/completions/en_US/eruption-cmd.fish-completion" "$pkgdir/usr/share/fish/completions/eruption-cmd.fish"
  install -Dm644 "support/shell/completions/en_US/eruption-hwutil.fish-completion" "$pkgdir/usr/share/fish/completions/eruption-hwutil.fish"
  install -Dm644 "support/shell/completions/en_US/eruption-debug-tool.fish-completion" "$pkgdir/usr/share/fish/completions/eruption-debug-tool.fish"
  install -Dm644 "support/shell/completions/en_US/eruption-macro.fish-completion" "$pkgdir/usr/share/fish/completions/eruption-macro.fish"
  install -Dm644 "support/shell/completions/en_US/eruption-keymap.fish-completion" "$pkgdir/usr/share/fish/completions/eruption-keymap.fish"
  install -Dm644 "support/shell/completions/en_US/eruption-netfx.fish-completion" "$pkgdir/usr/share/fish/completions/eruption-netfx.fish"
  install -Dm644 "support/shell/completions/en_US/eruption-fx-proxy.fish-completion" "$pkgdir/usr/share/fish/completions/eruption-fx-proxy.fish"
  install -Dm644 "support/shell/completions/en_US/eruption-audio-proxy.fish-completion" "$pkgdir/usr/share/fish/completions/eruption-audio-proxy.fish"
  install -Dm644 "support/shell/completions/en_US/eruption-process-monitor.fish-completion" "$pkgdir/usr/share/fish/completions/eruption-process-monitor.fish"
  install -Dm644 "support/shell/completions/en_US/eruptionctl.fish-completion" "$pkgdir/usr/share/fish/completions/eruptionctl.fish"

  install -Dm644 "support/shell/completions/en_US/eruption-cmd.zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_eruption-cmd"
  install -Dm644 "support/shell/completions/en_US/eruption-hwutil.zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_eruption-hwutil"
  install -Dm644 "support/shell/completions/en_US/eruption-debug-tool.zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_eruption-debug-tool"
  install -Dm644 "support/shell/completions/en_US/eruption-macro.zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_eruption-macro"
  install -Dm644 "support/shell/completions/en_US/eruption-keymap.zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_eruption-keymap"
  install -Dm644 "support/shell/completions/en_US/eruption-netfx.zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_eruption-netfx"
  install -Dm644 "support/shell/completions/en_US/eruption-fx-proxy.zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_eruption-fx-proxy"
  install -Dm644 "support/shell/completions/en_US/eruption-audio-proxy.zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_eruption-audio-proxy"
  install -Dm644 "support/shell/completions/en_US/eruption-process-monitor.zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_eruption-process-monitor"
  install -Dm644 "support/shell/completions/en_US/eruptionctl.zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_eruptionctl"
}
