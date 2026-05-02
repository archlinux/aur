# Maintainer: Junho <your-email at domain dot com>

pkgname=pjecalc-cidadao-bin
pkgver=2.15.1
pkgrel=2
pkgdesc='PJe-Calc Cidadao packaged for Arch Linux with a bundled Temurin JRE 8'
arch=('x86_64')
url='https://www.trt8.jus.br/pjecalc-cidadao/instalando-o-pje-calc-cidadao'
license=('custom')
depends=('bash' 'rsync')
makedepends=('7zip')
provides=('pjecalc-cidadao')
conflicts=('pjecalc-cidadao')
options=('!strip')

_upstream_dir="pjecalc-windows64-${pkgver}"
_upstream_installer="pjecalc-${pkgver}-instalador-x64.exe"
_jre_archive='OpenJDK8U-jre_x64_linux_hotspot_8u482b08.tar.gz'

source=(
  "${_upstream_installer}::https://www.trt8.jus.br/sites/portal/files/roles/pje-calc/${_upstream_installer}"
  "${_jre_archive}::https://download.eclipse.org/temurin-compliance/temurin/8/jdk8u482-b08/${_jre_archive}"
  'consolidado-header-linux-font-metrics.patch'
  'pjecalc-cidadao.sh'
  'pjecalc-cidadao.desktop'
)
sha256sums=(
  '119b59c87a98c3f0e973c0390d098fa594c360b1119d7ea0a8278159819b3838'
  '01672ca52509f4cb1ffa8aed905808fed7b984f3e279cb13d90a6e865ff6199f'
  '0e8a5c614b95dfafd60cd7f50e3498f1ded297e4a18fbfc3164cb288d5a2fe7b'
  'SKIP'
  'SKIP'
)
noextract=("${_upstream_installer}")

prepare() {
  cd "${srcdir}"

  rm -rf upstream
  mkdir -p upstream
  7z x -y "-oupstream" "${_upstream_installer}" >/dev/null

  if [[ ! -d "upstream/${_upstream_dir}" ]]; then
    printf 'Expected extracted directory %s was not found.\n' "${_upstream_dir}" >&2
    return 1
  fi
}

package() {
  cd "${srcdir}"

  local pkgroot="${pkgdir}/opt/pjecalc-cidadao"
  local appdir="${pkgroot}/app-dist"
  local jredir

  install -d "${appdir}"
  cp -r --no-preserve=ownership "upstream/${_upstream_dir}/." "${appdir}/"
  patch -d "${appdir}" -p0 < "${srcdir}/consolidado-header-linux-font-metrics.patch"

  rm -rf "${appdir}/bin/jre" "${appdir}/navegador"
  rm -f \
    "${appdir}/iniciarPjeCalc.bat" \
    "${appdir}/iniciarPjeCalcDebug.bat" \
    "${appdir}/iniciarPjeCalc.sh" \
    "${appdir}/iniciarPjeCalcDebug.sh" \
    "${appdir}/iniciarPjeCalcDebugWine.sh"

  jredir="$(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d -name 'jdk8u*-jre' | head -n 1)"
  if [[ -z "${jredir}" ]]; then
    printf 'Extracted Temurin JRE directory was not found.\n' >&2
    return 1
  fi

  cp -r --no-preserve=ownership "${jredir}" "${appdir}/bin/jre-linux"

  install -Dm755 "${srcdir}/pjecalc-cidadao.sh" "${pkgdir}/usr/bin/pjecalc-cidadao"
  install -Dm644 "${srcdir}/pjecalc-cidadao.desktop" "${pkgdir}/usr/share/applications/pjecalc-cidadao.desktop"
  install -Dm644 "${appdir}/icone_calc.ico" "${pkgdir}/usr/share/pixmaps/pjecalc-cidadao.ico"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  cp --no-preserve=ownership "${appdir}/tomcat/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.tomcat"
  cp --no-preserve=ownership "${appdir}/tomcat/NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.tomcat"
  cp --no-preserve=ownership "${appdir}/bin/jre-linux/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.temurin"
  cp --no-preserve=ownership "${appdir}/bin/jre-linux/THIRD_PARTY_README" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_README.temurin"
}
