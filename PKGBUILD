# Maintainer: VLDG2712 <ddutu10@gmail.com>
pkgname=nzxt-ctl-git
pkgver=r25.39c6b20
pkgrel=1
pkgdesc="Pump/fan curve control daemon and GUI for the NZXT Kraken 2023 (CAM replacement)"
arch=('x86_64')
url="https://github.com/VLDG2712/nzxt-ctl"
license=('GPL-3.0-or-later')
# GUI (Slint): fontconfig/freetype2 are linked; the windowing libraries
# are dlopened by winit at runtime, so namcap won't see them - listed here
# explicitly. X11 libraries are only needed outside a Wayland session.
depends=('fontconfig' 'freetype2' 'libxkbcommon' 'wayland' 'libglvnd')
makedepends=('git' 'cargo')
optdepends=('nvidia-utils: GPU temperature source via nvidia-smi'
            'libx11: GUI on X11 sessions'
            'libxcursor: GUI on X11 sessions'
            'libxi: GUI on X11 sessions'
            'libxkbcommon-x11: GUI on X11 sessions')
provides=('nzxt-ctl')
conflicts=('nzxt-ctl')
backup=('etc/nzxt-ctl/config.toml')
install=nzxt-ctl.install
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --workspace
}

package() {
  cd "$pkgname"

  install -Dm755 target/release/nzxt-ctl-daemon "$pkgdir/usr/bin/nzxt-ctl-daemon"
  install -Dm755 target/release/nzxt-ctl-gui "$pkgdir/usr/bin/nzxt-ctl-gui"

  # The repo unit points at /usr/local/bin for manual installs
  sed 's|/usr/local/bin|/usr/bin|' systemd/nzxt-ctl.service \
    | install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/nzxt-ctl.service"

  install -Dm644 systemd/nzxt-ctl-sysusers.conf "$pkgdir/usr/lib/sysusers.d/nzxt-ctl.conf"
  # tmpfiles hands the config to the nzxt-ctl group after sysusers creates
  # it, so the GUI can write curves without running as root
  install -Dm644 packaging/nzxt-ctl.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/nzxt-ctl.conf"

  install -Dm644 config/default.toml "$pkgdir/etc/nzxt-ctl/config.toml"

  install -Dm644 packaging/nzxt-ctl-gui.desktop "$pkgdir/usr/share/applications/nzxt-ctl-gui.desktop"

  install -Dm644 README.md "$pkgdir/usr/share/doc/nzxt-ctl/README.md"
  install -Dm644 INSTALL.md "$pkgdir/usr/share/doc/nzxt-ctl/INSTALL.md"
}
