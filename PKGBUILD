# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=kazv
pkgname="${_pkgname}-git"
pkgver=0.0.1.r352.20230825.a785bf1
pkgrel=1
pkgdesc="A Qt5 matrix client."
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'x86_64'
)
license=('AGPL3')
url="https://lily-is.land/kazv/kazv"
backup=()
depends=(
  'boost-libs>=1.81.0'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glibc'
  'kconfig>=5.109.0'
  'kio>=5.78'
  'kirigami2>=5.78'
  'libkazv'
  'nlohmann-json'
  'qt5-base>=5.15.10'
  'qt5-declarative'
  'qt5-multimedia'
  'qt5-svg'
  'qt5-quickcontrols2'
)
makedepends=(
  'boost>=1.81.0'
  'cmake'
  'extra-cmake-modules>=5.78'
  'git'
  'pkgconf'
)
optdepends=()
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver_major="$(grep -Em1 '^[^#]*set\(kazv_VERSION_MAJOR' CMakeLists.txt | sed -E 's|.*kazv_VERSION_MAJOR[[:space:]]+([^\)]*)\).*|\1|')"
  _ver_minor="$(grep -Em1 '^[^#]*set\(kazv_VERSION_MINOR' CMakeLists.txt | sed -E 's|.*kazv_VERSION_MINOR[[:space:]]+([^\)]*)\).*|\1|')"
  _ver_patch="$(grep -Em1 '^[^#]*set\(kazv_VERSION_PATCH' CMakeLists.txt | sed -E 's|.*kazv_VERSION_PATCH[[:space:]]+([^\)]*)\).*|\1|')"
  _ver="${_ver_major}.${_ver_minor}.${_ver_patch}"
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

  mkdir -p build
  cd build

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DBUILD_COVERAGE=OFF \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=ON \
    -DBUILD_WITH_QT6=OFF \
    -DENABLE_BSYMBOLICFUNCTIONS=ON \
    -DKDE_INSTALL_PREFIX_SCRIPT=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DKDE_L10N_AUTO_TRANSLATIONS=ON \
    -DKDE_L10N_BRANCH=trunk \
    ..

  make
}

check() {
  cd "${srcdir}/${_pkgname}/build"

  ## Actually requires graphical environment to be active!
  plain "'make test' requires a graphical environment beeing active!"
  make test || true # Exit true anyway because the test will fail if no graphical environment is active.
}


package() {
  cd "${srcdir}/${_pkgname}/build"

  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/${_pkgname}"

  for _docfile in 'git.log' 'README.md' 'CHANGELOG.md'; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  for _licensefile in COPYING; do
    install -Dvm644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_licensefile}"
  done
}
