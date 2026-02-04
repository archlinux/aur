# Mutter 49.3 with render-source workaround for NVIDIA Wayland (LP #2081140 / MR 4725)
# Based on AUR mutter-performance pattern: https://aur.archlinux.org/packages/mutter-performance
# Provides libmutter-17.so — compatible with current gnome-shell/gdm.
#
# Maintainer: Your Name <yourname at domain dot tld>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgbase=mutter-render-source
pkgname=mutter-render-source
pkgver=49.3
pkgrel=3
pkgdesc="Mutter 49.3 with render-source fix for NVIDIA Wayland (LP #2081140)"
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
  glycin
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
  python-dbus
  python-gobject
  startup-notification
  systemd-libs
  wayland
  xorg-xwayland
)
makedepends=(
  bash-completion
  git
  glib2-devel
  gobject-introspection
  meson
  sysprof
  wayland-protocols
)
source=(
  "git+$url.git#tag=$pkgver"
  "gvdb::git+https://gitlab.gnome.org/GNOME/gvdb.git#commit=b54bc5da25127ef416858a3ad92e57159ff565b3"
  "render-source-lp2081140-49.3.patch"
  "fix-build-49.patch"
)
b2sums=('SKIP'
        'SKIP'
        'f5db1c711d8ba8aed74281c4d1ca4f1ad16de794aa3273aae959cd6619f1d4ead38be36864cf514fafb430ef6dcda936f83c6b31ad2dec6bf833f138386ad0c1'
        '9c44c008722891edad2adda95429964d8ce4fa597af9e5a9378c906f9cc333a62a0895e210c9c4de93de3abaf1e697cf9ff55c2b93b7a49152020b1241183182')

pkgver() {
  cd "$srcdir/mutter"
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd "$srcdir/mutter"
  # Pre-fetched gvdb (avoids GitLab 503 during meson subprojects download)
  rm -rf subprojects/gvdb
  cp -a "$srcdir/gvdb" subprojects/gvdb
  # Render-source backport: defer lock_front_buffer to fix NVIDIA Wayland frame rate (LP #2081140)
  patch -p1 -i "$srcdir/render-source-lp2081140-49.3.patch"
  # Build fixes: forward declaration and COGL_WINSYS_FEATURE_SYNC_FD for 49.3 Cogl
  patch -p1 -i "$srcdir/fix-build-49.patch"
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

  export MESON_PACKAGE_CACHE_DIR="$srcdir"
  arch-meson "$srcdir/mutter" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  provides=(mutter libmutter-17.so)
  conflicts=(mutter)
  optdepends=('bash-completion: Bash completions for gdctl')

  meson install -C build --destdir "$pkgdir"
}

# vim: set sw=2 sts=2 et:
