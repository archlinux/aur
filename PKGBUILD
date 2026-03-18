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
  'qt5-webengine'
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

  # Populate the submodules needed by HopsanCore and hopsandcp
  git submodule update --init \
    HopsanCore/dependencies/indexingcsvparser \
    HopsanCore/dependencies/libnumhop \
    HopsanCore/dependencies/sundials \
    hopsandcp/dependencies/DCPLib

  cd dependencies

  # Download and unpack all bundled dependency sources
  python3 download-dependencies.py --all

  # Build and install each bundled dependency into its own directory so the
  # qmake .pri files can find headers and libs. setupAll.sh is not used
  # because it references a non-existent setupFMILibrary.sh.
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
      setupZeroMQ \
      setupDCPLib; do
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
