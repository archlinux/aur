# Patched package:
# Maintainer:  Luo Yi <langisme_at_qq_dot_com>
# Contributor: Joakim Soderlund <joakim.soderlund@gmail.com>

# Official package:
# Maintainer:  Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=mutter-rounded
pkgver=42.3
pkgrel=1
pkgdesc="A window manager for GNOME, with rounded corners patch (integrate mr1441)"
url="https://gitlab.gnome.org/GNOME/mutter"
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
install=mutter-rounded.install

_commit=1903356b45c6c884a0451580f32494ff1288656d  # tags/42.3^0
_mutter_src="$pkgname::git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
_settings_src="mutter_settings::git+https://github.com/yilozt/mutter-rounded-setting"

source=("$_mutter_src"
        "$_settings_src"
        "rounded_corners.patch"
        "shell_blur_effect.patch"
        "meta_clip_effect.c"
        "meta_clip_effect.h"
        "shader.h"
        "shell-blur-effect.h" # https://gitlab.gnome.org/GNOME/gnome-shell/-/raw/${pkgver}/src/shell-blur-effect.h
        "shell-blur-effect.c" # https://gitlab.gnome.org/GNOME/gnome-shell/-/raw/${pkgver}/src/shell-blur-effect.c
        "mr1441.patch"
        )
sha256sums=('SKIP'
            'SKIP'
            '71a533c3a398068025ade421b4f28dbba46eb408068a922334a64a8e0838aefc'
            '369390774cf8607f9033a077e0ac76113ffc1c0997627949e087c757a5f41844'
            'a78e0bdbf4d0b5c8c0f83ede60b531bf0d5d616bfee30293a1f27d32d738dbc6'
            '2ec553a260497f0ac0180512201c9819b10159a15fcbc6d5007932d8e2a44844'
            'f818921dd63cf592663817280c7481eae0852854dd4cd8865ac5fe92423c6fd5'
            '8fb024306843153b28db2f5347775ef7e8add1dd846345148a572ad5336e168b'
            '5093c7afd6ad66c0ee9fa1565ef61109f5edf958d1d32789a34ab41d0112771d'
            '484604741ae85e778c7054b855b8506e3396759f3eee7a030a5964742b8ace19')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  sed -i '1i\#!/usr/bin/gjs' mutter_settings/dist/mutter_settings.js
  mv mutter_settings/dist/mutter_settings.js mutter_settings/dist/mutter_settings

  cd $pkgname
  
  find -name "*.orig" -exec rm {} \;
  cp $srcdir/*.[ch] $srcdir/$pkgname/src
  patch -p1 < $srcdir/rounded_corners.patch
  patch -p1 < $srcdir/shell_blur_effect.patch
  patch -p1 < $srcdir/mr1441.patch
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

  install mutter_settings/dist/mutter_settings $pkgdir/usr/bin/

  _uuid=pickawindow@lluo.gitlab.com
  _schemas=org.gnome.shell.extensions.pickawindow.gschema.xml
  
  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  cp -r mutter_settings/$_uuid/* "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"

  install -d "$pkgdir/usr/share/glib-2.0/schemas/"
  ln -s "/usr/share/gnome-shell/extensions/$_uuid/schemas/$_schemas" \
    "$pkgdir/usr/share/glib-2.0/schemas/"
}
