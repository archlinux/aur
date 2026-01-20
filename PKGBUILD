# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>

pkgname=gnome-bluetooth
pkgver=3.34.5+r16+g61cfff1c
pkgrel=3
pkgdesc="GNOME Bluetooth Subsystem (legacy)"
url="https://wiki.gnome.org/Projects/GnomeBluetooth"
arch=(x86_64)
license=(
  GPL
  LGPL
)
depends=(
  bluez
  gtk3
  libcanberra
  libnotify
  systemd
)
makedepends=(
  docbook-xsl
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
)
checkdepends=(python-dbusmock)
provides=(libgnome-bluetooth.so)
_commit=61cfff1cf33e195c254a9a80abee7b377a6d8d36  # gnome-3-34
source=("git+https://gitlab.gnome.org/GNOME/gnome-bluetooth.git#commit=$_commit")
b2sums=('6a9785cb75e2417e1ddccf9ca3db907a870f53b1ec9f19d4f0ca1640498bc7fe77e26ed39b87a36f8eb4d15eb344a287dd96f27d0d0901b4e8cc54a8cb2f937f')

pkgver() {
  cd gnome-bluetooth
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd gnome-bluetooth

  # Fix build with newer Meson
  git cherry-pick -n f02378b9d587b8b3295e4d0e0b477c850535df22

  # Fix GIRepository 3.0 API changes for PyGObject 3.52+ (Python 3.14)
  sed -i "s/GIRepository', '2.0'/GIRepository', '3.0'/" tests/integration-test
  sed -i "s/GIRepository.Repository.prepend_library_path/GIRepository.Repository.dup_default().prepend_library_path/" tests/integration-test
  sed -i "s/GIRepository.Repository.prepend_search_path/GIRepository.Repository.dup_default().prepend_search_path/" tests/integration-test

  # Fix tearDownClass not calling super() to stop the dbus daemon
  sed -i "s/cls.p_mock.wait()/cls.p_mock.wait(); super().tearDownClass()/" tests/integration-test
}

build() {
  local meson_options=(
    -D gtk_doc=true
    -D icon_update=false
    -D sendto=false
  )

  arch-meson gnome-bluetooth build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
