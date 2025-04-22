# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="appimagetool"
pkgname="${_pkgname}-git"
pkgver=r65.cb01153
pkgrel=1
epoch=1
pkgdesc="Low-level tool to generate an AppImage from an existing AppDir"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/AppImage/${_pkgname}"
license=('MIT')
depends=('curl' 'gcc-libs' 'glib2' 'glibc' 'gpgme' 'hicolor-icon-theme'
         'libgcrypt' 'squashfs-tools')
makedepends=('cmake>=3.21' 'git')
optdepends=('zsync: for binary delta updates')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  git cherry-pick -n --empty=drop d120a8c5f5bb5260aab15b2bc5c9707b49b7af2a
}

build() {
  # export CFLAGS+=" -Wno-error=int-conversion"
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
