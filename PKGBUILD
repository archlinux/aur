# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname="admesh"
_commit_rel="70ca24a9b4e6d8aa05e8572e768110dad9b4d47b" # 0.98.5
_commit="d77590614cc4da46a142207b5d9fc5cfdc937032" # r27
pkgver="0.98.5+r27+g${_commit::7}"
pkgrel=2
pkgdesc="CLI and C library for processing triangulated solid meshes"
arch=('i686' 'x86_64')
url="https://admesh.readthedocs.io"
_url="https://github.com/${pkgname}/${pkgname}"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('cmake>=3.2')
provides=("lib${pkgname}.so")
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz")
b2sums=('e3d165dd1b7497c7152916b69aa1f34be82da06c95e0f2bbd21144df488645299d70b46d6e7aa224865881b5ddee479e16d5c78c3dda3f0a6a43c204911f30a1')

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -Wno-dev
    -DCMAKE_BUILD_TYPE:STRING='None'
    -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DCMAKE_SKIP_RPATH:BOOL=ON
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

# check() {
#   local excluded_tests=""
#   local ctest_flags=(
#     --test-dir "${_pkgsrc}/build"
#     --output-on-failure
#     --parallel $(nproc)
#     --exclude-regex "${excluded_tests}"
#   )
# 
#   cd "${srcdir}"
#   ctest "${ctest_flags[@]}"
# }

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "${pkgname}-doc.txt" "${pkgdir}/usr/share/doc/${pkgname}/${pkgname}-doc.txt"
  install -vDm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -vDm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
