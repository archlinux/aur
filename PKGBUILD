# Maintainer: Norbert Pfeiler <norbert.pfeiler ät gmail.com>
# Contributor: Christian Assfalg <ch.assfalg_at_gmx_dot_de>
# Patch by Jan Holthuis
# Also Maintainers and Contributors of the ›mutter‹ package, this package is based on

_realname=mutter
pkgname=$_realname-catalyst
pkgver=3.30.0+13+g2fb3db765
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
)
makedepends=('intltool'
  'gobject-introspection'
  'git'
  'egl-wayland'
)
conflicts=('mutter' "gnome-shell>${pkgver:0:6}+999")
provides=("mutter=${pkgver}")
groups=('gnome')
_commit=2fb3db7659caa3627a473fefabc4d6a87f688cee  # master
source=("git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
  "startup-notification.patch"
  "catalyst-workaround-v2.patch"
  "catalyst mutter cogl.patch")
sha256sums=('SKIP'
            '5a35ca4794fc361219658d9fae24a3ca21a365f2cb1901702961ac869c759366'
            '2564846288ea55262d681d38f7e43609c63e94990df1cb0a6b99e16e2c073d14'
            '55079a9daddedc22d9fe4dcfe2e87607345dfafb370f8e7fb6a98c0acae3348a')

pkgver() {
  cd "$_realname"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "$_realname"

  # https://bugs.archlinux.org/task/51940
  # As of 2018-05-08: Still needed, according to fmuellner
  patch -Np1 -i ../startup-notification.patch

  # https://bugzilla.gnome.org/show_bug.cgi?id=741581
  echo "Skipping call to output_set_presentation_xrandr to fix issue with catalyst"
  patch -Np1 -i "${srcdir}/catalyst-workaround-v2.patch"
  # https://bugzilla.gnome.org/show_bug.cgi?id=756306
  echo "workaround compatibility shaders used in fw compat ctx in cogl"
  patch -Np1 -i "${srcdir}/catalyst mutter cogl.patch"
  echo "Patches applied"

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$_realname"
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --disable-static \
    --disable-schemas-compile \
    --enable-compile-warnings=minimum \
    --enable-gtk-doc \
    --enable-egl-device \
    --enable-remote-desktop

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' \
      -i {.,cogl,clutter}/libtool

  make
}

package() {
  cd "$_realname"
  make DESTDIR="$pkgdir" install
}
