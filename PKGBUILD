# Maintainer: Vyrnexis
#
# Wayland (River 0.5+) branch of nimdow, built from git.
#   cd packaging/arch && makepkg -si
#
# Split package:
#   nimdow-wl-git          the window manager
#   nimdow-wl-desktop-git  complete desktop: dependencies + /etc/xdg/nimdow-wl/config.toml
#
# The only Nim dependency (parsetoml) is a pinned source tarball, so nothing
# but the sources below is downloaded at build time (no nimble, no network in
# build()).
pkgbase=nimdow-wl-git
pkgname=(nimdow-wl-git nimdow-wl-desktop-git)
pkgver=0.7.41.r545.g7896c1b
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/Vyrnexis/nimdow-wl'
license=('GPL-2.0-only')
makedepends=('git' 'nim' 'pkgconf')
source=('nimdow-wl::git+https://github.com/Vyrnexis/nimdow-wl.git#branch=main'
        'parsetoml-0.7.2.tar.gz::https://github.com/NimParsers/parsetoml/archive/refs/tags/v0.7.2.tar.gz')
sha256sums=('SKIP'
            '568acfd8193ca9e2bdb5f40ed71c2ccf35d4f50778bb25c8d26ed1e8896f89c8')

pkgver() {
  cd nimdow-wl
  local version
  version=$(sed -n 's/^version *= *"\(.*\)"/\1/p' nimdow.nimble)
  printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd nimdow-wl
  # Shown by `nimdow-wl --version`.
  export LATEST_COMMIT
  LATEST_COMMIT=$(git rev-parse --short HEAD)
  mkdir -p bin
  nim c -d:release --hints:off \
    --nimcache:"$srcdir/nimcache" \
    --path:"$srcdir/parsetoml-0.7.2/src" \
    --passC:"$CFLAGS" --passL:"$LDFLAGS" \
    -o:bin/nimdow-wl src/nimdow.nim
}

package_nimdow-wl-git() {
  pkgdesc='Nim window manager for the River Wayland compositor, with its own status bar and system tray'
  depends=('river>=0.5' 'wayland' 'libxkbcommon' 'cairo' 'pango' 'librsvg'
           'systemd-libs' 'glib2' 'harfbuzz' 'gdk-pixbuf2')
  optdepends=('nimdow-wl-desktop-git: complete desktop setup'
              'xdg-desktop-portal-gtk: portals (file chooser, screenshots) used by the session'
              'mako: notification daemon')
  conflicts=('nimdow-wayland-git')
  replaces=('nimdow-wayland-git')

  cd nimdow-wl
  install -Dm755 bin/nimdow-wl "$pkgdir/usr/bin/nimdow-wl"
  install -Dm644 config.default.toml "$pkgdir/usr/share/nimdow-wl/config.default.toml"
  install -Dm644 wayland-sessions/nimdow-wl.desktop \
    "$pkgdir/usr/share/wayland-sessions/nimdow-wl.desktop"
  install -Dm644 systemd/nimdow-wl-session.target \
    "$pkgdir/usr/lib/systemd/user/nimdow-wl-session.target"
  install -Dm644 systemd/nimdow-wl-portals.conf \
    "$pkgdir/usr/share/xdg-desktop-portal/nimdow-wl-portals.conf"
  install -Dm644 doc/nimdow-wl.1 "$pkgdir/usr/share/man/man1/nimdow-wl.1"
  install -Dm644 README.md "$pkgdir/usr/share/doc/nimdow-wl-git/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/nimdow-wl-git/LICENSE"
}

package_nimdow-wl-desktop-git() {
  pkgdesc='Complete nimdow-wl desktop: notifications, polkit agent, launcher, status bar, portals and default config'
  arch=('any')
  depends=(nimdow-wl-git polkit-gnome mako swaybg xdg-desktop-portal-gtk xorg-xwayland
           gnome-keyring kitty nimlaunch-bin nimdow-wl-status wl-clipboard grim slurp
           libnotify pipewire pipewire-pulse wireplumber brightnessctl networkmanager
           ttf-meslo-nerd pacman-contrib rtkit)
  optdepends=('pavucontrol: volume mixer'
              'nautilus: file manager'
              'adw-gtk-theme: GTK theme'
              'network-manager-applet: tray network applet'
              'sddm: graphical login manager'
              'greetd-tuigreet: lightweight login manager')
  backup=('etc/xdg/nimdow-wl/config.toml')
  install=nimdow-wl-desktop.install

  cd nimdow-wl
  install -Dm644 packaging/desktop/config.toml "$pkgdir/etc/xdg/nimdow-wl/config.toml"
}
