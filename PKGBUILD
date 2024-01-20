# Maintainer: Kisaragi Hiu <mail at kisaragi-hiu.com>
# Based on the PKGBUILD of funemustation-git

pkgname=hypertimer-git
_name=hypertimer
_export=HyperTimer
pkgver=0.2.3.r6.gdabb7db
pkgrel=1
pkgdesc="A productivity tool to defeat time blindness"
url="https://codeberg.org/unfa/HyperTimer"
depends=('godot')
makedepends=('git')
optdepends=()
license=('GPL3')
arch=('x86_64')
source=("${_name}::git+https://codeberg.org/unfa/HyperTimer.git")
sha256sums=('SKIP')
provides=('hypertimer')

pkgver() {
  cd ${srcdir}/${_name}
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

PACK_PATH="/usr/share/{$_name}/${_export}.zip"

build() {
  cd ${srcdir}/${_name}

  mkdir -p "bin"
  echo "#!/bin/sh
godot --main-pack \"${PACK_PATH}\"" >"bin/${_name}"

  # do this to not need to grab the export templates
  godot --headless --path "." --export-pack "Linux/X11" "bin/${_export}.zip"
}

package() {
  cd ${srcdir}/${_name}

  install -Dm644 "bin/${_export}.zip" "$pkgdir/${PACK_PATH}"
  install -Dm755 "bin/${_name}" "$pkgdir/usr/bin/${_name}"
}
