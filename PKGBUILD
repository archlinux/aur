# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Static_Rocket

pkgbase=asusctl
pkgname=(
  asusctl
  rog-control-center
  gnome-shell-extension-asusctl-gnome
)
pkgver=5.0.1
pkgrel=0.1
pkgdesc="A control daemon, tools, and a collection of crates for interacting with ASUS ROG laptops"
arch=('x86_64')
url="https://gitlab.com/asus-linux/asusctl"
license=('MPL-2.0')
makedepends=(
  "clang"
  "cmake"
  "fontconfig"
  "git"
  "hicolor-icon-theme"
  "libappindicator-gtk3"
  "libusb"
  "power-profiles-daemon"
  "rust"
  "systemd"

  # gnome-shell-extension
  "npm"
  "unzip"
  "yarn"
)
_commit=9aa332de3b8afc425dd955aca978f6a614e1305b # tags/5.0.1^0
source=("git+${url}.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgbase}"
  git describe --tags | sed -r 's/\.([a-z])/\1/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd "${pkgbase}"
}

build() {
  cd "${pkgbase}"

  # Keep rust/cargo build-dependency management inside the build directory
  export CARGO_HOME="${srcdir}/cargo"
  make build

  # gnome-shell extension
  cd "desktop-extensions/gnome-45"

  npm install
  npm run build
  mkdir asusctl-gnome@asus-linux.org
  unzip asusctl-gnome@asus-linux.org.zip \
    -d "asusctl-gnome@asus-linux.org/"
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

package_asusctl() {
  pkgdesc="${pkgdesc/tools/CLI tools}"
  depends=(
    "hicolor-icon-theme"
    "libusb"
    "power-profiles-daemon"
    "systemd"
  )
  install=asusctl.install
  optdepends=(
    'acpi_call: fan control'
    'supergfxctl: hybrid GPU control'
    'asusctltray: tray profile switcher'
    'rog-control-center: app to control asusctl'
    'gnome-shell-extension-asusctl-gnome: GNOME-shell extensions'
  )

  cd "${pkgbase}"
  export CARGO_HOME="${srcdir}/cargo"
  make DESTDIR="${pkgdir}" install

  _pick rogcc "${pkgdir}/usr/bin/rog-control-center" \
     "${pkgdir}/usr/share/applications/rog-control-center.desktop" \
     "${pkgdir}/usr/share/icons/hicolor/512x512/apps/rog-control-center.png" \
     "${pkgdir}/usr/share/rog-gui"
}

package_rog-control-center() {
  depends=(
    "asusctl=$pkgver"
    "fontconfig"
    "glib2"
    "gtk3"
    "hicolor-icon-theme"
    "libappindicator-gtk3"
  )
  pkgdesc="App to control asusctl"
  mv rogcc/* "${pkgdir}"
}

package_gnome-shell-extension-asusctl-gnome() {
  depends=(
    "asusctl=$pkgver"
    "dconf"
    "gnome-shell"
  )
  arch=('any')
  pkgdesc="A gnome extension exposing some of the base features of asusd in a helpful and easy to use way"

  cd "${pkgbase}/desktop-extensions/gnome-45"

  install -dm755 "${pkgdir}/usr/share/glib-2.0/schemas"
  mv "asusctl-gnome@asus-linux.org/schemas/org.gnome.shell.extensions.asusctl-gnome.gschema.xml" \
    "${pkgdir}/usr/share/glib-2.0/schemas/"
  rmdir "asusctl-gnome@asus-linux.org/schemas"

  install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions"
  mv "asusctl-gnome@asus-linux.org" \
    "${pkgdir}/usr/share/gnome-shell/extensions/"
}
