# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmailcom>
# Contributor: Michael Hansen <zrax0111 gmail com>
# Contributor: Nicolas Quiénot < niQo at aur >

pkgname="libkqueue"
pkgver=2.6.4
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
  'libgcc'
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
  "${_pkgsrc}::git+${url}.git#tag=v${pkgver}" # ?signed"
)
sha256sums=('6faf1b3bf4f15d8b93ece72e49114e3db047ac5a6c6301ec2ed23376f3cda46d')
validpgpkeys=(
  'FD31307742EC7FCD32FE5EE256CF27F930A8CAA2' # Arran Cudbard-Bell <a.cudbardb@freeradius.org>
)

build() {
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
  )
 
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"
  
  cd "${_pkgsrc}"
  install -vDm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
