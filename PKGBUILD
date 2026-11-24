# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Ricardo Liang (rliang) <ricardoliang@gmail.com>

pkgname=gnome-disk-utility-git
pkgver=51.beta.r65.gddd1e9c
pkgrel=1
pkgdesc="Disk Management Utility for GNOME"
url="https://gitlab.gnome.org/GNOME/gnome-disk-utility"
arch=(x86_64)
license=(GPL-2.0-or-later)
groups=(gnome gnome-git)
depends=(
    #at-spi2-core
    #cairo
    dconf
    #gcc-libs
    #gdk-pixbuf2
    glib2
    glibc
    gtk4
    #gtk4-git
    hicolor-icon-theme
    libadwaita
    #libadwaita-git
    #libcanberra
    libdvdread
    #libhandy
    libnotify
    libpwquality
    libsecret
    #pango
    parted
    systemd-libs
    udisks2
    xz
    )
makedepends=(
    appstream
    blueprint-compiler
    cargo
    docbook-xsl
    git
    glib2-devel
    meson
    systemd
    )
provides=(gnome-disk-utility)
conflicts=(gnome-disk-utility)
source=("git+https://gitlab.gnome.org/GNOME/gnome-disk-utility.git" cargo)
sha256sums=('SKIP'
            '8f5ae8e09a62e3b39e3a738a253979d03d2b64d0eae6fa0bdf2b81c123452e88')

pkgver() {
  cd gnome-disk-utility
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

#  Cargo fetch is pointless in this case as stuff will be downloaded again in build()
#prepare() {
#  cd gnome-disk-utility
#  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
#}

build() {
  chmod +x cargo
  PATH="$PWD:$PATH"

  arch-meson gnome-disk-utility build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "${pkgdir}" --no-rebuild
}
