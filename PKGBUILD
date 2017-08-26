# Maintainer: Andrew Dunai <andrew@dun.ai>
# Contributor: Damien Flament <damien.flament@gmx.com>
pkgname=voxelshop
pkgver=1.8.11
pkgrel=1
pkgdesc='An extremely intuitive and powerful cross-platform software to modify and create voxel objects which was designed from the ground up in close collaboration with artists.'
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
_source_filename="${pkgname}-${pkgver}.zip"
source=('voxelshop'
        "${_source_filename}::https://github.com/simlu/${pkgname}/releases/download/${pkgver}/${pkgname}-bin.zip")
noextract=("${_source_filename}")
sha256sums=('1f1535bd452294f1f8261bdd0432e0100e43f41650ff25aa67d92cf786be7df8'
            '913cc42e789f5914ab894ed6157be94bcedc5d5cb528481bf6e167b0e3d70354')
arch=('any')


prepare() {
  msg2 "Generating startup script..."
  sed -i "s/{{pkgname}}/${pkgname}/g" "${pkgname}"

  # Unzip the sources. This is usually done automatically by makepkg. But the
  # extracted directory name conflicts with the startup script name.
  msg2 "Extracting sources..."
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
  
  msg2 "Installing the jars..." 
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 -t "${pkgdir}/usr/share/java/${pkgname}" "${pkgname}-start.jar"
  install -Dm644 -t "${pkgdir}/usr/share/java/${pkgname}/lib" lib/*
}

