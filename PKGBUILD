# Maintainer: sgtaziz <sgtaziz013 at gmail dot com>
pkgname=lianli-linux
pkgver=1.2.3
pkgrel=1
pkgdesc="Open-source Linux replacement for L-Connect 3 for Lian Li devices"
arch=('x86_64')
url="https://github.com/sgtaziz/lian-li-linux"
license=('MIT' 'GPL-2.0-only WITH Linux-syscall-note')
depends=('cairo' 'dbus' 'ffmpeg' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgcc' 'libsoup3'
         'libstdc++' 'libusb' 'systemd-libs' 'webkit2gtk-4.1')
optdepends=('evdi-dkms: EVDI desktop mode (userspace library and kernel module)' 'polkit: administrator authorization for service mode switching')
makedepends=('cargo' 'clang' 'cmake' 'nasm' 'npm')
conflicts=('lianli-linux-git')
# Submodule commits referenced by the v$pkgver tag; GitHub tag archives omit them.
_tinyuz=1d74ffa4d453796df352df470733f45dfa099bb1
_hdiffpatch=3b9dca715ca492873bf2c49e22e5d5b7d2a78620
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "tinyuz-$_tinyuz.tar.gz::https://github.com/sisong/tinyuz/archive/$_tinyuz.tar.gz"
        "HDiffPatch-$_hdiffpatch.tar.gz::https://github.com/sisong/HDiffPatch/archive/$_hdiffpatch.tar.gz")
sha256sums=('c7612709455d9eb4b7940cfaf5acc0ee6209327e57fe22e5686302716b09bee7'
            '307558ad57549d8ad55ba77add19cfca2e384c0857dfd4b6c2ff82b95172a033'
            '62378965f548feaf5d5c3e1e2e65e985fae33ff4c87432cb42e60250d7e0d670')
options=('!lto' '!debug')

prepare() {
  cd lian-li-linux-$pkgver
  rmdir vendor/tinyuz vendor/HDiffPatch
  mv "$srcdir/tinyuz-$_tinyuz" vendor/tinyuz
  mv "$srcdir/HDiffPatch-$_hdiffpatch" vendor/HDiffPatch
  cargo fetch --locked --target host-tuple
  npm ci --prefix crates/lianli-gui --cache "$srcdir/npm-cache" --no-audit --no-fund
}

build() {
  cd lian-li-linux-$pkgver

  export CARGO_TARGET_DIR=target
  npm run build --prefix crates/lianli-gui
  cargo build --frozen --release
}

package() {
  cd lian-li-linux-$pkgver

  # Binaries
  install -Dm755 target/release/lianli-daemon "$pkgdir/usr/bin/lianli-daemon"
  install -Dm755 target/release/lianli-gui "$pkgdir/usr/bin/lianli-gui"
  install -Dm755 target/release/lianli-session "$pkgdir/usr/bin/lianli-session"
  install -Dm755 target/release/lianli-control "$pkgdir/usr/bin/lianli-control"
  install -Dm644 packaging/systemd/lianli-session.service "$pkgdir/usr/lib/systemd/user/lianli-session.service"
  install -d "$pkgdir/usr/lib/systemd/user/default.target.wants"
  ln -s ../lianli-session.service "$pkgdir/usr/lib/systemd/user/default.target.wants/lianli-session.service"
  install -Dm644 packaging/desktop/com.sgtaziz.lianlilinux.session.desktop "$pkgdir/etc/xdg/autostart/com.sgtaziz.lianlilinux.session.desktop"

  # udev rules
  install -Dm644 packaging/udev/60-lianli.rules "$pkgdir/usr/lib/udev/rules.d/60-lianli.rules"

  # System user/group for the optional system service
  install -Dm644 packaging/sysusers.d/lianli.conf "$pkgdir/usr/lib/sysusers.d/lianli.conf"

  # Shared cross-mode lock file (prevents user + system daemons running at once)
  install -Dm644 packaging/tmpfiles.d/lianli.conf "$pkgdir/usr/lib/tmpfiles.d/lianli.conf"

  # Systemd services: per-user + system service, user enables either
  install -Dm644 packaging/systemd/lianli-daemon.service "$pkgdir/usr/lib/systemd/user/lianli-daemon.service"
  install -Dm644 packaging/systemd/lianli-daemon-system.service "$pkgdir/usr/lib/systemd/system/lianli-daemon-system.service"
  install -Dm644 packaging/systemd/lianli-control-recovery.service "$pkgdir/usr/lib/systemd/system/lianli-control-recovery.service"
  install -d "$pkgdir/usr/lib/systemd/system/multi-user.target.wants"
  ln -s ../lianli-control-recovery.service "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/lianli-control-recovery.service"
  install -Dm644 packaging/polkit/49-lianli-recovery.rules "$pkgdir/usr/share/polkit-1/rules.d/49-lianli-recovery.rules"
  install -Dm644 packaging/desktop/com.sgtaziz.lianlilinux.recovery.desktop "$pkgdir/etc/xdg/autostart/com.sgtaziz.lianlilinux.recovery.desktop"

  # Auto-load the evdi kernel module at boot so udev can grant user access to it
  install -Dm644 packaging/modules-load.d/lianli-evdi.conf "$pkgdir/usr/lib/modules-load.d/lianli-evdi.conf"

  # Desktop entry
  install -Dm644 packaging/desktop/com.sgtaziz.lianlilinux.desktop "$pkgdir/usr/share/applications/com.sgtaziz.lianlilinux.desktop"
  install -Dm644 packaging/desktop/com.sgtaziz.lianlilinux.metainfo.xml "$pkgdir/usr/share/metainfo/com.sgtaziz.lianlilinux.metainfo.xml"
  install -d "$pkgdir/usr/share/man/man1"
  install -m644 packaging/man/*.1 "$pkgdir/usr/share/man/man1/"

  # Icons
  install -Dm644 assets/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/com.sgtaziz.lianlilinux.png"
  install -Dm644 assets/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/com.sgtaziz.lianlilinux.png"
  install -Dm644 assets/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.sgtaziz.lianlilinux.png"
  install -Dm644 assets/icons/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.sgtaziz.lianlilinux.svg"

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 crates/lianli-display/src/hermes/UAPI-LICENSE "$pkgdir/usr/share/licenses/$pkgname/Hermes-KMS-UAPI-LICENSE"
}
