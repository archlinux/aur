# Maintainer: Swapnil Devesh <me@sidevesh.com>

pkgname=luminance
_pkgname=Luminance
pkgver=1.0.2
pkgrel=1
pkgdesc="A simple GTK application to control brightness of displays including external displays supporting DDC/CI"
arch=('x86_64')
url="https://github.com/sidevesh/$_pkgname"
license=('GPL3')
makedepends=('git')
depends=('gtk3' 'ddcutil')
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+https://github.com/sidevesh/$_pkgname.git#tag=$pkgver" "git+https://github.com/ahshabbir/ddcbc-api.git")
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git config submodule.ddcbc-api.url "$srcdir/ddcbc-api"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/$_pkgname"
  ./build.sh
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 ./build/app "$pkgdir/usr/bin/com.sidevesh.Luminance"
  install -Dm644 "./install_files/com.sidevesh.Luminance.desktop" "$pkgdir/usr/share/applications/com.sidevesh.Luminance.desktop"
  install -Dm644 "./install_files/com.sidevesh.Luminance.gschema.xml" "$pkgdir/usr/share/glib-2.0/schemas/com.sidevesh.Luminance.gschema.xml"
  install -Dm644 "./install_files/44-backlight-permissions.rules" "$pkgdir/usr/lib/udev/rules.d/44-backlight-permissions.rules"
  install -Dm644 "./icons/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.sidevesh.Luminance.svg"
}
