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
pkgver=48.0
pkgrel=2
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
  "git+https://gitlab.gnome.org/GNOME/gvdb.git#commit=b54bc5da25127ef416858a3ad92e57159ff565b3"
  "0001-cursor-Unify-prepare_func-for-shape-cursors.patch::https://gitlab.archlinux.org/archlinux/packaging/packages/mutter/-/raw/main/0001-cursor-Unify-prepare_func-for-shape-cursors.patch?ref_type=heads"
  "0002-kms-impl-device-Always-catch-pending-KMS-update-in-_.patch::https://gitlab.archlinux.org/archlinux/packaging/packages/mutter/-/raw/main/0002-kms-impl-device-Always-catch-pending-KMS-update-in-_.patch?ref_type=heads"
  "0003-Revert-onscreen-native-Account-for-all-posted-frames.patch::https://gitlab.archlinux.org/archlinux/packaging/packages/mutter/-/raw/main/0003-Revert-onscreen-native-Account-for-all-posted-frames.patch?ref_type=heads"
  "https://raw.githubusercontent.com/puxplaying/mutter-x11-scaling/df935c751b108d7cf603d1d6ce76c2fefdd6a5da/x11-Add-support-for-fractional-scaling-using-Randr.patch"
)
b2sums=('2ab67447e212cd8a6491b1f6f0b25aa5663ac70642a9a0d9d77c387787e34e8cbc39951ccae5abf8d5bedc35adfba26aa85487406d50f5da4b5e17739c52c333'
        'f989bc2ceb52aad3c6a23c439df3bbc672bc11d561a247d19971d30cc85ed5d42295de40f8e55b13404ed32aa44f12307c9f5b470f2e288d1c9c8329255c43bf'
        '1e7f977eb039bfa37ba0ef265e058d68246160f916c91779f8e0ca52954e4ada195036c5db0210ab18735b13907e2ff361d0c7f12948df86d6c6ccbb16cc6b66'
        '3c05efe2f37f0547d28f55ea790413c844703ba045a7429ab7f67594b749aeef0429026ad44e9985fe70c146923f6e32ed5cbf3de476c19aae7de3a126583f47'
        '6ba5b237afa2c9ce89c0980b8f4729810eac9ad49e754493978bdbc32942106bf4eba0c9065d770be4feec25c5b149e942c3b4c4d1d8c753eacc68b408fd0f39'
        'f4664e51c09b3fad64c6c088b9762e56f04ef97bc42c8bdaacbbbf486cb339eef351223c442df2c73ace7f661e366845453ce9967cb17220caa3317d5d1f9030')

prepare() {
  cd mutter

  # Fix cursor scaling
  # https://gitlab.gnome.org/GNOME/mutter/-/issues/3975
  # https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4345
  git apply -3 ../0001-cursor-Unify-prepare_func-for-shape-cursors.patch

  # Fix multi-monitor freezes
  # https://gitlab.gnome.org/GNOME/mutter/-/issues/3974
  # https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4338
  git apply -3 ../0002-kms-impl-device-Always-catch-pending-KMS-update-in-_.patch
  git apply -3 ../0003-Revert-onscreen-native-Account-for-all-posted-frames.patch

  # Add scaling support using randr under x11
  patch -p1 -i "${srcdir}/x11-Add-support-for-fractional-scaling-using-Randr.patch"
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
