# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgname=gnome-boxes
pkgname="${_pkgname}-git"
pkgver=44.beta+73+g18a7d511
pkgrel=1
pkgdesc="Simple GNOME application to access virtual systems"
arch=(
  x86_64
  i686
  pentium4
  aarch64
  armv7h)
url="https://wiki.gnome.org/Apps/Boxes"
license=(LGPL)
depends=(
  'cdrtools'
  'edk2-ovmf'
  'libarchive'
  'libgudev'
  'libhandy'
  'libosinfo'
  'libsecret'
  'libsoup3'
  'libvirt-glib'
  'mtools'
  'qemu-desktop'
  'spice-gtk'
  'tracker3'
  'webkit2gtk-4.1'
)
makedepends=(
  'appstream-glib'
  'git'
  'gobject-introspection'
  'meson'
  'spice-protocol'
  'vala'
  'yelp-tools'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
groups=(
  gnome-extra
  gnome-extra-git)
source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}.git"
        "git+https://gitlab.gnome.org/GNOME/gtk-frdp.git"
        "git+https://gitlab.gnome.org/GNOME/libhandy.git"
        "git+https://gitlab.gnome.org/felipeborges/libovf-glib.git")
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "${_pkgname}"

  git submodule init
  git submodule set-url subprojects/gtk-frdp "$srcdir/gtk-frdp"
  git submodule set-url subprojects/libhandy "$srcdir/libhandy"
  git submodule set-url subprojects/libovf-glib "$srcdir/libovf-glib"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
