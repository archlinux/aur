# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="appimagetool"
pkgname="${_pkgname}-git"
pkgver=r61.c247c92
pkgrel=3
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
source=("${_pkgsrc}::git+${url}.git"
        "${_pkgname}_printf.patch::${url}/pull/87.patch?full_index=1")
sha256sums=('SKIP'
            'e374e3640dce92428f02940f98064ad87add29b45046a92a2a5e40270fe6a17e')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_pkgname}_printf.patch" || true
}

build() {
  # export CFLAGS+=" -Wno-error=int-conversion"
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -Wno-dev
    -DCMAKE_BUILD_TYPE:STRING='None'
    -DCMAKE_INSTALL_PREFIX:PATH='/usr'
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
