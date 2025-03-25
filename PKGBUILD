# Maintainer: Chris Lane <aur at chrislane dot com>
# Contributor: Stephanie Wilde-Hobbs <hi@stephanie.is>

pkgname=megacmd
pkgver=2.0.0
pkgrel=1
pkgdesc="MEGA Command Line Interactive and Scriptable Application"
url="https://github.com/meganz/MEGAcmd"
arch=('x86_64')
license=('LicenseRef-megacmd')
depends=(
  'c-ares'
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
)
makedepends=('cmake' 'git')
_sdkhash=ddaaf5e587055897f3054a52d4a6dc74d52bb732
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/meganz/MEGAcmd/archive/${pkgver}_Linux.tar.gz"
        "mega-sdk-${_sdkhash}.tar.gz::https://github.com/meganz/sdk/archive/${_sdkhash}.tar.gz")
sha512sums=('a0ff37c33de492f0751d27f46bd83f506314f43985a247e1fe0de7683f3a8bfc059d05441816147acbda95b349b4d39e56cdac5f3893b697cda4f77efb197ce4'
            '92a0b5a30b3839f657531dad6298d88c5e08204be28a23086ab3dd5a3f3b3ff83cd42a72df38a803afcddce855a1d2ecaeee82e7d5becae9510f25fc88e9c536')

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
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=RelWithDebInfo # None does not work: https://github.com/meganz/sdk/issues/2679
    -D USE_FREEIMAGE=no
    -D USE_PDFIUM=no
    -D FULL_REQS=off
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
