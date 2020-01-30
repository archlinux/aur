# shellcheck shell=bash disable=SC2034
# Maintainer: Andrew Dunai <andrew@dun.ai>
# Contributor: Damien Flament <damien.flament@gmx.com>

pkgname=voxelshop
pkgver=1.8.26
pkgrel=2
pkgdesc='An extremely intuitive and powerful cross-platform software to modify and create voxel objects which was designed from the ground up in close collaboration with artists.'

_application_name="VoxelShop"
_generic_name="Voxel Editor"
_source_filename="${pkgname}-${pkgver}.zip"
_icon_filename="${pkgname}.png"

url=https://blackflux.com/node/11
license=('Apache')
groups=()
depends=('java-runtime>=8' 'bash')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}"
  "${pkgname}.desktop"
  "${_icon_filename}::https://raw.githubusercontent.com/simlu/${pkgname}/${pkgver}/resource/img/icons/application/logo.png"
  "${_source_filename}::https://github.com/simlu/${pkgname}/releases/download/${pkgver}/${pkgname}-bin.zip")
noextract=("${_source_filename}")
sha256sums=('1f1535bd452294f1f8261bdd0432e0100e43f41650ff25aa67d92cf786be7df8'
  '510d8a61c162af0cfed35548fbd5c5a7351ac9735ab27ff7da7a7dbb44346a15'
  '9117799a571cd29a0402bc43a58c2d3b7caf590a2bcf530347ab3f709e1ee25b'
  '7cba6a2bce6c3ba3d93f1505bc5af00150f00869ea8f97c9a4929d63bd06d11a')
arch=('any')

prepare() {
  # Generates the startup script and the Desktop file from the templates and
  # extract sources manually.
  sed -i "s/{{pkgname}}/${pkgname}/g" "${pkgname}"

  sed -i -e "s/{{pkgname}}/${pkgname}/g" \
    -e "s/{{pkgdesc}}/${pkgdesc}/g" \
    -e "s/{{_application_name}}/${_application_name}/g" \
    -e "s/{{_generic_name}}/${_generic_name}/g" \
    "${pkgname}.desktop"

  # Unzip the sources. This is usually done automatically by makepkg. But the
  # extracted directory name conflicts with the startup script name.
  if [[ ! -d "${pkgname}-${pkgver}" ]]; then
    mkdir "${pkgname}-${pkgver}"
    cd "${pkgname}-${pkgver}" || return
    bsdtar -xkf "${srcdir}/${_source_filename}"
    mv "${pkgname}"/* .
    rmdir "${pkgname}"
  fi
}

package() {
  # Installs:
  #  - the custom startup script
  #  - the desktop file
  #  - the application icon
  #  - the jars.
  #
  install -D -t "${pkgdir}/usr/bin" "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps" "${_icon_filename}"

  cd "${srcdir}/${pkgname}-${pkgver}" || return

  install -Dm644 -t "${pkgdir}/usr/share/java/${pkgname}" "${pkgname}-start.jar"
  install -Dm644 -t "${pkgdir}/usr/share/java/${pkgname}/lib" lib/*
}
