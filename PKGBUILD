# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-com>
# Contributor: Static_Rocket

pkgbase=asusctl
pkgname=(asusctl rog-control-center)
pkgver=4.5.2
pkgrel=1
pkgdesc="A control daemon, tools, and a collection of crates for interacting with ASUS ROG laptops"
arch=('x86_64')
url="https://gitlab.com/asus-linux/asusctl"
license=('MPL2')
makedepends=('cmake' 'git' 'rust'
             'at-spi2-core' 'fontconfig' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3'
             'libusb' 'power-profiles-daemon' 'supergfxctl' 'systemd')
conflicts=('asusctl-git')
_commit=14bf07ba79ae86103d1caf06cd09c36e78b5a8e2 # tags/4.5.2^0
source=("git+${url}.git#commit=$_commit"
        "asusd-nohwdep.service")
sha256sums=('SKIP'
            'f6cf6fe6e379f29282c503351cf7e09c5141572c9acc183b934764099958e4d2')

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
  depends=('libusb' 'systemd' 'power-profiles-daemon' 'hicolor-icon-theme')
  install='asusctl.install'
  optdepends=('acpi_call: fan control'
            'supergfxctl: hybrid GPU control'
            'asusctltray: tray profile switcher'
            'rog-control-center: app to control asusctl')

  cd "${pkgbase}"
  make DESTDIR="${pkgdir}" install

  install -Dm 644 "${srcdir}/asusd-nohwdep.service" \
    -t "${pkgdir}/usr/lib/systemd/system"

  _pick rogcc "${pkgdir}/usr/bin/rog-control-center" \
     "${pkgdir}/usr/share/applications/rog-control-center.desktop" \
     "${pkgdir}/usr/share/icons/hicolor/512x512/apps/rog-control-center.png" \
     "${pkgdir}/usr/share/rog-gui"
}

package_rog-control-center() {
  depends=('asusctl' 'at-spi2-core' 'fontconfig' 'gtk3' 'libappindicator-gtk3' 'supergfxctl')
  pkgdesc="App to control asusctl"
  mv rogcc/* "${pkgdir}"
}
