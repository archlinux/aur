# Maintainer: Nils Pukropp <contact@narl.io>

pkgname=proton-drive-for-linux-bin
pkgver=3.10.0
pkgrel=1
pkgdesc="Unofficial Proton Drive client: FUSE files-on-demand mount, CLI, GTK4 app, tray (binaries)"
arch=('x86_64')
url="https://proton-drive.narl.io"
_repo="https://github.com/narrrl/proton-drive-linux"
license=('MIT')
depends=('fuse3' 'polkit' 'gtk4' 'libadwaita' 'webkitgtk-6.0' 'dbus' 'gcc-libs' 'glibc'
         'hicolor-icon-theme')
optdepends=('perl-image-exiftool: thumbnails for camera RAW files'
            'ffmpeg: video thumbnails'
            'iso-codes: country names in your language under Places'
            'gnome-keyring: credential storage over the Secret Service API'
            'kwallet: credential storage over the Secret Service API'
            'xdg-utils: "Open folder" action in the tray menu'
            'fzf: search-as-you-type launcher (pdfs-prompt --fzf)'
            'foot: terminal that hosts pdfs-prompt --fzf when started from a keybinding')
provides=("${pkgname%-bin}=$pkgver" "proton-drive-linux=$pkgver" 'pdfs')
conflicts=('proton-drive-linux' 'proton-drive-for-linux' 'proton-drive-for-linux-git')
# Upstream ships the binaries already built on Ubuntu 24.04; do not rewrite them.
options=('!strip' '!debug')
# Stops the running daemon before removal, so the mount stops mirroring deletes.
install=proton-drive.install
_tag="v$pkgver"
# The release tarball holds the binaries and everything installed around them
# (desktop files, icon, user service, translations, completions) in a /usr-like
# tree under one directory.
source=("proton-drive-linux-$pkgver-x86_64.tar.gz::$_repo/releases/download/$_tag/proton-drive-linux-$pkgver-x86_64.tar.gz")
sha256sums=('464986f2516ecbe249f98570189bfd36c2f372205c4095eccd515325f113c651')

package() {
  cd "$srcdir/proton-drive-linux-$pkgver-x86_64"
  local exe
  for exe in pdfs pdfs-tray pdfs-app pdfs-prompt; do
    install -Dm755 "bin/$exe" "$pkgdir/usr/bin/$exe"
  done

  install -Dm644 share/applications/io.narl.proton-drive-linux.desktop \
    "$pkgdir/usr/share/applications/io.narl.proton-drive-linux.desktop"
  install -Dm644 etc/xdg/autostart/io.narl.proton-drive-linux-tray.desktop \
    "$pkgdir/etc/xdg/autostart/io.narl.proton-drive-linux-tray.desktop"
  install -Dm644 share/icons/hicolor/scalable/apps/io.narl.proton-drive-linux.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.narl.proton-drive-linux.svg"

  # systemd user unit for the auto-mount daemon; enabled per user, not by pacman.
  install -Dm644 lib/systemd/user/proton-drive.service \
    "$pkgdir/usr/lib/systemd/user/proton-drive.service"

  # The offline Places basemap.
  install -Dm644 share/proton-drive-linux/basemap-v1.pmtiles \
    "$pkgdir/usr/share/proton-drive-linux/basemap-v1.pmtiles"

  # Translations and shell completion for bash, zsh and fish.
  install -dm755 "$pkgdir/usr/share"
  cp -r --no-preserve=ownership share/locale share/bash-completion share/zsh share/fish \
    "$pkgdir/usr/share/"

  install -Dm644 share/licenses/proton-drive-linux/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # pacman brings new releases, so the app never checks for them itself.
  install -Dm644 /dev/null "$pkgdir/usr/share/proton-drive-linux/managed-updates"
}
