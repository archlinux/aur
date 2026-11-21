# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=screen-relay
pkgver=0.1.4
pkgrel=1
pkgdesc="Stream a desktop to a browser, and drive it from a CLI, an HTTP API, or a Node SDK"
arch=('x86_64')
url="https://screen-relay.dev"
# The CLI is Apache-2.0. The engine links x264 (GPL-2.0-or-later), and Apache-2.0 is
# compatible only with GPLv3, so the engine binary is GPL-3.0-only.
license=('Apache-2.0' 'GPL-3.0-only')
# xorg-server-xvfb and xorg-xauth are run, not linked: they give a session its display.
depends=('nodejs' 'x264' 'libwebsockets' 'wayland' 'libxkbcommon'
         'libx11' 'libxext' 'libxdamage' 'libxfixes' 'libxtst' 'zlib' 'gcc-libs'
         'xorg-server-xvfb' 'xorg-xauth')
makedepends=('npm')
optdepends=('xprop: inspect the desktop windows a session starts'
            'xwininfo: window geometry for the desktop check'
            'xorg-setxkbmap: keyboard layouts other than us'
            'dbus: session bus for the desktop (dbus-run-session)'
            'xfce4-session: default X11 desktop'
            'xfwm4: window manager and compositor for the default X11 desktop'
            'xfce4-panel: panel for the default X11 desktop'
            'xfdesktop: desktop background and icons for the default X11 desktop'
            'xfce4-settings: settings daemon for the default X11 desktop'
            'xfce4-terminal: terminal the quick start opens'
            'sway: Wayland desktop for a headless Wayland session'
            'xorg-xwayland: X11 applications inside a Wayland session'
            'foot: Wayland terminal')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vercel-labs/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('885f9829ff10407fb900d55987f90b9f1c357cd3be9061bee0041947529f3367')

# Releases come only as source: there are no binary assets to package.
latestver() {
  curl -fsSL "https://api.github.com/repos/vercel-labs/screen-relay/tags?per_page=100" |
    sed -nE 's/.*"name": *"v([0-9]+(\.[0-9]+)*)".*/\1/p' | sort -V | tail -1
}

prepare() {
  cd "$pkgname-$pkgver"
  npm_config_cache="$srcdir/npm-cache" npm ci --ignore-scripts --no-audit --no-fund
  # The link rule passes only LDLIBS to the compiler, so a build ignores LDFLAGS:
  # without it the binary loses --as-needed, keeping two libraries libwebsockets
  # publishes but never calls, and loses -z now, which full RELRO needs.
  sed -i 's| -o \$@ \$(LDLIBS)| -o \$@ \$(LDFLAGS) \$(LDLIBS)|' Makefile
  grep -q ' \-o \$@ \$(LDFLAGS) \$(LDLIBS)' Makefile
}

build() {
  cd "$pkgname-$pkgver"
  node build.mjs
  make -j"$(nproc)" BACKENDS="x11 wayland" relay-engine
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 relay-engine "$pkgdir/usr/bin/relay-engine"
  # The CLI resolves the viewer, the agent skills and the package table from its own
  # location: dist/cli, dist/viewer, skills and packages.tsv must keep these neighbours.
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r dist skills packages.tsv "$pkgdir/usr/lib/$pkgname/"
  chmod -R u=rwX,go=rX "$pkgdir/usr/lib/$pkgname"
  ln -s "../lib/$pkgname/dist/cli/relay.mjs" "$pkgdir/usr/bin/screen-relay"
  install -Dm644 THIRD-PARTY-NOTICES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.md"
}
