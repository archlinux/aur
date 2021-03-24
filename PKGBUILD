# Maintainer: Ícar N. S. <icar.nin@pm.me>
# ArchLinux's PKGBUILD with a commit disabled to enable unstable vaapi support
# https://github.com/archlinux/svntogit-packages/blob/master/totem/repos/extra-x86_64/PKGBUILD

_gitname=totem
pkgname=totem-vaapi
pkgver=3.38.0+1+g693768c16
pkgrel=1
pkgdesc="Movie player for the GNOME desktop based on GStreamer with (unstable) VA-API support"
url="https://wiki.gnome.org/Apps/Videos"
arch=(x86_64)
license=(GPL2 custom)
depends=(totem-plparser iso-codes libpeas clutter-gtk clutter-gst grilo
         gsettings-desktop-schemas dconf python-gobject python-xdg gnome-desktop
         gst-plugins-base gst-plugins-good gst-plugins-bad gstreamer-vaapi)
makedepends=(libnautilus-extension itstool docbook-xsl python-pylint
             gobject-introspection git appstream-glib gtk-doc meson intltool)
optdepends=('gst-plugins-ugly: Extra media codecs'
            'gst-libav: Extra media codecs'
            'grilo-plugins: Media discovery'
            'python-dbus: MPRIS plugin')
groups=(gnome)
conflicts=(totem-plugin totem)
replaces=(totem-plugin)
provides=(totem)
_commit=18a9c6a988597958be014b4648696ed5eb221e5f  # tags/V_3_38_0-fixed^0
source=("git+https://gitlab.gnome.org/GNOME/totem.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgd.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd ${_gitname}
  git describe --tags | sed 's/^V_//;s/-fixed//;s/_/./g;s/-/+/g'
}

prepare() {
  cd ${_gitname}

  git submodule init
  git submodule set-url subprojects/libgd "$srcdir/libgd"
  git submodule update
# Revert the commit that disables vaapi
  git revert 190796bdfe12a3c3cdf95b88155be8d0f44de2f3 --no-edit
}

build() {
  arch-meson ${_gitname} build -D enable-gtk-doc=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dt "$pkgdir/usr/share/licenses/${_gitname}" -m644 ${_gitname}/COPYING
}
