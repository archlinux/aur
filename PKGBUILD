# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Zile995 (https://aur.archlinux.org/account/Zile995)

_gitname=zswap-cli
pkgname="${_gitname}-nosystemd-git"
pkgver=1.1.1.r537.20251025.767ee0d
pkgrel=1
pkgdesc="Command-line tool to control ZSwap Linux kernel module. Build without systemd dependency/ support. Latest git checkout."
arch=('x86_64')
url="https://github.com/xvitaly/zswap-cli"
license=('MIT')
depends=(
  'boost-libs'
  'fmt'
  'gcc-libs'
  'glibc'
  'sdbus-cpp'
)
makedepends=(
  'boost'
  'cmake'
  'doxygen'
  'gcc'
  'git'
  'ninja'
  'pandoc'
)
optdepends=(
  'semver: Semantic versioning for C++'
)
provides=(
  "zswap-cli-nosystemd=${pkgver}"
  "zswap-cli-git=${pkgver}"
  "zswap-cli=${pkgver}"
)
conflicts=(
  "zswap-cli"
)
backup=('etc/zswap-cli/zswap-cli.conf')
source=("${_gitname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_gitname}"
  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_gitname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|-g[0-9a-f]*$||' -e 's|-|+|g')"
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
  sed -i \
    's/CMAKE_INSTALL_SBINDIR/CMAKE_INSTALL_BINDIR/g' "${srcdir}/${_gitname}/CMakeLists.txt"

  cmake \
    -G Ninja \
    -B "${_gitname}/build" \
    -S "${_gitname}" \
    -DBUILD_MANPAGE=ON \
    -DBUILD_DOC=ON \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DFETCHCONTENT_QUIET=OFF \
    -DFETCHCONTENT_FULLY_DISCONNECTED=OFF \
    -DFETCHCONTENT_UPDATES_DISCONNECTED=ON \
    -DFETCHCONTENT_UPDATES_DISCONNECTED_SEMVER=ON \
    -DLINK_ALL_STATICALLY=OFF \
    -DLINK_BOOST_STATICALLY=OFF \
    -DLINK_ENABLE_OPTIMIZATIONS=ON \
    -DSEMVER_OPT_BUILD_EXAMPLES=OFF \
    -DSEMVER_OPT_BUILD_TESTS=OFF \
    -DSEMVER_OPT_INSTALL=ON \
    -DSYSTEMD_INTEGRATION=OFF \
    -Wno-dev

  cmake --build "${_gitname}/build"
}

package() {
  DESTDIR="${pkgdir}/" cmake --install "${_gitname}/build"

  # README and co
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_gitname}" "${srcdir}/${_gitname}"/{README.md,git.log}

  # license
  install -Dvm644 "${srcdir}/${_gitname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
