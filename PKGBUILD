# Maintainer: Sick Codes <info at sick dot codes>
pkgname=doomtools-bin
_pkgname=${pkgname%-bin}
pkgver=2022.07.28
pkgrel=005119764
_jar="${_pkgname}-${pkgver}.${pkgrel}.jar"
pkgdesc="Doom-related tools for Java. Home of DECOHack and lots of other utilities. Build WAD projects (and soon, other kinds) with ease! Includes decohack dimgconv dmxconv doommake wadmerge wadscript wadtex wswantbl wtexport wtexscan"
arch=('x86_64')
url="https://github.com/MTrop/DoomTools"
license=('MIT')
provides=(${_pkgname} decohack dimgconv dmxconv doommake wadmerge wadscript wadtex wswantbl wtexport wtexscan)
depends=()
optdepends=()
makedepends=()
source=("https://github.com/MTrop/DoomTools/releases/download/${pkgver}-RELEASE/${_pkgname}-bash-${pkgver}.${pkgrel}.tar.gz")
options=('!strip')
sha256sums=('4d049600a62bb82a964605ebb4a7764198e3f00f634fa6a8033f02c13437caa4')

package() {

  SCRIPTS=({wtexport,wadscript,rookscript,doommake,dmxconv,dimgconv,decohack,wtexscan,wswantbl,wadtex,wadmerge})

  # /opt/doomtools
  # install -dm755 "${pkgdir}/opt/${_pkgname}/"
  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -dm755 "${pkgdir}/usr/share/${_pkgname}"

  cp -r "${srcdir}"/* "${pkgdir}/usr/share/${_pkgname}/"
  chmod -R +x "${pkgdir}/usr/share/${_pkgname}/"

  # add all tools
  # cp "${srcdir}"/{wtexport,wadscript,rookscript,doommake,dmxconv,dimgconv,decohack,wtexscan,wswantbl,wadtex,wadmerge} "${pkgdir}/usr/bin/"
  # chmod +x "${pkgdir}"/usr/bin/{wtexport,wadscript,rookscript,doommake,dmxconv,dimgconv,decohack,wtexscan,wswantbl,wadtex,wadmerge}

  SCRIPTS=({wtexport,wadscript,rookscript,doommake,dmxconv,dimgconv,decohack,wtexscan,wswantbl,wadtex,wadmerge})

  for SCRIPT in "${SCRIPTS[@]}"; do
    ln -s "${pkgdir}/usr/share/${_pkgname}/${SCRIPT}" "${pkgdir}/usr/bin/${SCRIPT}" 
    chmod +x "${pkgdir}/usr/bin/${SCRIPT}"
  done

  # add the jar
  install -Dm 755 "${srcdir}/jar/${_jar}" "${pkgdir}/usr/share/${_pkgname}/${_jar}"

  touch "${pkgdir}/usr/bin/${_pkgname}"

  cat > "${pkgdir}/usr/bin/${_pkgname}" << EOF
#!/usr/bin/env bash
# export DOOMTOOLS_PATH=/usr/share/${_pkgname}/
# export JAR_PATH=/usr/share/${_pkgname}
exec java -jar /usr/share/${_pkgname}/${_jar} "\$@"
EOF
  chmod +x "${pkgdir}/usr/bin/${_pkgname}"

  # add licenses
  cp -r "${srcdir}"/docs/* "${pkgdir}/usr/share/licenses/${_pkgname}/"

}

