# Maintainer: Norbert Pfeiler <norbert.pfeiler ät gmail.com>
# Contributor: Christian Assfalg <ch.assfalg_at_gmx_dot_de>
# Patch by Jan Holthuis
# Also Maintainers and Contributors of the ›mutter‹ package, this package is based on

_realname=mutter
pkgname=$_realname-catalyst
pkgver=3.36.5
pkgrel=1
pkgdesc="A window manager for GNOME with patches for catalyst compatibility"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=('GPL')
depends=('dconf'
  'gobject-introspection-runtime'
  'gsettings-desktop-schemas'
  'libcanberra'
  'startup-notification'
  'zenity'
  'libsm'
  "gnome-desktop" # >=1:${pkgver:0:6}" # don’t build with outdated libraries
  'upower'
  'libxkbcommon-x11'
  'gnome-settings-daemon'
  'libgudev'
  'libinput'
  'pipewire'
  'xorg-server-xwayland'
)
makedepends=('gobject-introspection'
  'git'
  'egl-wayland'
  'meson'
  'xorg-server'
  'sysprof'
)
checkdepends=('xorg-server-xvfb')
conflicts=('mutter' "gnome-shell>1:${pkgver:0:6}+999")
provides=("mutter=${pkgver}" 'libmutter-6.so')
groups=('gnome')
install=mutter.install
_commit=7d061a06dec02278bef1054e502cae8837c39f2f  # tags/3.36.5^0
source=("git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        "catalyst-workaround-v2.patch"
        "catalyst mutter cogl.patch")
sha256sums=('SKIP'
            '2564846288ea55262d681d38f7e43609c63e94990df1cb0a6b99e16e2c073d14'
            '7cb958b4fe5faf9edd4114b2682958635717755897f0d5f55d45d0bd8d7c2b77')

pkgver() {
  cd "$_realname"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "$_realname"

  # https://bugzilla.gnome.org/show_bug.cgi?id=741581
  echo "Skipping call to output_set_presentation_xrandr to fix issue with catalyst"
  git apply -3 "${srcdir}/catalyst-workaround-v2.patch"
  # https://bugzilla.gnome.org/show_bug.cgi?id=756306
  echo "workaround compatibility shaders used in fw compat ctx in cogl"
  git apply -3 "${srcdir}/catalyst mutter cogl.patch"
  echo "Patches applied"
}

build() {
  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"
  arch-meson $_realname build \
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
