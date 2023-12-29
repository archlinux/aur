# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Sevenseven < forauronly AT gmail.com >

pkgname=libmediawiki-git
_last_non_tagged_release_ver=5.38.0
_last_non_tagged_release_commit=5c6086f040aa768ae3a9b86c2e35b46e5e85f81a
pkgver=5.38.0.r0.g5c6086f
pkgrel=1
pkgdesc='A KDE C++ interface for MediaWiki based web services like Wikipedia'
arch=('i686' 'x86_64')
url='https://invent.kde.org/libraries/libmediawiki'
license=('GPL2')
depends=(
  'gcc-libs'
  'glibc'
  'kcoreaddons5'
  'qt5-base'
)
makedepends=('git' 'extra-cmake-modules')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/libmediawiki"

  # Generate git tag based version if there is a git tag newer than the $_last_non_tagged_release_ver.
  # Count only proper (v)#.#* [#=number] tags if such exists.
  # If not, count the number of revisions (commits) since the $_last_non_tagged_release_commit.
  (
    set -o pipefail
    local _gitversion=$(git describe --long --tags --match 'v[0-9][0-9.][0-9.]*' \
      --contains "${_last_non_tagged_release_commit}" 2>/dev/null || \
      printf "%s.r%s.g%s" \
        "${_last_non_tagged_release_ver}" \
        $(git rev-list --count "${_last_non_tagged_release_commit}"..HEAD) \
        $(git rev-parse --short HEAD))

    # Format git-based version for pkgver
    echo "${_gitversion}" | \
      sed -e 's|^v||' | \
      tr '[:upper:]' '[:lower:]' | \
      sed \
        -e 's|^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
        -e 's|\([0-9]\+-g\)|r\1|' \
        -e 's|-|.|g'
  )
}

prepare() {
if [[ -d "${srcdir}/build" ]]; then
      msg "Cleaning the previous build directory..."
      rm -rf "${srcdir}/build"
  fi
  mkdir "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  cmake "${srcdir}/libmediawiki" -DCMAKE_BUILD_TYPE=Release \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DKDE_INSTALL_LIBDIR=lib \
                -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
                -DBUILD_TESTING=OFF
  make
}

package() {
  provides=("libmediawiki=${pkgver}")
  conflicts=('libmediawiki')

  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
