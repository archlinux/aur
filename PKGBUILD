# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=epsxe-appimage
pkgver=2.0.5
pkgrel=16
pkgdesc="ePSXe PS1 emulator for 64-bit Linux (self-built AppImage)"
arch=('x86_64')
url="https://github.com/Twilight0/epsxe-appimage"
license=('unknown')
depends=('fuse2' 'glibc')
makedepends=('imagemagick')
provides=('epsxe')
conflicts=('epsxe' 'epsxe-git')
options=('!strip' '!debug')

# Our own AppImage: the upstream one cannot run on a current distro (its
# ncurses 5 libraries lack the symbol version node ePSXe needs, and it never
# bundled libssl.so.1.1 / libunistring.so.2). This one carries a working
# runtime and 64-bit plugins built from PCSX-Reloaded 1.9.95.
# One release per build (tag v<version>-<pkgrel>): replacing an asset under
# a fixed name breaks every client that already cached it, because the file
# name stays the same and the download is skipped.
source=("ePSXe-$pkgver-$pkgrel-x86_64.AppImage::https://github.com/Twilight0/epsxe-appimage/releases/download/v$pkgver-$pkgrel/ePSXe-$pkgver-$pkgrel-x86_64.AppImage")
sha256sums=('32cc3ffee9ad51ab2f2830ed5e04c92c99544ee6d46544334b2a13c0f6cdaea0')

package() {
  # Unpack the AppImage once: the icon and the documented settings come
  # from it.
  cd "$srcdir"
  chmod +x "ePSXe-$pkgver-$pkgrel-x86_64.AppImage"
  "./ePSXe-$pkgver-$pkgrel-x86_64.AppImage" --appimage-extract >/dev/null 2>&1 || true

  install -Dm755 "$srcdir/ePSXe-$pkgver-$pkgrel-x86_64.AppImage" \
    "$pkgdir/opt/epsxe/ePSXe.AppImage"

  # Launcher. The AppImage's own AppRun reads /etc/epsxe.conf and
  # ~/.config/epsxe/config, so the settings below also apply to desktop
  # menu launches (which inherit no shell environment). The same settings
  # are applied here so they hold regardless of the AppImage's internals.
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/epsxe" <<'EOF'
#!/bin/sh
# ePSXe launcher.
#
# Settings are read from /etc/epsxe.conf and ~/.epsxe/epsxe.conf, so they
# live in the same place as ePSXe's own data.
#
#   EPSXE_GTK_THEME=Adwaita    force a theme for ePSXe only (ePSXe 2.0.5
#                              uses stock GTK3 widgets whose labels are
#                              unreadable under a dark desktop theme)
#   EPSXE_GTK_DARK=1           use the dark variant of a forced theme
#   EPSXE_GTK_CSS=/path.css    extra CSS for ePSXe only
#   SDL_VIDEODRIVER=x11        SDL2 backend; needed on Wayland, where ePSXe
#                              draws through X11/GLX but reads the keyboard
#                              through SDL2, so SDL2 must use X11 too or no
#                              key reaches the emulator
for _f in /etc/epsxe.conf "$HOME/.epsxe/epsxe.conf"; do
  [ -r "$_f" ] && . "$_f"
done

# ePSXe draws through X11/GLX while the input plugin reads the keyboard
# through SDL2. Under Wayland, SDL2 defaults to its own Wayland surface and
# never sees the keys of the X11 window ePSXe actually draws in, so ESC and
# every other key are dead. Force the X11 backend.
if [ -z "${SDL_VIDEODRIVER:-}" ] && [ -n "${DISPLAY:-}" ]; then
  SDL_VIDEODRIVER=x11
  export SDL_VIDEODRIVER
fi

exec /opt/epsxe/ePSXe.AppImage "$@"
EOF

  # Standalone quit helper: ePSXe 2.0.5's Linux port never connects
  # WM_DELETE_WINDOW, so the window's close button does nothing.
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/epsxe-quit" <<'EOF'
#!/bin/sh
# Ask a running ePSXe to close.
#
# SIGTERM first (ePSXe saves its memory cards on exit), SIGKILL only if it
# ignores that.
_pids="$(pgrep -f 'epsxe_x64' || true)"
if [ -z "$_pids" ]; then
  echo "epsxe is not running" >&2
  exit 1
fi
for _p in $_pids; do kill -TERM "$_p" 2>/dev/null || true; done
sleep 2
for _p in $(pgrep -f 'epsxe_x64' || true); do kill -KILL "$_p" 2>/dev/null || true; done
echo "epsxe closed"
EOF

  # A menu entry to close ePSXe, since the window's own close button does
  # not work.
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/epsxe-quit.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Quit ePSXe
Comment=Close a running ePSXe emulator
Icon=epsxe
Exec=epsxe-quit
Terminal=false
Categories=Game;Emulator;
EOF

  # Documented settings.
  install -Dm644 "$srcdir/squashfs-root/usr/share/epsxe/config.example" \
    "$pkgdir/usr/share/doc/epsxe-appimage/config.example"
  install -Dm644 "$srcdir/squashfs-root/usr/share/epsxe/config.example" \
    "$pkgdir/etc/epsxe.conf.example"
  # The readability stylesheet, applied by default on top of the desktop's
  # own user.css. EPSXE_GTK_CSS=none disables it.
  install -Dm644 "$srcdir/squashfs-root/usr/share/epsxe/epsxe.css" \
    "$pkgdir/usr/share/doc/epsxe-appimage/epsxe.css"

  # A desktop entry that starts ePSXe with the input fix applied, so the
  # fixes also hold for a menu launch (which inherits no shell environment).
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/epsxe.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=ePSXe PS1 Emulator
Comment=A PlayStation 1 emulator for 64-bit Linux
Icon=epsxe
Exec=epsxe %U
Terminal=false
Categories=Game;Emulator;
Keywords=PS1;PSX;ePSXe;PlayStation 1;
EOF

  # Icon from the AppImage itself, scaled to a regular 256x256.
  cd "$srcdir"
  chmod +x "ePSXe-$pkgver-$pkgrel-x86_64.AppImage"
  "./ePSXe-$pkgver-$pkgrel-x86_64.AppImage" --appimage-extract >/dev/null 2>&1 || true
  if [ -f squashfs-root/epsxe.png ]; then
    convert squashfs-root/epsxe.png -background none -resize 256x256 \
      -gravity center -extent 256x256 "$srcdir/epsxe-256.png"
    install -Dm644 "$srcdir/epsxe-256.png" \
      "$pkgdir/usr/share/icons/hicolor/256x256/apps/epsxe.png"
    install -Dm644 "$srcdir/epsxe-256.png" "$pkgdir/usr/share/pixmaps/epsxe.png"
  fi
  rm -rf squashfs-root
}
