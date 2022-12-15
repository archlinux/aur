# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=openfoam
pkgname=${_base}-com-precice
_gitcommit=cdd8f9cc1adeddb4b3f4eedf4eb8e14a8be742ce
pkgver=1.2.1
pkgrel=1
pkgdesc="preCICE adapter for OpenFOAM"
arch=(x86_64)
url="https://github.com/precice/${_base}-adapter"
license=(GPL3)
_openfoam_version=v2206
depends=("${_base}-com=${_openfoam_version}" "precice")
makedepends=(git)
source=("git+${url}.git?signed#commit=${_gitcommit}")
validpgpkeys=('2A955D4FE358070072B117D56723BA104179BCE9') # Gerasimos Chourdakis <chourdak@in.tum.de>
sha512sums=('SKIP')

prepare() {
  if [ -n "${WM_PROJECT_DIR}" ]; then
    echo
    echo -e "\e[1m\e[5m\e[31mPlease make sure that no OpenFOAM version is sourced in bashrc.\e[0m"
    echo
    return 1
  fi
  # Uncomment next line ff want see enable debug messages, see https://precice.org/adapter-openfoam-get.html
  # sed -i 's/ADAPTER_PREP_FLAGS=""/ADAPTER_PREP_FLAGS="-DADAPTER_DEBUG_MODE"/' ${_base}-adapter/Allwmake
  sed -i 's/ADAPTER_TARGET_DIR="${FOAM_USER_LIBBIN:-}"/ADAPTER_TARGET_DIR="${pkgdir}${FOAM_LIBBIN}"/' ${_base}-adapter/Allwmake
}

package() {
  source /opt/OpenFOAM/OpenFOAM-${_openfoam_version}/etc/bashrc || true
  cd ${_base}-adapter
  install -d "${pkgdir}${FOAM_APP}"
  ./Allclean
  . ./Allwmake || true
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
