# Maintainer:‌ dreieck

_pkgname=dptf
pkgname="${_pkgname}-git"
pkgver=9.0.11363.buld34997.r95.20230605.d2c8f547
pkgrel=1
pkgdesc='Intel (R) Dynamic Platform and Thermal Framework (Intel (R) DPTF)'
arch=('x86_64')
url='https://github.com/intel/dptf'
license=('Apache')
depends=('readline')
makedepends=('cmake' 'git')
backup=(
  'etc/dptf/dsp.dv'
)
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # As of 2023-07-13, `VER_MAJOR` from `Common/Ver.h` is 1 but the major version from git tags is 9.
  _ver_gittag="$(git describe --tags | sed -E -e 's|^vV||' -e 's|-g[0-9a-f]*$||' | tr '-' '+')"
  _ver_major="$(grep -E '^[[:space:]]*#define[[:space:]]+VER_MAJOR[[:space:]]+[0-9]*' Common/Ver.h | awk '{print $3}')"
  _ver_minor="$(grep -E '^[[:space:]]*#define[[:space:]]+VER_MINOR[[:space:]]+[0-9]*' Common/Ver.h | awk '{print $3}')"
  _ver_hotfix="$(grep -E '^[[:space:]]*#define[[:space:]]+VER_HOTFIX[[:space:]]+[0-9]*' Common/Ver.h | awk '{print $3}')"
  _ver_build="$(grep -E '^[[:space:]]*#define[[:space:]]+VER_BUILD[[:space:]]+[0-9]*' Common/Ver.h | awk '{print $3}')"
  _ver="${_ver_gittag}.${_ver_minor}.${_ver_hotfix}.build${_ver_build}"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
    cd "${srcdir}/${_pkgname}"

    export CXXFLAGS="${CXXFLAGS} -Wno-error=catch-value -Wno-error=stringop-truncation -Wno-error=overloaded-virtual -ffile-prefix-map='${srcdir}/${_pkgname}'="
    export CFLAGS="${CFLAGS} -Wno-error=format-truncation -Wno-error=format-overflow -Wno-error=overloaded-virtual -ffile-prefix-map='${srcdir}/${_pkgname}'="

    pushd DPTF/Linux/build
      cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ..
      make
    popd

    pushd ESIF/Products/ESIF_UF/Linux
      make
    popd

    pushd ESIF/Products/ESIF_CMP/Linux
      make
    popd

    pushd ESIF/Products/ESIF_WS/Linux
      make
    popd

    pushd IPF/Linux
      make
    popd
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dvm755  DPTF/Linux/build/x64/release/*.so         -t "${pkgdir}/usr/share/dptf/ufx64/"
    install -Dvm755  ESIF/Products/ESIF_UF/Linux/ipf_ufd          "${pkgdir}/usr/bin/ipf_ufd"
    install -Dvm755  ESIF/Products/ESIF_CMP/Linux/*.so         -t "${pkgdir}/usr/share/dptf/ufx64/"
    install -Dvm755  ESIF/Products/ESIF_WS/Linux/*.so          -t "${pkgdir}/usr/share/dptf/ufx64/"
    install -Dvm755  IPF/Linux/*.so                            -t "${pkgdir}/usr/share/dptf/ufx64/"
    install -Dvm755  IPF/Linux/ipfhostd                           "${pkgdir}/usr/bin/ipfhostd"
    install -Dvm644  ESIF/Packages/DSP/dsp.dv                     "${pkgdir}/etc/dptf/dsp.dv"
    install -Dvm644  ESIF/Packages/Installers/linux/dtt.service   "${pkgdir}/usr/lib/systemd/system/dtt.service"
    install -Dvm644  ESIF/Packages/Installers/linux/ipf.service   "${pkgdir}/usr/lib/systemd/system/ipf.service"

    install -Dvm644  README.txt   "${pkgdir}/usr/share/doc/${_pkgname}/README.txt"
    install -Dvm644  security.md  "${pkgdir}/usr/share/doc/${_pkgname}/security.md"
    install -Dvm644  LICENSE.txt  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE.txt"
}
