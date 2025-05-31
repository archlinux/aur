# Maintainer: Georg Wagner <puxplaying_at_gmail_dot_com>
# Contributor: @xabbu <https://github.com/xabbu>
# Contributor: Stefano Capitani <stefano_at_manjaro_dot_org>
# Contributor: Mark Wagie <mark_at_manjaro_dot_org>
# Contributor: Jonathon Fernyhough
# Contributor: realqhc <https://github.com/realqhc>
# Contributor: Brett Alcox <https://github.com/brettalcox>
# Contributor: runsisi <https://github.com/runsisi>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

# Ubuntu patches:
# https://salsa.debian.org/gnome-team/mutter/-/tree/ubuntu/latest/debian/patches/ubuntu

pkgname=mutter-x11-scaling
pkgver=48.3
pkgrel=3
pkgdesc="Window manager and compositor for GNOME with X11 fractional scaling patch"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  at-spi2-core
  cairo
  colord
  dconf
  egl-wayland
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
  libgirepository
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
  python-argcomplete
  python-gobject
  startup-notification
  systemd-libs
  wayland
  xorg-xwayland
)
makedepends=(
  bash-completion
  gi-docgen
  git
  glib2-devel
  gobject-introspection
  meson
  python-docutils
  sysprof
  wayland-protocols
)
source=(
  # Mutter tags use SSH signatures which makepkg doesn't understand
  "git+$url.git#tag=${pkgver/[a-z]/.&}"
  "git+https://gitlab.gnome.org/GNOME/gvdb.git#commit=466fc22016cf0981424e7121557611942191992f"
  "https://raw.githubusercontent.com/puxplaying/mutter-x11-scaling/421143c8da7643be33b34345b9cdea53f7f4e2df/x11-Add-support-for-fractional-scaling-using-Randr.patch"
)
b2sums=('d8b1d4ff788075c26f25dd40b9f46de640e523ea3acefb2d9d178033d1780ff63d882e730d47001224e27683d01d8453330d54a8282d3699ab65cad2e76372eb'
        'c25796ff54fee353c5fc7a0815c25255b399490148d2bad1f37932d2da66d80561d6e262a5f256c89d142419a504c23eff69f7ef4e65e349f2dea3e0ac0bac1a'
        '0674df6a5bd93ecea92499ecb5711d0cdede86a2652d42260acd4bfa075604c8114227f8773b50789cc13fbc689a05c3edd005718e7b9a05238f7810f57101ab')

prepare() {
  cd mutter

  # Add scaling support using randr under x11
  patch -p1 -i "${srcdir}/x11-Add-support-for-fractional-scaling-using-Randr.patch"

  # Avoid some window tracking issues with XWayland
  # https://gitlab.archlinux.org/archlinux/packaging/packages/mutter/-/issues/12
  # https://gitlab.gnome.org/GNOME/mutter/-/issues/4133
  # https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4465
  git cherry-pick -n 5a78e6ae05ddf099d62e956c32b07ade7321b9b5
  git cherry-pick -n a38fe3a50427bd0ffdd86d0a565371d992027438
}

build() {
  local meson_options=(
    -D docs=false
    -D egl_device=true
    -D installed_tests=false
    -D tests=disabled
    -D wayland_eglstream=true
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  # Inject gvdb
  export MESON_PACKAGE_CACHE_DIR="$srcdir"

  arch-meson mutter build "${meson_options[@]}"
  meson compile -C build
}

package() {
  provides=(mutter libmutter-16.so)
  conflicts=(mutter)
  optdepends=('bash-completion: Bash completions for gdctl')

  meson install -C build --destdir "$pkgdir"
}
