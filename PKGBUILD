# Maintainer: madelineceleste

pkgname=flatpak-local-git
_pkgname=flatpak
pkgver=1.16.1+7+gb5f9d6e1
pkgrel=1
pkgdesc="Flatpak patch that makes stuff stored in ~/.local/flatpak instead of ~/.var"
arch=(x86_64 aarch64)
url="https://github.com/flatpak/flatpak"
license=(LGPL2.1)
depends=('ostree' 'libarchive' 'bubblewrap' 'appstream-glib' 'polkit' 'appstream' 'xdg-dbus-proxy' 'glib2-devel' 'gobject-introspection' 'socat')
makedepends=('git' 'meson' 'ninja' 'gtk-doc' 'docbook-xsl' 'docbook-xml' 'python' 'python-pyparsing' 'gi-docgen')
provides=('flatpak')
conflicts=('flatpak')
source=("git+https://github.com/flatpak/flatpak.git")
sha256sums=('SKIP')
options=(!debug) # dont waaaaaant flatpak-local-git-debug package please

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
    cd $_pkgname
    # replace .var with .local/flatpak
    grep -rl '\.var' . | while read -r f; do
        sed -i "s|\.var|.local/flatpak|g" "$f"
    done
}


build() {
  cd $_pkgname
  meson setup \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    -Dselinux_module=disabled \
    -Ddbus_config_dir=/usr/share/dbus-1/system.d \
    -Dprivileged_group=sudo \
    -Drun_media_dir=/media \
    -Dsystem_bubblewrap=bwrap \
    -Dsystem_dbus_proxy=xdg-dbus-proxy \
    -Dsystemdsystemunitdir=/usr/lib/systemd/system \
    -Dsystemdsystemenvgendir=/usr/lib/systemd/system-environment-generators \
    -Dgtkdoc=disabled \
  build
  meson compile -C build
}

package() {
  cd $_pkgname
  
  DESTDIR="$pkgdir" meson install -C build
}
