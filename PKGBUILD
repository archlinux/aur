# Maintainer: Andrew Dunai <andrew@dun.ai>
# Contributor: Damien Flament <damien.flament@gmx.com>

pkgname=voxelshop
pkgver=1.8.11
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
            '913cc42e789f5914ab894ed6157be94bcedc5d5cb528481bf6e167b0e3d70354')
arch=('any')


prepare() {
  msg2 "Generating startup script..."
  sed -i "s/{{pkgname}}/${pkgname}/g" "${pkgname}"

  msg2 "Generating Desktop file..."
  sed -i -e "s/{{pkgname}}/${pkgname}/g" \
    -e "s/{{pkgdesc}}/${pkgdesc}/g" \
    -e "s/{{_application_name}}/${_application_name}/g" \
    -e "s/{{_generic_name}}/${_generic_name}/g" \
    "${pkgname}.desktop"

  # Unzip the sources. This is usually done automatically by makepkg. But the
  # extracted directory name conflicts with the startup script name.
  msg2 "Extracting sources manually..."
  if [[ ! -d "${pkgname}-${pkgver}" ]]
  then
    mkdir "${pkgname}-${pkgver}"
    cd "${pkgname}-${pkgver}"
    bsdtar -xkf "${srcdir}/${_source_filename}"
    mv "${pkgname}"/* .
    rmdir "${pkgname}"
  fi
}

package() {
  msg2 "Installing startup script..."
  install -D -t "${pkgdir}/usr/bin" "${pkgname}"

  msg2 "Installing Desktop file..."
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  
  msg2 "Installing the icon..."
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps" "${_icon_filename}"

  msg2 "Installing the jars..." 
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 -t "${pkgdir}/usr/share/java/${pkgname}" "${pkgname}-start.jar"
  install -Dm644 -t "${pkgdir}/usr/share/java/${pkgname}/lib" lib/*
}

