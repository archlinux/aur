# Maintainer:  Tianhao Wang <i AT shrik3 DOT com>
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=kazv
pkgname="${_pkgname}-git"
pkgver=0.5.0.r716.20241108.adf5bf1
pkgrel=2
pkgdesc="A Qt matrix client."
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'x86_64'
)
license=('AGPL-3.0-or-later')
url="https://lily-is.land/kazv/kazv"
backup=()
depends=(
  'boost-libs>=1.86.0'
  'cmark'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glibc'
  'kconfig>=6.7.0'
  'kio>=6'
  'kirigami>=6'
  'kirigami-addons'
  'knotifications>=6'
  'libkazv'
  'qt6-base>=6.8.0'
  'qt6-declarative>=6.5.0'
  'qt6-multimedia>=6.5.0'
  'qt6-svg>=6.5.0'
)
makedepends=(
  'boost>=1.83.0'
  'cmake'
  'extra-cmake-modules>=6'
  'libxkbcommon'
  'nlohmann-json'
  'git'
  'pkgconf'
  'zug'
)
optdepends=()
checkdepends=(
  # A running(!) and accessible(!) graphical environment is needed for 'make test'.
  # It opens a window.
  # So we run a virtual X server and direct to there.
  "xorg-server-xvfb"
)
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

  if [ -z "${_ver_major}" ]; then
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

  ## Actually requires graphical environment to be active! It will open a window!
  plain "Running 'make test' in a virtual X Server ..."
  ## Redirect to a virtual X server (which we will not see):
  xvfb-run -d make test
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
