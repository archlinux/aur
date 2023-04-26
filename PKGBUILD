# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-com>
# Contributor: Static_Rocket

pkgbase=asusctl
pkgname=(
  asusctl
  rog-control-center
)
pkgver=4.6.1
pkgrel=1
pkgdesc="A control daemon, tools, and a collection of crates for interacting with ASUS ROG laptops"
arch=('x86_64')
url="https://gitlab.com/asus-linux/asusctl"
license=('MPL2')
makedepends=(
  clang
  cmake
  fontconfig
  git
  hicolor-icon-theme
  libappindicator-gtk3
  libusb
  power-profiles-daemon
  rust
  supergfxctl
  systemd
)
_commit=bee5508099b8043563b3528ed0a55ed2fa62ef85 # tags/4.6.1^0
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
  make build
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
    hicolor-icon-theme
    libusb
    power-profiles-daemon
    systemd
  )
  install=asusctl.install
  optdepends=(
    'acpi_call: fan control'
    'supergfxctl: hybrid GPU control'
    'asusctltray: tray profile switcher'
    'rog-control-center: app to control asusctl'
  )

  cd "${pkgbase}"
  make DESTDIR="${pkgdir}" install

  _pick rogcc "${pkgdir}/usr/bin/rog-control-center" \
     "${pkgdir}/usr/share/applications/rog-control-center.desktop" \
     "${pkgdir}/usr/share/icons/hicolor/512x512/apps/rog-control-center.png" \
     "${pkgdir}/usr/share/rog-gui"
}

package_rog-control-center() {
  depends=(
    asusctl
    fontconfig
    libappindicator-gtk3
    supergfxctl
  )
  pkgdesc="App to control asusctl"
  mv rogcc/* "${pkgdir}"
}
