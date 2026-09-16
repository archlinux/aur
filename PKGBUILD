# Maintainer: Chris Lane <aur at chrislane dot com>
# Contributor: Stephanie Wilde-Hobbs <hi@stephanie.is>

pkgname=megacmd
pkgver=2.6.0
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
_sdkhash=8775533fe50255723c45ab8abf4e14285a592d51
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/meganz/MEGAcmd/archive/${pkgver}_Linux.tar.gz"
        "mega-sdk-${_sdkhash}.tar.gz::https://github.com/meganz/sdk/archive/${_sdkhash}.tar.gz")
sha512sums=('282dc7d5af1da4dea64db0a6b7956bc5beb4593858848130f763af63bf070e7497c8e0837c9bfff88e6b12c76e5dd9897708e72c1988891c89a6be899140dc9e'
            '68642a9301353abd33a70792a522ba6d6f01418a0d0b139ae1e017cb7dcc69e099abfbba799d7ab69817718d3650595eddaaa74165c7903fa6bd750ec18f5f4d')

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

  # Documentation
  install -Dm644 README.md UserGuide.md build/megacmd/megacmd.changes -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 contrib/docs/*.md -t "${pkgdir}/usr/share/doc/${pkgname}/docs/"

  # License
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
