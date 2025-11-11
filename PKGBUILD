# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmailcom>
# Contributor: Michael Hansen <zrax0111 gmail com>
# Contributor: Nicolas Quiénot < niQo at aur >

pkgname="libkqueue"
pkgver=2.6.3
pkgrel=1
pkgdesc="Userspace implementation of the kqueue kernel(2) event notification mechanism found in BSD-based systems"
url="https://github.com/mheily/${pkgname}"
arch=(
  'i686'
  'x86_64'
)
license=(
  'ISC AND BSD-2-Clause'
)
depends=(
  'glibc'
)
makedepends=(
  'cmake>=3.8.0'
  'git'
)
provides=(
  "${pkgname}.so"
)
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git#tag=v${pkgver}?signed"
)
sha256sums=('e8859fad412f6cbc244a16636c4e9e6a49c137748bd533e56c3a05333f194e45')
validpgpkeys=(
  'FD31307742EC7FCD32FE5EE256CF27F930A8CAA2' # Arran Cudbard-Bell <a.cudbardb@freeradius.org>
)

build() {
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
  install -vDm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}