# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="kdebase"
_commit_rel="205579181b27b204856dbfd27cc0248abcf83cc8" # 1.1.2
_commit="4987e047002f9b8364c16fa0e6650717c24bcc7e" # r138
pkgver="1.1.2+r138+g${_commit::7}"
_api="${pkgver%%.*}"
pkgname="${_basename}${_api}"
pkgrel=1
pkgdesc="KDE Base Applications"
arch=('i686' 'x86_64')
url="https://kde.org"
_url="https://invent.kde.org/historical/kde${_api}-${_basename}"
license=('GPL-2.0-only')
depends=('gcc-libs' 'glibc' 'glu' "kdelibs${_api}" 'libgl' 'libpulse' 'libx11'
         'libxau' 'libxcrypt' 'libxdmcp' 'libxext' 'libxpm' 'libxss' 'ncurses'
         'openssl' 'pam' 'perl' "qt${_api}" 'sh' 'systemd-libs' 'xorg-xhost')
makedepends=('cmake>=3')
groups=("kde${_api}")
_pkgsrc="${_url##*/}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/-/archive/${_commit}/${_pkgsrc}.tar.gz"
        "${pkgname}_time.patch"
        "${pkgname}_po.patch")
b2sums=('fefd351d9eea3ab7e4a654d7ed25ea10cf3bc11e89801e6581255de9eae4094bbea5c599eff8804424ef339a582f69247f4b8b07ba5c0a668d2549db031f621d'
        'b4303f4c11110414d7baf1a8c230b9a186e1e4e566bcd43a284d183d7e2f75715971a93c2a575e57762337f612f4f3c3f6bf4d011af60df1b2c32ad74ded5ce6'
        '925be172b6d366baefa16a5bc3036edb17d42ef5977c3fd6731223c9d9763efa76f6bccd6c6ff79b4f8db70befe4be3e9a6151ddc40c5fd44fdb9e81cadd9b97')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_time.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_po.patch"

  sed -e '/set(CMAKE_C_FLAGS/d' \
      -e '/set(CMAKE_CXX_FLAGS/d' \
      -i 'CMakeLists.txt'
}

build() {
  export CFLAGS+=" -std=gnu89 -Wno-format-security"
  export CXXFLAGS+=" -fpermissive -std=c++98 -Wno-format-security -Wno-write-strings"
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README"  "${pkgdir}/usr/share/doc/${pkgbase}/README"
  install -vDm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgbase}/COPYING"

  # ugly 'fix' until I actually version the paths and files
  mv "${pkgdir}/usr/bin/"{kstart,kstart1}
}

# vim:set ts=2 sw=2 et:
