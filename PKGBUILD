# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Serge K <arch@phnx47.net>

pkgbase=rustrover-eap
pkgname=("${pkgbase}" "${pkgbase}-jre")
_buildver=243.20847.50
_pkgver=2024.3
if ! [[ $_buildver ]]; then _dlver=${_pkgver}; pkgver=${_pkgver}
else _dlver=${_buildver}; pkgver=${_pkgver}pre+${_buildver}
fi
pkgrel=1
pkgdesc='JetBrains IDE for Rust Developers (EAP)'
arch=('x86_64' 'aarch64')
url='https://www.jetbrains.com/rust/nextversion/'
license=('custom:jetbrains')
options=('!strip')
source=(
  "jetbrains-${pkgbase}.desktop"
  'LICENSE'
)
source_x86_64=("RustRover-${_dlver}-${arch[0]}.tar.gz::https://download-cdn.jetbrains.com/rustrover/RustRover-${_dlver}.tar.gz")
source_aarch64=("RustRover-${_dlver}-${arch[1]}.tar.gz::https://download-cdn.jetbrains.com/rustrover/RustRover-${_dlver}-${arch[1]}.tar.gz")
sha256sums=('cd4f42c4d3f9c0fb967a96da2c0c71884df55fe21409a97d12690e8a4c878a06'
            'db26ca1fd026fbacfeb87f4bad42d78b3512bb733ce1c566bdd5b751e77d7bb3')
sha256sums_x86_64=('7700ba54f2e8a18e1c7ccf3fd7481980f4e739ac5ae8dfb7d3d0ccb2c480d868')
sha256sums_aarch64=('a79ccdcab5fded8ad626475017c9e6810880a39db1a7167e5590299909188203')

package_rustrover-eap() {
  depends=(
    'libdbusmenu-glib'
  )
  optdepends=(
    "${pkgbase}-jre: JetBrains custom Java Runtime (Recommended)"
    "java-runtime=17: JRE - Required if ${pkgbase}-jre is not installed"
    'rust-src: Rust toolchain'
  )
  backup=(
    "opt/${pkgbase}/bin/rustrover64.vmoptions"
    "opt/${pkgbase}/bin/idea.properties"
  )

  for _dir in RustRover-{${_dlver},${_pkgver}}; do
    [[ -d ${_dir} ]] && break
  done

  install -dm755 "${pkgdir}/opt/${pkgbase}"
  cp -a "${_dir}" -T "${pkgdir}/opt/${pkgbase}"
  rm -rf "${pkgdir}/opt/${pkgbase}/jbr"

  install -dm755 "${pkgdir}/usr/bin"
  ln -rs "${pkgdir}/opt/${pkgbase}/bin/${pkgbase%-*}.sh" "${pkgdir}/usr/bin/${pkgbase}"

  install -Dm644 "jetbrains-${pkgbase}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgbase}"

  install -dm755 "${pkgdir}/usr/share/pixmaps"
  ln -rs "${pkgdir}/opt/${pkgbase}/bin/${pkgbase%-*}.png" "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
  ln -rs "${pkgdir}/opt/${pkgbase}/bin/${pkgbase%-*}.svg" "${pkgdir}/usr/share/pixmaps/${pkgbase}.svg"
}

package_rustrover-eap-jre() {
  license=('GPL2')
  pkgdesc='JBR (JetBrains Runtime) for RustRover (EAP) - a patched JRE'
  url='https://github.com/JetBrains/JetBrainsRuntime'

  for _dir in RustRover-{${_dlver},${_pkgver}}; do
    [[ -d ${_dir} ]] && break
  done

  install -dm755 "${pkgdir}/opt/${pkgbase}"
  cp -a "${_dir}/jbr" -t "${pkgdir}/opt/${pkgbase}"
}
