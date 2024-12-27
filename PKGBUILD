# Maintainer: taotieren <admin@taotieren.com>

pkgname=netassistant-git
_pkgname=NetAssistant
pkgver=1.0.0.r4.ge6bca9a
pkgrel=1
epoch=
pkgdesc="A network debugging assistant based on Qt GUI."
arch=($CARCH)
url="https://github.com/busyluo/NetAssistant"
license=('GPL-3.0-only')
groups=()
depends=(qt5-base)
makedepends=(
  git
  qt5-tools
)
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${_pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

pkgver() {
  cd "${srcdir}/${_pkgname}"
  (
    set -o pipefail
    git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  git -C "${srcdir}/${_pkgname}" clean -dfx
}

build() {
  cd "${srcdir}/${_pkgname}"
  qmake
  make
}

package() {
  install -Dm0755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-git}"
  install -Dm0755 "${srcdir}/${_pkgname}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
  install -Dm0644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/metainfo/io.github.busyluo.netassistant.metainfo.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>io.github.busyluo.netassistant</id>

  <name>${pkgname%-git}</name>
  <summary>${pkgname%-git}</summary>

  <metadata_license>MIT</metadata_license>
  <project_license>AGPL-3.0-only</project_license>

  <description>
    <p>
      A network debugging assistant based on Qt GUI.
    </p>
  </description>

  <launchable type="desktop-id">io.github.busyluo.netassistant.desktop</launchable>
</component>
EOF

  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/io.github.busyluo.netassistant.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application

Name=${pkgname%-git}
Comment=NetAssistant
Categories=Network;Qt;

Icon=${pkgname%-git}.png
Exec=${pkgname%-git}
Terminal=false
EOF
}
