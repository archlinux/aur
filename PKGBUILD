# Maintainer: Daniel Landau <daniel@landau.fi>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

_pkgname=mutter
pkgname=mutter-topicons-cpu-use-fix
pkgver=3.32.1
pkgrel=2
pkgdesc="A window manager for GNOME, with fix for TopIcons CPU issue"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas libcanberra
         startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11
         gnome-settings-daemon libgudev libinput pipewire xorg-server-xwayland)
makedepends=(gobject-introspection git egl-wayland meson xorg-server)
checkdepends=(xorg-server-xvfb)
groups=(gnome)
provides=(mutter)
conflicts=(mutter)
_commit=e3f3274bbf631c57f9a01b7bead6ebf6374f5be4  # tags/3.32.1^0
source=("git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        0001-wayland-output-Report-unscaled-size-even-in-logical-.patch
        216.patch
        270.patch)
sha256sums=('SKIP'
            '842162bf8cec5d69fdb80c85fd152ddd3db6a9179d11d6f81d486f79814838c0'
            'ed4f3cf738a3cffdf8a6e1a352bf24d74078c3b26fb9262c5746e0d95b9df756'
            '5141a007bd0dd99c6727bad843f9c800a7c30c1017923f5e16364e7914429a5f')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1534089
  patch -Np1 -i ../0001-wayland-output-Report-unscaled-size-even-in-logical-.patch

  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/216
  git apply -3 ../216.patch
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/270
  git apply -3 ../270.patch
}

build() {
  arch-meson $_pkgname build \
    -D egl_device=true \
    -D wayland_eglstream=true \
    -D installed_tests=false
  ninja -C build
}

check() (
  mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
  glib-compile-schemas "${GSETTINGS_SCHEMA_DIR:=$PWD/build/data}"
  export XDG_RUNTIME_DIR GSETTINGS_SCHEMA_DIR

  #dbus-run-session xvfb-run -s '+iglx -noreset' meson test -C build
)

package() {
  DESTDIR="$pkgdir" meson install -C build
}
