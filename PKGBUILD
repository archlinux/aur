# Maintainer: mahirsn <mahirsuna72@gmail.com>
pkgname=mmsimpulse-git
pkgver=r159.654d4e4
pkgrel=1
pkgdesc="A bare KWin Wayland session to run any shell on (Dux, digit, Quickshell configs), with Hyprland-style workspaces"
# Not 'any': the KWin plugins (workspace sharing, and the protocols shells
# use) are compiled against the installed KWin, so this package has to be
# rebuilt when KWin is updated.
arch=('x86_64')
url="https://github.com/mahirsn/mmsimpulse"
license=('GPL-3.0-or-later')
# Any KWin 6 satisfies this. python-dbus and python-gobject are the KWin
# bridge; the rest are what the session scripts call.
depends=('kwin' 'kglobalacceld' 'xdg-desktop-portal-kde'
         'python' 'python-dbus' 'python-gobject' 'systemd'
         'wl-clipboard' 'wl-clip-persist')
optdepends=(
  'quickshell: Quickshell-based shells such as Dux'
  'powerdevil: idle timeouts, DPMS, suspend and brightness'
  'upower: battery status'
  'kdeplasma-addons: task switcher layouts, without which Alt+Tab draws nothing'
  'kitty: the terminal on Meta+Return'
  'cliphist: clipboard history'
  'breeze: the default cursor theme, which KWin warns about when absent'
)
makedepends=('git' 'cmake' 'extra-cmake-modules' 'wayland-protocols' 'wlr-protocols')
provides=('mmsimpulse')
conflicts=('mmsimpulse')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  for plugin in kwin-effect kwin-mmsimpulse; do
    cmake -S "$srcdir/$pkgname/$plugin" -B "build-$plugin" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build "build-$plugin"
  done
}

package() {
  for plugin in kwin-effect kwin-mmsimpulse; do
    DESTDIR="$pkgdir" cmake --install "build-$plugin"
  done

  cd "$srcdir/$pkgname"

  # The session itself is package-owned, so a normal install needs no sudo
  # prompt and the login manager sees the entry immediately.
  install -Dm755 session/start-mmsimpulse "$pkgdir/usr/bin/start-mmsimpulse"
  sed 's|@BIN@|/usr/bin|' session/mmsimpulse.desktop \
    | install -Dm644 /dev/stdin "$pkgdir/usr/share/wayland-sessions/mmsimpulse.desktop"

  # The per-user half — the bridge, the profiles, the shortcuts — is
  # assembled in $HOME and cannot be built here, so the package ships the
  # tooling and `mmsimpulse-install` does that part once.
  install -d "$pkgdir/usr/share/mmsimpulse"
  cp -a bin kwin-script profiles session shortcuts install.sh README.md \
        "$pkgdir/usr/share/mmsimpulse/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/mmsimpulse-install" <<'WRAPPER'
#!/bin/sh
# Sets up mmsimpulse for the current user. Safe to re-run: it is also how you
# pick up a new release of this package.
exec /usr/share/mmsimpulse/install.sh "$@"
WRAPPER

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
