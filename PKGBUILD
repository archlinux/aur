# Maintainer: Matej Pivec dpivecmaster_at_gmail_dot_com

pkgname=mutter-choppy-mouse-fix
_pkgname=mutter
pkgver=3.38.2+4+g00e247ed7
pkgrel=1
pkgdesc="A window manager for GNOME (with a little patch to fix mouse stutter/choppiness, especially for games)"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas
         libcanberra startup-notification zenity libsm gnome-desktop upower
         libxkbcommon-x11 gnome-settings-daemon libgudev libinput pipewire
         xorg-server-xwayland graphene)
makedepends=(gobject-introspection git egl-wayland meson xorg-server sysprof)
checkdepends=(xorg-server-xvfb)
provides=(mutter libmutter-7.so)
conflicts=(mutter)
groups=(gnome)
install=mutter.install
#_commit=9b9051c2172078e623e8a4b0e45e38004c394a92  # tags/3.38.2^0
_commit=00e247ed7af9d762186779024bec4c3c5b9439c7  # gnome-3-38
source=("git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        "https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/168.patch")
sha256sums=('SKIP'
            'f9e71b14c791ac7553ff4ed2d0d5b612fc886c5aa771587965a6ffd99cb98b86')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  patch -Np1 < ../168.patch
}

build() {
  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"
  arch-meson $_pkgname build \
    -D egl_device=true \
    -D wayland_eglstream=true \
    -D xwayland_initfd=disabled \
    -D installed_tests=false
  meson compile -C build
}

check() (
  mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
  glib-compile-schemas "${GSETTINGS_SCHEMA_DIR:=$PWD/build/data}"
  export XDG_RUNTIME_DIR GSETTINGS_SCHEMA_DIR

  # Stacking test flaky
  dbus-run-session xvfb-run \
    -s '-screen 0 1920x1080x24 -nolisten local +iglx -noreset' \
    meson test -C build --print-errorlogs || :
)

package() {
  DESTDIR="$pkgdir" meson install -C build
}
