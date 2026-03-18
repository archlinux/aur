# Maintainer: Kat Crichton-Seager <kat@crichton-seager.com>
pkgname=hopsan
pkgver=2.23.1
pkgrel=1
pkgdesc='Multi-domain system simulation platform for fluid power and mechatronic systems'
arch=('x86_64')
url='https://github.com/Hopsan/hopsan'
license=('Apache-2.0' 'GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'hicolor-icon-theme'
  'qt5-base'
  'qt5-svg'
)
makedepends=(
  'cmake'
  'git'
  'patchelf'
  'python'
  'qt5-tools'
)
optdepends=(
  'python: scripting support and component generation'
  'qt5-webengine: embedded HTML help browser (dropped from Arch repos; build from AUR if desired)'
)
# The git source is used (rather than a tarball) because several HopsanCore
# dependencies (sundials, libnumhop, indexingcsvparser, DCPLib) are git
# submodules whose content is absent from GitHub archive tarballs.
# Bundled deps (qwt, zeromq, msgpack-c, discount, etc.) are downloaded and
# built during prepare() via the upstream setup scripts — network access is
# required at build time.
source=(
  "git+https://github.com/Hopsan/hopsan.git#tag=v${pkgver}"
)
b2sums=('SKIP')

prepare() {
  cd hopsan

  # qt5-webengine was dropped from Arch repos and the installed version is
  # linked against an older ICU. Strip WebEngine from the build entirely;
  # WebviewWrapper.cpp falls back to a QLabel with a link when neither
  # USEWEBENGINE nor USEWEBKIT is defined.
  sed -i '/QT += webenginewidgets/d; /DEFINES \*= USEWEBENGINE/d' \
    HopsanGUI/HopsanGUI.pro

  # Populate the submodules needed by HopsanCore and hopsandcp
  git submodule update --init \
    HopsanCore/dependencies/indexingcsvparser \
    HopsanCore/dependencies/libnumhop \
    HopsanCore/dependencies/sundials \
    dependencies/tools

  # GCC 15 no longer implicitly provides stdint types in system headers
  sed -i '/#include <memory>/a #include <cstdint>' hopsandcp/include/dcpserver.h
  # dcplib defines ipToString() in a header included by multiple TUs — add inline
  # to avoid a multiple-definition link error when LTO is active
  sed -i 's/^std::string ipToString(/inline std::string ipToString(/' \
    dependencies/dcplib-code/include/core/dcp/model/pdu/IpToStr.hpp

  cd dependencies

  # Download and unpack all bundled dependency sources
  python3 download-dependencies.py --all

  # Build and install each bundled dependency into its own directory so the
  # qmake .pri files can find headers and libs. setupAll.sh is not used
  # because it references a non-existent setupFMILibrary.sh.

  # Some bundled deps declare cmake_minimum_required < 3.5, which CMake 4.x
  # rejects. Patch each setup script to pass the policy minimum flag, and
  # remove any stale build dirs so cmake always starts from a clean state.
  # cmake 4.x no longer accepts cmake_minimum_required < 3.5
  sed -i 's/cmake -Wno-dev/cmake -Wno-dev -DCMAKE_POLICY_VERSION_MINIMUM=3.5/g' setup*.sh
  # zeromq passes cmake flags via a variable — patch the variable definition
  # also disable tests which fail with GCC 15
  sed -i 's/zmq_cmake_args="-Wno-dev/zmq_cmake_args="-Wno-dev -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DBUILD_TESTS=OFF/' setupZeroMQ.sh
  # msgpack-c 3.1.1 tests conflict with system gtest requiring C++17
  sed -i 's/\${codedir}/-DMSGPACK_BUILD_TESTS=OFF \${codedir}/' setupMsgpack.sh
  # xerces-c 3.2.2 is incompatible with ICU 78 — use gnuiconv transcoder
  sed -i 's/cmake -Wno-dev\(.*\) \${codedir}/cmake -Wno-dev\1 -Dtranscoder=gnuiconv \${codedir}/' setupXerces.sh
  # discount 2.2.x: GCC 15 made -Wincompatible-pointer-types a hard error
  sed -i 's|\./configure\.sh|CFLAGS="-Wno-incompatible-pointer-types" ./configure.sh|' setupDiscount.sh
  for dep in asio discount fmi4c katex libzip msgpack-c qwt tclap xerces zeromq dcplib; do
    rm -rf "${dep}-build"
  done

  source setHopsanBuildPaths.sh
  for script in \
      setupAsio \
      setupDiscount \
      setupFmi4c \
      setupKatex \
      setupLibzip \
      setupMsgpack \
      setupQwt \
      setupTclap \
      setupXerces \
      setupZeroMQ; do
    bash "${script}.sh"
  done
}

build() {
  cd hopsan
  source ./dependencies/setHopsanBuildPaths.sh

  mkdir -p builddir
  cd builddir
  # DESTDIR in the .pro files is $PWD/../bin, so executables land in hopsan/bin/
  qmake ../HopsanNG.pro -r -spec linux-g++ CONFIG+=release
  make -j"$(nproc)"
}

package() {
  local _srcdir="${srcdir}/hopsan"
  local _installdir="${pkgdir}/opt/${pkgname}"

  install -d "${_installdir}"

  # The install script copies compiled binaries, libraries, component libraries,
  # documentation, models, and bundled deps into the destination directory.
  # It also uses patchelf to strip build-tree runpaths from ELF binaries.
  cd "${_srcdir}"
  bash packaging/copyInstallHopsan.sh "${_srcdir}" "${_installdir}"

  # Symlinks so hopsangui and hopsancli are on PATH
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/bin/hopsangui" "${pkgdir}/usr/bin/hopsangui"
  ln -s "/opt/${pkgname}/bin/hopsancli" "${pkgdir}/usr/bin/hopsancli"

  # Desktop entry
  install -Dm644 packaging/HopsanGUI.desktop \
    "${pkgdir}/usr/share/applications/hopsan.desktop"

  # Icon — the build places a 128×128 PNG in bin/; expose it to the icon theme
  local _icon="${_installdir}/bin/hopsan128x128.png"
  if [[ -f "${_icon}" ]]; then
    install -Dm644 "${_icon}" \
      "${pkgdir}/usr/share/icons/hicolor/128x128/apps/hopsan128x128.png"
  fi

  # Licenses
  install -Dm644 LICENSE-ALv2  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-ALv2"
  install -Dm644 LICENSE-GPLv3 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-GPLv3"
}
