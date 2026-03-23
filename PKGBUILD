# Maintainer: Chris Lane <aur at chrislane dot com>
# Contributor: Stephanie Wilde-Hobbs <hi@stephanie.is>

pkgname=megacmd
pkgver=2.5.0
pkgrel=3
pkgdesc="MEGA Command Line Interactive and Scriptable Application"
url="https://github.com/meganz/MEGAcmd"
arch=('x86_64')
license=('LicenseRef-megacmd')
depends=(
  'crypto++'
  'curl'
  'icu'
  'libsodium'
  'libuv'
  'openssl'
  'pcre'
  'readline'
  'sqlite'
  'zlib'
  'fuse2'
)
makedepends=('cmake' 'git')
_sdkhash=5ed7296be8a7cd5920095b928d6696aed41289c6
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/meganz/MEGAcmd/archive/${pkgver}_Linux.tar.gz"
        "mega-sdk-${_sdkhash}.tar.gz::https://github.com/meganz/sdk/archive/${_sdkhash}.tar.gz"
        "fix-icu-linking.patch::https://github.com/meganz/sdk/pull/2768.patch")
sha512sums=('e0474aefa00b9d03a5327089d08334f580287731959b9279c581a34c907db5cc36ce2e889921c4fc2b2f4b60cf4e3409e1eedabe52dd3b40fb3cb2a872cc5ccb'
            '61df5b803c3f5e705eb07667934b35368c0eb66ba0dd08d62f459eac04cf9336e132b5bf58d9a86ab97ef2d44e46a12d86b921d94b9d6a4dd7f7b8887254de34'
            '2d720030596a9721a2e6ad9d426d3de9a1f2a625438e2b7df0e7363ffb0178097c87d9ee7b4e36ef0277ced78b754564517fd73ca4502a8723fa8132a1b37810')

prepare() {
  # Remove existing directory if it exists
  rm -rf "${pkgname}-${pkgver}"

  mv "MEGAcmd-${pkgver}_Linux" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"

  rm -r sdk
  ln -sf "${srcdir}/sdk-${_sdkhash}" sdk

  sed -i '/^set(VCPKG_ROOT/d' CMakeLists.txt

  echo true > build/clone_vcpkg_from_baseline.sh # this script is executed by bash (not using shebang)
  sed -i '/IMPORTED_TARGET libcrypto++/s/++/pp/' sdk/cmake/modules/sdklib_libraries.cmake

  # Fix ICU linking - https://github.com/meganz/sdk/pull/2768
  patch -Np1 -d "${srcdir}/sdk-${_sdkhash}" -i "${srcdir}/fix-icu-linking.patch"

  # Remove hardcoded install paths that break build-time options
  sed -i \
    '/set(CMAKE_INSTALL_LIBDIR "opt\/megacmd\/lib")/d; /set(CMAKE_INSTALL_BINDIR "usr\/bin")/d' \
    CMakeLists.txt

  # Fix PCRE and ZLib linking
  sed -i '/target_link_libraries(LMegacmdServer PUBLIC MEGA::SDKlib LMEGAcmdCommonUtils)/a target_link_libraries(LMegacmdServer PUBLIC pcrecpp z)' CMakeLists.txt
}

build() {
  local cmake_options=(
    -B build
    -S "${pkgname}-${pkgver}"
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=RelWithDebInfo # None does not work: https://github.com/meganz/sdk/issues/2679
    -DUSE_FREEIMAGE=no
    -DUSE_PDFIUM=no
    -DFULL_REQS=off
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  cd "${pkgname}-${pkgver}"

  # Remove unnecessary /usr/lib dir containing symlinks
  rm -rf ${pkgdir}/usr/lib

  # Fix completions location (/usr/etc/bash_completions.d/ -> /usr/share/bash-completion/completions)
  rm -rf ${pkgdir}/usr/etc/
  install -Dm644 src/client/megacmd_completion.sh ${pkgdir}/usr/share/bash-completion/completions/${pkgname}

  # Add completions for sub-commands
  for completion_cmd in ${pkgdir}/usr/bin/mega*;
  do
    completion_cmd=$(basename "$completion_cmd")
    ln -s "${pkgname}" "${pkgdir}/usr/share/bash-completion/completions/$completion_cmd"
  done

  # Documentation
  install -Dm644 README.md UserGuide.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 contrib/docs/*.md -t "${pkgdir}/usr/share/doc/${pkgname}/docs/"
  install -Dm644 contrib/docs/commands/*.md -t "${pkgdir}/usr/share/doc/${pkgname}/docs/commands/"

  # License
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
