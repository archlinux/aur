# Maintainer: xiryuu <farrel2008ganteng@protonmail.com>
# Prerelease channel: tracks upstream releases that are marked prerelease
# (e.g. v1.4.0-rc.6). Upstream publishes no .deb for these, only an AppImage.
pkgname=limusic-bin-prerelease
_pkgname=limusic
pkgver=1.4.0rc.6
pkgrel=2
# Upstream tag without the leading "v"; pkgver drops the hyphen because Arch
# forbids it (and 1.4.0rc.6 correctly sorts before 1.4.0).
_tag=1.4.0-rc.6
pkgdesc="Feature rich, native desktop, YouTube Music client (prerelease channel). Tauri + Rust + SvelteKit, ad-free playback through libmpv, Last.fm scrobbling and Discord Rich Presence, no Electron."
arch=("x86_64")
url="https://github.com/SimoHypers/limusic"
license=("GPL-3.0-or-later")
depends=("libsoup3" "glib2" "glibc" "webkit2gtk-4.1" "dbus" "gtk3" "hicolor-icon-theme" "cairo" "libgcc" "libmpv.so=2-64" "gdk-pixbuf2" "libcrypto.so=3-64" "libssl.so=3-64")
options=("!strip" "!buildflags")
provides=("${_pkgname}-prerelease")
conflicts=("${_pkgname}" "limusic-bin")

source=("limusic_${_tag}_amd64.AppImage::https://github.com/SimoHypers/limusic/releases/download/v${_tag}/limusic_${_tag}_amd64.AppImage")
sha256sums=('2e2bdf39f979f4b2da2d83a2aa93ac9b079951b82c9cb6d876adcd9ffdec3c8a')

prepare() {
  chmod +x "${srcdir}/limusic_${_tag}_amd64.AppImage"
  "${srcdir}/limusic_${_tag}_amd64.AppImage" --appimage-extract >/dev/null
}

package() {
  # The AppImage bundles ~400 MB of libraries. The binary's RUNPATH
  # ($ORIGIN/../lib) resolves to /usr/lib once installed, and every soname it
  # needs is in depends, so only the application files are packaged and the
  # bundled copies are dropped.
  install -Dm755 squashfs-root/usr/bin/limusic-app "$pkgdir/usr/bin/limusic-app"
  install -Dm644 squashfs-root/usr/share/applications/limusic.desktop \
    "$pkgdir/usr/share/applications/limusic.desktop"

  # Copy the icons individually rather than with `cp -a`: the squashfs keeps
  # mode 0700 on its directories, so a recursive copy would ship icon folders
  # that other users cannot read, and it would also carry over the empty
  # hicolor size directories the AppImage happens to contain.
  local icon rel
  while IFS= read -r icon; do
    rel="${icon#squashfs-root/}"
    install -Dm644 "$icon" "$pkgdir/$rel"
  done < <(find squashfs-root/usr/share/icons -type f -name '*.png')
}
