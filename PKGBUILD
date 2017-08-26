# Maintainer: Andrew Dunai <andrew@dun.ai>
# Contributor: Damien Flament <damien.flament@gmx.com>
pkgname=voxelshop
_pkgname_upper=VoxelShop
pkgver=1.8.02
pkgrel=2
pkgdesc='An extremely intuitive and powerful cross-platform software to modify and create voxel objects which was designed from the ground up in close collaboration with artists.'
url=http://blackflux.com/node/11
license=('Apache')
groups=()
depends=('java-runtime-common' 'bash')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('voxelshop'
        "https://github.com/simlu/voxelshop/releases/download/${pkgver}/VoxelShop-java-all-os-fast.zip")
noextract=()
sha256sums=('69ff1076bf585855c81862b06bf50bd67621ac435d0c0f4a2ac3d19aa31317aa'
            '86c1fd50ef32b17be92df37d6a5c2206e456d99bc7abe4da80a44f49d2a377d3')
arch=('any')

package() {
  # Install the distributed files in /opt
  cd "${srcdir}/${_pkgname_upper}"

  install -Dm755 -t "${pkgdir}/opt/${pkgname}" data/*

  # Generate the startup script
  install -d ${pkgdir}/usr/bin

  cat <<_STARTUP_SCRIPT_ >${pkgdir}/usr/bin/${pkgname}
#!/bin/bash

cd /opt/${pkgname}
declare -r DATA_DIR=\${XDG_DATA_HOME:-"\${HOME}/.local/share"}/${pkgname}

# Update the Getdown configuration file
install -CDm644 -t "\${DATA_DIR}" getdown.txt

# Start the application using Getdown
java -jar getdown-client.jar "\${DATA_DIR}"

_STARTUP_SCRIPT_

  chmod +x ${pkgdir}/usr/bin/${pkgname}
  
  # Add a symlink to the startup script using the camel-cased package name
  ln -s "${pkgname}" "${pkgdir}/usr/bin/${_pkgname_upper}"
}

