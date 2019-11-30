# Maintainer: ksj <podhorsky.ksj@gmail.com>
# Contributor: kasa <biuta.jr@gmail.com>
# Contributor: L42y <423300@gmail.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgbase=network-manager-applet-git
pkgname=(network-manager-applet-git nm-connection-editor-git)
pkgver=1.8.25.dev.r20.g74183667
pkgrel=1
pkgdesc="Applet for managing network connections"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="http://www.gnome.org/projects/NetworkManager/"
depends=(libnm gcr libgudev gtk3 mobile-broadband-provider-info libnm-git iso-codes libnma)
makedepends=(meson libsecret libnotify gtk3 libnm gtk-doc intltool gobject-introspection git)
options=('emptydirs')
source=(git+https://gitlab.gnome.org/GNOME/network-manager-applet.git)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
           cd $srcdir/network-manager-applet/
           git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {

	arch-meson network-manager-applet build \
    -Dgtk_doc=true \
    -Dintrospection=true \
    -Dld_gc=true \
    -Dteam=true \
    -Dwwan=true \
    -Dappindicator=yes \
    -Dselinux=false \
    -Db_lto=false

  ninja -C build
}

check() {
  ninja -C build test
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_network-manager-applet-git() {
  provides=("network-manager-applet")
  conflicts=(network-manager-applet)
  replaces=(network-manager-applet)
  depends=(nm-connection-editor libnm libmm-glib libnotify libsecret)

  DESTDIR="${pkgdir}" ninja -C build install
  
      ### Split nm-connection-editor
     _pick nm-connection-editor "$pkgdir"/usr/bin/nm-connection-editor
     _pick nm-connection-editor "$pkgdir"/usr/share/applications/nm-connection-editor.desktop
     _pick nm-connection-editor "$pkgdir"/usr/share/icons/hicolor/22x22/apps/nm-device-wwan.png
     _pick nm-connection-editor "$pkgdir"/usr/share/locale
     _pick nm-connection-editor "$pkgdir"/usr/share/man/man1/nm-connection-editor.1
     _pick nm-connection-editor "$pkgdir"/usr/share/metainfo
}

package_nm-connection-editor-git() {
  pkgdesc="NetworkManager GUI connection editor and widgets"
  provides=("nm-connection-editor")
  depends=("libnma" "libnm-gtk")
  conflicts=(nm-connection-editor)
  replaces=(nm-connection-editor)
   mv nm-connection-editor/* "$pkgdir"
}


