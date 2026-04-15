# Maintainer: Chris Lane <aur at chrislane dot com>
# Contributor: Stephanie Wilde-Hobbs <hi@stephanie.is>

pkgname=megacmd
pkgver=2.5.2
pkgrel=2
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
_sdkhash=fae76a36d60484657fbdf442b7b917ccc4fbad77
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/meganz/MEGAcmd/archive/${pkgver}_Linux.tar.gz"
        "mega-sdk-${_sdkhash}.tar.gz::https://github.com/meganz/sdk/archive/${_sdkhash}.tar.gz"
        "fix-icu-linking.patch::https://github.com/meganz/sdk/pull/2768.patch")
sha512sums=('14bae79eb8b6562bceab7be625cca71fc01f44dc4cdb72b443289e085fd87381c97f8867d9c44866c37354d83449df014b632bc30e7f00e895253f71fb7bd8d1'
            '88d51c533d7db16800d4620714d19b4aa2a3e81f3354ceb083037728890558011e3bd4ac220433586f47a6bfb8f8dabca7fce004da9916f6d9e3d47946df7f6b'
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
  install -Dm644 README.md UserGuide.md build/megacmd/megacmd.changes -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 contrib/docs/*.md -t "${pkgdir}/usr/share/doc/${pkgname}/docs/"

  # License
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
