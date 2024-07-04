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
pkgver=46.3.1
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
  "https://raw.githubusercontent.com/puxplaying/mutter-x11-scaling/3ef55f2386127b793e07a57c27fd1cd3e43ad95b/x11-Add-support-for-fractional-scaling-using-Randr.patch"
  "https://raw.githubusercontent.com/puxplaying/mutter-x11-scaling/3ef55f2386127b793e07a57c27fd1cd3e43ad95b/Support-Dynamic-triple-double-buffering.patch"
  "https://raw.githubusercontent.com/puxplaying/mutter-x11-scaling/eff4767168c107ef268c7e8b32eaea41a224efb4/mutter-fix-x11-restart.patch"
)
b2sums=('7d9041df986220470c287fe65194ec6e4da8f15540140fb7e0c3fddc95ce6e9ec9fd4f691ed349a31af28e903c769c97d9817ac65c3cc424b002e095cf559606'
        'ec2ade7ea383b4065c3b01df2c41b39f23b421160bcc848206ea134694b7bb9688cf786714f95d9d59440c9fffb82930b5d9befc498f98d82ec60fc9e840dee4'
        'bdacfbbe1b5ed8d386a2a9fb44cb6a7a5c1fb70e7fd5d1fec199dd9a60ec1faa9ef1cb20674826a108fee188cc8d7b24eea7cea402ad47f191e0d3e1f28f940d'
        'ba4febdabc89a8c608d2a9621d02a21c05b315bb586f91d34b0369c07f3e051a6333d62dd97ab18d0c5b1c8f453696d4851c55fc82a50e8843ae45068ab178ca')

prepare() {
  cd mutter

  # https://gitlab.gnome.org/GNOME/gnome-shell/-/issues/7050
  # https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3329
  git apply -3 ../mutter-fix-x11-restart.patch

  # Add scaling support using randr under x11
  patch -p1 -i "${srcdir}/x11-Add-support-for-fractional-scaling-using-Randr.patch"
  
  # Add dynamic triple/double buffering support
  # https://gitlab.gnome.org/GNOME/gnome-shell/-/issues/3760
  # https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1441
  patch -p1 -i "${srcdir}/Support-Dynamic-triple-double-buffering.patch"
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
