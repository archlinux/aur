# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: M0Rf30
# Contributor: unifiedlinux
# Contributor: CReimer

pkgname=cinnamon-git
pkgver=6.6.5.r36.g781e09a25
pkgrel=2
pkgdesc="Linux desktop which provides advanced innovative features and a traditional user experience (git version)"
arch=(x86_64)
url="https://github.com/linuxmint/cinnamon"
license=(GPL-2.0-or-later)
depends=(
  accountsservice
  at-spi2-core
  bash
  cairo
  cinnamon-control-center
  cinnamon-desktop
  cinnamon-menus
  cinnamon-screensaver
  cinnamon-session
  cinnamon-settings-daemon
  cinnamon-translations
  cjs
  dconf
  evolution-data-server
  gcc-libs
  gcr
  gdk-pixbuf2
  glib2
  glibc
  gnome-backgrounds
  gnome-themes-extra
  gsound
  gstreamer
  gtk3
  hicolor-icon-theme
  libgirepository
  libglvnd
  libibus
  libical
  libkeybinder3
  libnm
  libnotify
  libsecret
  libx11
  libxfixes
  libxml2
  muffin-git
  nemo
  network-manager-applet
  pango
  papirus-icon-theme
  polkit
  python
  python-cairo
  python-gobject
  python-pam
  python-pexpect
  python-pillow
  python-psutil
  python-pyinotify
  python-pytz
  python-requests
  python-setproctitle
  python-tinycss2
  python-xapp
  sound-theme-freedesktop
  timezonemap
  upower
  xapp
  xdg-desktop-portal-xapp
)
optdepends=(
  'blueman: Bluetooth support'
  'gnome-keyring: Secrets service backend'
  'gnome-panel: fallback mode'
  'ibus: input method support'
  'metacity: fallback mode'
  'switcheroo-control: GPU offloading'
  'system-config-printer: printer settings'
  'touchegg: touch gestures'
  'wget: cover download support in audio applet'
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
  python-libsass
  samurai
)
provides=(cinnamon)
conflicts=(cinnamon)
options=('!emptydirs')
source=("git+https://github.com/linuxmint/cinnamon.git"
        "cinnamon-menu-button.patch"
        "cinnamon-set-wheel.patch"
        "30_org.archlinux.cinnamon.gschema.override")
b2sums=('SKIP'
        '716095bf9b74fad22714040dfd3d7b115eb950a81b4ec809f8541d81102bc276532948d1e70c2d022b061cc8e939276b9f51f4fedb01c6ef2940d1232253460d'
        '3becf1f40068fc629109e6e7d464c3c484296afacc9ab6328b2ccbb3c9735bcbfa9550f9f73b430ede178ae668e37c660ce322b5b4d1873526de3d3d41185160'
        'c071ce664c5189883c409d65b1d054ef4526c0283484e936b10500cec13efdaf3e3792459e648817e1c48e0505bc1154950ce3080cd9aafe0f5de8da5b16bafd')


pkgver() {
  cd cinnamon
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd cinnamon

  # Add Traditional button layout option
  # https://github.com/linuxmint/cinnamon/pull/13326
  git apply -3 ../cinnamon-menu-button.patch

  # Use wheel group instread of sudo (taken from Fedora)
  patch -Np1 -i ../cinnamon-set-wheel.patch

  # Cinnamon has no upstream backgrounds, use GNOME backgrounds instead
  # https://github.com/linuxmint/cinnamon/issues/3575#issuecomment-374887122
  sed -i 's|/usr/share/cinnamon-background-properties|/usr/share/gnome-background-properties|' \
    files/usr/share/cinnamon/cinnamon-settings/modules/cs_backgrounds.py

  # Don't hide any valid themes from the list
  sed -i '/if .* in THEMES_BLACKLIST:/,+1 d' files/usr/share/cinnamon/cinnamon-settings/modules/cs_themes.py

  # Replace MintInstall with GNOME Software
  sed -i 's/mintinstall.desktop/org.gnome.Software.desktop/' data/org.cinnamon.gschema.xml

  # Add polkit agent to required components
  sed -i 's/RequiredComponents=\(.*\)$/RequiredComponents=\1polkit-gnome-authentication-agent-1;/' \
    cinnamon*.session.in
}

build() {
  arch-meson cinnamon build \
    --libexecdir lib/cinnamon \
    -D docs=true

  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
  install -Dm644 -t "$pkgdir/usr/share/glib-2.0/schemas" 30_org.archlinux.cinnamon.gschema.override
}
