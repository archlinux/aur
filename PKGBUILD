# Maintainer: Georg Wagner <puxplaying_at_gmail_dot_com>
# Contributor: @xabbu <https://github.com/xabbu>
# Contributor: Stefano Capitani <stefano_at_manjaro_dot_org>
# Contributor: Mark Wagie <mark_at_manjaro_dot_org>
# Contributor: Jonathon Fernyhough
# Contributor: realqhc <https://github.com/realqhc>
# Contributor: Brett Alcox <https://github.com/brettalcox>
# Contributor: runsisi <https://github.com/runsisi>

# Archlinux credits:
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

# Ubuntu credits:
# Marco Trevisan: <https://salsa.debian.org/gnome-team/mutter/-/blob/ubuntu/master/debian/patches/ubuntu/x11-Add-support-for-fractional-scaling-using-Randr.patch>

pkgname=mutter-x11-scaling
pkgver=46.5
pkgrel=1
pkgdesc="Window manager and compositor for GNOME with X11 fractional scaling patch"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  at-spi2-core
  cairo
  colord
  dconf
  fontconfig
  fribidi
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gnome-desktop-4
  gnome-settings-daemon
  graphene
  gsettings-desktop-schemas
  gtk4
  harfbuzz
  iio-sensor-proxy
  lcms2
  libcanberra
  libcolord
  libdisplay-info
  libdrm
  libei
  libglvnd
  libgudev
  libice
  libinput
  libpipewire
  libsm
  libsysprof-capture
  libwacom
  libx11
  libxau
  libxcb
  libxcomposite
  libxcursor
  libxdamage
  libxext
  libxfixes
  libxi
  libxinerama
  libxkbcommon
  libxkbcommon-x11
  libxkbfile
  libxrandr
  libxtst
  mesa
  pango
  pipewire
  pixman
  python
  startup-notification
  systemd-libs
  wayland
  xorg-xwayland
)
makedepends=(
  egl-wayland
  gi-docgen
  git
  glib2-devel
  gobject-introspection
  meson
  sysprof
  wayland-protocols
)
source=(
  # Mutter tags use SSH signatures which makepkg doesn't understand
  "git+$url.git#tag=${pkgver/[a-z]/.&}"
  "https://raw.githubusercontent.com/puxplaying/mutter-x11-scaling/64f7d7fb106b7efb5dfb3f86c3bcf9a173ee3c5e/x11-Add-support-for-fractional-scaling-using-Randr.patch"
  #"https://raw.githubusercontent.com/puxplaying/mutter-x11-scaling/64f7d7fb106b7efb5dfb3f86c3bcf9a173ee3c5e/Support-Dynamic-triple-double-buffering.patch"
)
b2sums=('3c7990afd584836dd092e30813194ac24608416051a9b06c51d2f9577206360cb0f8bafceccc42ce1809d47e7a1676326fe8b87fa231c6abe2d9dddba10b6581'
        'bf2080b587420aa03d413566d34009e7fc63774b23f7826f215b8a317c468c041e5fed4cdca49423b5972bf64179d67d6e34c429a85c10e8c46eb170ce1eda70')

prepare() {
  cd mutter

  # Add scaling support using randr under x11
  patch -p1 -i "${srcdir}/x11-Add-support-for-fractional-scaling-using-Randr.patch"
  
  # Add dynamic triple/double buffering support
  # https://gitlab.gnome.org/GNOME/gnome-shell/-/issues/3760
  # https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1441
  #patch -p1 -i "${srcdir}/Support-Dynamic-triple-double-buffering.patch"
}

build() {
  local meson_options=(
    -D docs=false
    -D egl_device=true
    -D installed_tests=false
    -D libdisplay_info=enabled
    -D tests=false
    -D wayland_eglstream=true
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson mutter build "${meson_options[@]}"
  meson compile -C build
}

package() {
  provides=(mutter libmutter-14.so)
  conflicts=(mutter)

  meson install -C build --destdir "$pkgdir"
}
