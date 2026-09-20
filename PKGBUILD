# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in by .github/workflows/aur.yml for each release.
pkgname=spiral-file-manager
_name=spiral
pkgver=0.17.2
pkgrel=1
pkgdesc='File manager for Wayland with a file chooser portal backend'
arch=('x86_64' 'aarch64')
url='https://github.com/sachesi/spiral'
license=('GPL-3.0-or-later')
depends=('gtk4>=1:4.22' 'libadwaita>=1:1.9' 'gtksourceview5' 'glib2' 'libseccomp'
         'gstreamer' 'gst-plugins-base-libs' 'gst-plugins-base' 'gst-plugin-gtk4'
         'bubblewrap' 'xdg-desktop-portal' 'hicolor-icon-theme' 'libgcc' 'glibc')
makedepends=('cargo' 'blueprint-compiler' 'just' 'gettext')
optdepends=('glycin: decode pictures in glycin'\''s sandbox'
            'gst-plugins-good: play common video and sound formats'
            'gst-plugins-bad: play more video and sound formats'
            'gst-libav: play most other video and sound formats'
            'gvfs: network locations, the Trash folder and remembered folder views'
            'gvfs-smb: Windows shares'
            'gvfs-nfs: NFS shares'
            'poppler: PDF previews'
            '7zip: 7z archives'
            'unrar: RAR archives'
            'xdg-terminal-exec: Open in Terminal'
            'gnome-disk-utility: open drives in Disks')
conflicts=('spiral-git')
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('1aae67041478729e985ac8800a68025c4c8058ed0b04e4012cde0bb51ef21edb')

prepare() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export SPIRAL_LIBEXECDIR=/usr/lib/$_name
  export SPIRAL_LOCALEDIR=/usr/share/locale
  cargo build --frozen --release
}

check() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$_name-$pkgver"
  DESTDIR="$pkgdir" just prefix=/usr install
  # Arch keeps helpers in /usr/lib/<name>; this works with every release's justfile.
  install -d "$pkgdir/usr/lib/$_name"
  mv "$pkgdir"/usr/libexec/* "$pkgdir/usr/lib/$_name/"
  rmdir "$pkgdir/usr/libexec"
  sed -i "s|/usr/libexec/|/usr/lib/$_name/|" \
    "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.spiral.service" \
    "$pkgdir/usr/share/applications/xdg-desktop-portal-spiral.desktop"
  # Releases up to 0.17.0 build the caches even in a staged install; pacman's hooks own them.
  rm -f "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled" \
    "$pkgdir/usr/share/applications/mimeinfo.cache" \
    "$pkgdir/usr/share/icons/hicolor/icon-theme.cache"
}
