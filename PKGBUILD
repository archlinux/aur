# Maintainer: Chris Lane <aur at chrislane dot com>
# Contributor: Stephanie Wilde-Hobbs <hi@stephanie.is>

pkgname=megacmd
pkgver=2.1.1
pkgrel=1
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
_sdkhash=61013ee2331faf901d9ce88fc0fdf4def9ce4fbd
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/meganz/MEGAcmd/archive/${pkgver}_Linux.tar.gz"
        "mega-sdk-${_sdkhash}.tar.gz::https://github.com/meganz/sdk/archive/${_sdkhash}.tar.gz")
sha512sums=('5b510cca8a1cc8480aa759856ca6f4af5a81967f34b05a03af66334a0004ebe295f7825b3d560d86371f71a57ab60952b3dc8b020480a47b35fee2ec781962bc'
            '4b8b70d75e78898e651b794e155cc207ad79d5498001e66ba2dbfffc31b3794970cd4333f27a069771a4b5fb7eb3e6a4fbed0f8524fd9694a7795a55f9a8271d')

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

  # License
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
