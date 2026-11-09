# Maintainer: Keith Vassallo <keith@vassallo.cloud>
# SPDX-License-Identifier: GPL-3.0-or-later
#
# Backtrack on the AUR (S13-T8), split three ways as the RPM and the deb are:
# the window, daemon, tray and CLI, then each file manager's integration in
# a package of its own. Split rather than optional dependencies because the
# window decides whether an integration is installed by looking for its file,
# and a Nautilus extension shipped without nautilus-python would report one
# that does nothing.
#
# _version is a version location: `just bump-version` sets it, as tagged.
# pkgver is Arch's form of it, which allows no hyphen: 0.1.0-rc1 becomes
# 0.1.0rc1, which pacman sorts before 0.1.0. The checksum is
# filled in by `just release` in the AUR's own repository; this copy carries
# none, so a release leaves nothing to commit here.

pkgbase=backtrack
pkgname=(backtrack backtrack-nautilus backtrack-dolphin)
_version=0.1.2
pkgver=${_version//-/}
pkgrel=1
pkgdesc='Browse your files as they were: backups you can step back through, built on Borg'
arch=(x86_64 aarch64)
url='https://backtrack.tools'
license=(GPL-3.0-or-later)
# The libraries the window is linked against. namcap also asks for borg,
# dolphin, python and python-nautilus here, as it does for every split package's
# dependencies; they are needed only at run time, and installing a desktop's
# file manager to build a package that does not link against it buys nothing.
makedepends=(cargo glib2 gtk4 libadwaita)
# The libraries the window is linked against. namcap also asks for borg, compiles the SQLite that rusqlite bundles to GCC's LTO
# bytecode, which Rust's linker cannot read: every sqlite3_* symbol is then
# undefined. Rust code is unaffected; this turns it off for the C.
options=(!lto)
source=("$pkgbase-$_version.tar.gz::https://github.com/keithvassallomt/backtrack/archive/refs/tags/v$_version.tar.gz")
sha256sums=('8946068957e1237b5606e17eb596e4242d322974a0b694994d7bca6a8ffbdb9f')

prepare() {
  cd "$pkgbase-$_version"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgbase-$_version"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The three packages in one build, so their shared crates are compiled with
  # the same features (see `just install-units`).
  cargo build --frozen --release -p backtrackd -p backtrack-gtk -p backtrack-cli
}

# What namcap says of the built packages, beyond the split-package rule above,
# and why it stands: "unused shared library ld-linux", because Rust links the
# dynamic loader by name; borg "may not be needed", because the daemon runs it
# as a program, which namcap cannot see, and likewise the integrations'
# dependencies, which their file managers load; the Nautilus extension's
# gi.repository modules, which GObject introspection loads from typelibs
# that namcap cannot trace to a package; the -debug package's
# symlinks into usr/bin, which point into backtrack, checked on its own; and
# its empty usr/src/debug/backtrack, since makepkg copies no Rust sources
# there.
package_backtrack() {
  depends=(borg cairo glib2 glibc gtk4 hicolor-icon-theme libadwaita libgcc pango)
  optdepends=('backtrack-nautilus: Restore Previous Version in GNOME Files'
              'backtrack-dolphin: Restore Previous Version in Dolphin'
              'gvfs-smb: SMB shares as backup destinations')

  cd "$pkgbase-$_version"
  install -Dm755 -t "$pkgdir/usr/bin" \
    target/release/backtrackd target/release/backtrack-gtk \
    target/release/backtrack-tray target/release/backtrack \
    packaging/snapper/backtrack-snapper-setup
  # No install scriptlet enables the unit: the daemon enables its own when
  # "Run in background" is on (background::apply).
  install -Dm644 -t "$pkgdir/usr/lib/systemd/user" packaging/systemd/backtrackd.service
  install -Dm644 -t "$pkgdir/usr/share/dbus-1/services" \
    packaging/dbus/tools.backtrack.Backtrack.Daemon1.service \
    packaging/dbus/tools.backtrack.Backtrack.service
  install -Dm644 -t "$pkgdir/usr/share/applications" packaging/desktop/tools.backtrack.Backtrack.desktop
  install -Dm644 -t "$pkgdir/usr/share/metainfo" packaging/tools.backtrack.Backtrack.metainfo.xml
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps" \
    packaging/icons/hicolor/scalable/apps/tools.backtrack.Backtrack.svg
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps" \
    packaging/icons/hicolor/symbolic/apps/tools.backtrack.Backtrack-symbolic.svg \
    packaging/icons/hicolor/symbolic/apps/tools.backtrack.Backtrack-tray-symbolic.svg
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/symbolic/actions" \
    packaging/icons/hicolor/symbolic/actions/tools.backtrack.Backtrack-rewind-symbolic.svg
  install -Dm644 -t "$pkgdir/etc/xdg/autostart" packaging/autostart/backtrack-tray.desktop
}

package_backtrack-nautilus() {
  pkgdesc='Restore Previous Version in GNOME Files, for Backtrack'
  arch=(any)
  depends=(backtrack glib2 python python-gobject python-nautilus)

  cd "$pkgbase-$_version"
  install -Dm644 -t "$pkgdir/usr/share/nautilus-python/extensions" integrations/nautilus/backtrack.py
}

package_backtrack-dolphin() {
  pkgdesc='Restore Previous Version in Dolphin, for Backtrack'
  arch=(any)
  depends=(backtrack dolphin)

  cd "$pkgbase-$_version"
  install -Dm644 -t "$pkgdir/usr/share/kio/servicemenus" \
    integrations/dolphin/backtrack.desktop integrations/dolphin/backtrack-folder.desktop \
    integrations/dolphin/backtrack-file.desktop
}
