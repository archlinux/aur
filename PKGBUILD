# Maintainer: Norbert Pfeiler <norbert.pfeiler ät gmail.com>
# Contributor: Christian Assfalg <ch.assfalg_at_gmx_dot_de>
# Patch by Jan Holthuis
# Also Maintainers and Contributors of the ›mutter‹ package, this package is based on

_realname=mutter
pkgname=$_realname-catalyst
pkgver=3.30.2
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
conflicts=('mutter' "gnome-shell>1:${pkgver:0:6}+999")
provides=("mutter=${pkgver}")
groups=('gnome')
_commit=bcd6103c44ff74ebffd1737b8e0f3a952b83bd54  # tags/3.30.2^0
source=("git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
  "https://gitlab.gnome.org/vanvugt/mutter/commit/fc02b040f3b750b0513f812813351c09795950f6.patch"
  "startup-notification.patch"
  "catalyst-workaround-v2.patch"
  "catalyst mutter cogl.patch")
sha256sums=('SKIP'
            'dffa2ca19281b9fa5a81bf80bd46a8eae78325c7e1f8b2a25c33945aa7cc0903'
            '5a35ca4794fc361219658d9fae24a3ca21a365f2cb1901702961ac869c759366'
            '2564846288ea55262d681d38f7e43609c63e94990df1cb0a6b99e16e2c073d14'
            '55079a9daddedc22d9fe4dcfe2e87607345dfafb370f8e7fb6a98c0acae3348a')

pkgver() {
  cd "$_realname"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "$_realname"

  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/216
  git apply -3 ../fc02b040f3b750b0513f812813351c09795950f6.patch

  # https://bugs.archlinux.org/task/51940
  # As of 2018-05-08: Still needed, according to fmuellner
  git apply -3 ../startup-notification.patch

  # https://bugzilla.gnome.org/show_bug.cgi?id=741581
  echo "Skipping call to output_set_presentation_xrandr to fix issue with catalyst"
  git apply -3 "${srcdir}/catalyst-workaround-v2.patch"
  # https://bugzilla.gnome.org/show_bug.cgi?id=756306
  echo "workaround compatibility shaders used in fw compat ctx in cogl"
  git apply -3 "${srcdir}/catalyst mutter cogl.patch"
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
