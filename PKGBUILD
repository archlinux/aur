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
pkgver=46.1
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
  gobject-introspection
  gtk3
  meson
  python-packaging
  sysprof
  wayland-protocols
  xorg-server
  xorg-server-xvfb
)
checkdepends=(
  gnome-session
  python-dbusmock
  wireplumber
  zenity
)
provides=(mutter=$pkgver libmutter-14.so)
conflicts=(mutter)
source=(
  # Mutter tags use SSH signatures which makepkg doesn't understand
  "git+$url.git#tag=${pkgver/[a-z]/.&}"
  "https://raw.githubusercontent.com/puxplaying/mutter-x11-scaling/7aa432d4366fdd5a2687a78848b25da4f8ab5c68/x11-Add-support-for-fractional-scaling-using-Randr.patch"
  "https://raw.githubusercontent.com/puxplaying/mutter-x11-scaling/eff4767168c107ef268c7e8b32eaea41a224efb4/Support-Dynamic-triple-double-buffering.patch"
  "https://raw.githubusercontent.com/puxplaying/mutter-x11-scaling/eff4767168c107ef268c7e8b32eaea41a224efb4/mutter-fix-x11-restart.patch"
)
b2sums=('4acd4a192455890b12b2fc9b6553ed65bd2176307cd6c6683fc2ab476b7fa88f4b5e507a1209b3e900c68d94768f3cf749b4f5d87d25300b33a112182c8a62a7'
        '2b1a70b961d70688396c072355accdd8a9fa5591feab7a22c849f54bcf2695cbe72267dc5e006385e95d114e8e7078045fa8b6a09d00c558eff04ec8dd38318a'
        '35eeeb037ca337acca80485f26e7df43b8588458298b5bf015d19d6cb62423f4f2d948cfd92cf9efd0fcb3b1130e50ea14a7428abe8032845467f9b12baba5f3'
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
    -D wayland_eglstream=true
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson mutter build "${meson_options[@]}"
  meson compile -C build
}

check() (
  export XDG_RUNTIME_DIR="$PWD/rdir" GSETTINGS_SCHEMA_DIR="$PWD/build/data"
  mkdir -p -m 700 "$XDG_RUNTIME_DIR"
  glib-compile-schemas "$GSETTINGS_SCHEMA_DIR"

  export NO_AT_BRIDGE=1 GTK_A11Y=none
  export MUTTER_DEBUG_DUMMY_MODE_SPECS="800x600@10.0"

  # Tests fail:
  # mutter:cogl+cogl/conform / cogl-test-offscreen-texture-formats-gles2
  # mutter:core+mutter/stacking / fullscreen-maximize
  ## https://gitlab.gnome.org/GNOME/mutter/-/issues/3343
  xvfb-run -s '-nolisten local +iglx -noreset' \
    mutter/src/tests/meta-dbus-runner.py --launch=pipewire --launch=wireplumber \
    meson test -C build --no-suite 'mutter/kvm' --no-rebuild \
    --print-errorlogs --timeout-multiplier 10 --setup plain ||:
)

package() {
  meson install -C build --destdir "$pkgdir"
}
