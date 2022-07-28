# Maintainer:  Aleksana QwQ <me@aleksana.moe>

pkgname=mutter-ubuntu
pkgver=42.3_0.1
pkgrel=1
pkgdesc="A window manager for GNOME, with ubuntu patches"
url="https://salsa.debian.org/gnome-team/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas
         libcanberra startup-notification zenity libsm gnome-desktop 
         libxkbcommon-x11 gnome-settings-daemon libgudev libinput pipewire
         xorg-xwayland graphene libxkbfile libsysprof-capture)
makedepends=(gobject-introspection git egl-wayland meson xorg-server
             wayland-protocols sysprof gi-docgen)
checkdepends=(xorg-server-xvfb wireplumber python-dbusmock)
provides=(libmutter-10.so mutter)
conflicts=(mutter)

_tag=ubuntu/42.3-0ubuntu1

source=("$pkgname::git+$url.git#tag=$_tag")
sha256sums=('SKIP')

pkgver(){
  echo $_tag | sed 's/ubuntu\///g;s/ubuntu/./g;s/-/_/g'
}
            
prepare() {
  cd $pkgname  
  find -name "*.orig" -exec rm {} \;
  
  patchdir="$srcdir/$pkgname/debian/patches"
  for patchname in $(cat $patchdir/series);do
    patch -p1 < $patchdir/$patchname
  done
}

build() {
  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson $pkgname build \
    -D egl_device=true \
    -D wayland_eglstream=true \
    -D installed_tests=false
  meson compile -C build
}

_check() (
  mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
  glib-compile-schemas "${GSETTINGS_SCHEMA_DIR:=$PWD/build/data}"
  export XDG_RUNTIME_DIR GSETTINGS_SCHEMA_DIR

  pipewire &
  _p1=$!

  wireplumber &
  _p2=$!

  trap "kill $_p1 $_p2; wait" EXIT

  meson test -C build --print-errorlogs -t 3
)

check() {
  dbus-run-session xvfb-run -s '-nolisten local +iglx -noreset' \
    bash -c "$(declare -f _check); _check"
}

package() {
  meson install -C build --destdir "$pkgdir"
}
