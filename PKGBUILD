# Maintainer: Luo Yi <langisme_at_qq_dot_com>

# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=mutter-rounded
pkgver=40.5
pkgrel=1
pkgdesc="A window manager for GNOME, with rounded corners patch"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas
         libcanberra startup-notification zenity libsm gnome-desktop upower
         libxkbcommon-x11 gnome-settings-daemon libgudev libinput pipewire
         xorg-xwayland graphene libxkbfile)
makedepends=(gobject-introspection git egl-wayland meson xorg-server
             wayland-protocols)
checkdepends=(xorg-server-xvfb pipewire-media-session)
provides=(mutter libmutter-8.so)
conflicts=(mutter)
groups=(gnome)
install=mutter.install

_commit=2b2b3ab8502a5bcc2436e169279d2421f6f1a605  # tags/40.5^0
_mutter_src="$pkgname::git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
_setting_src="mutter_setting::https://gitlab.gnome.org/lluo/mutter-rounded-setting/uploads/100ce7589dd614832b8d500f3602ebe9/main.js"

if [ "${LANG}" = "zh_CN.UTF-8" ] ; then
  _mutter_src="$pkgname::git+https://gitee.com/mirrors_GNOME/mutter.git#commit=$_commit"
  _setting_src="mutter_setting::https://gitee.com/lluo/mutter-rounded-setting/attach_files/834737/download/main.js"
fi

source=("$_mutter_src"
        "rounded_corners_${pkgver}.patch"
        "meta_clip_effect.c"
        "meta_clip_effect.h"
        "$_setting_src")
sha256sums=('SKIP'
            '0ea54e94d6f497fc37044a0bb6ec2e992cafb1bf9b6b38053aa7b1f157955767'
            '0fdb280566584dfe7226e56b5aa1e7e3f6ec462d097a6ebb9913fb08c5b60e58'
            'cd836fa66e219f58d7294536e30f3654c41d45423861da633bb41ad0bc550de3'
            'bf3c1cd55f97ae9482b368b585575eb61e07f09c189a2bc0d472fe7149a9d3a0')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  sed -i '1i\#!/usr/bin/gjs' mutter_setting

  cd $pkgname
  cp $srcdir/meta_clip_effect.[ch] $srcdir/$pkgname/src
  patch -p1 < $srcdir/rounded_corners_${pkgver}.patch
}

build() {
  echo "skip" > /dev/null
  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"
  arch-meson $pkgname build \
    -D egl_device=true \
    -D wayland_eglstream=true \
    -D installed_tests=false \
    -D profiler=false
  meson compile -C build
}

_check() (
  mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
  glib-compile-schemas "${GSETTINGS_SCHEMA_DIR:=$PWD/build/data}"
  export XDG_RUNTIME_DIR GSETTINGS_SCHEMA_DIR

  pipewire &
  _p1=$!

  pipewire-media-session &
  _p2=$!

  trap "kill $_p1 $_p2; wait" EXIT

  meson test -C build --print-errorlogs
)

check() {
  dbus-run-session xvfb-run \
    -s '-screen 0 1920x1080x24 -nolisten local +iglx -noreset' \
    bash -c "$(declare -f _check); _check"
}

package() {
  meson install -C build --destdir "$pkgdir"
  install mutter_setting $pkgdir/usr/bin/
}
