# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="kgoldrunner"
_commit_rel="e55b8fd594bbdf4359501147dced3566ce899d8c" # 1.0
_commit="1f4800f3159e72275d4654dbebbc12f096d5eab8" # r8
pkgver="1.0+r8+g${_commit::7}"
_api="${pkgver%%.*}"
pkgname="${_basename}${_api}"
pkgrel=1
pkgdesc="A game of action and puzzle solving"
arch=('i686' 'x86_64')
url="https://apps.kde.org/${_basename}/"
_url="https://invent.kde.org/sandsmark/kde${_api}-${_basename}"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' "kdelibs${_api}" "qt${_api}")
makedepends=('cmake>=3')
groups=("kde${_api}")
_pkgsrc="${_url##*/}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/-/archive/${_commit}/${_pkgsrc}.tar.gz"
        "${pkgname}_versioned.patch")
b2sums=('b78b91c840065a2c58ae93a85dd315b37ee121db73b2835ba4730e0b8d29adaf393fdd3bd93c928271d7b32afdc954d9db4c5318ba08281a6cf5bceaccc00186'
        '449e55461345b2cce8ab5cb0ae545839124301027e4ccade9854b33eea3e1d35eb67c99f4464e472d9bee689622a6a881f25cf1cb7cf9530e4385af25661a1ab')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_versioned.patch"
}

build() {
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
}

# vim:set ts=2 sw=2 et:
