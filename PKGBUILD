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
  'patchelf'
  'python'
  'qt5-tools'
)
optdepends=(
  'python: scripting support and component generation'
)
# Note: Hopsan's build system downloads several bundled dependencies (qwt, zeromq,
# discount, libzip, xerces-c, etc.) during the prepare() step. Network access is
# required at build time. Run 'updpkgsums' after cloning to populate the checksum.
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Hopsan/hopsan/archive/refs/tags/v${pkgver}.tar.gz"
)
b2sums=('7415da4027457912bd4174672f361d18a59e2030bf9100ad5684d7133731e556c781baa82aa80e21a8ebaae4da3a0d68e309290721fa715d280c7cbe4ba591b4')

prepare() {
  cd "${srcdir}/hopsan-${pkgver}/dependencies"
  python3 download-dependencies.py --all
}

build() {
  cd "hopsan-${pkgver}"

  # setHopsanBuildPaths.sh sets PATH/env vars so bundled dep headers/libs are found
  source ./dependencies/setHopsanBuildPaths.sh

  mkdir -p builddir
  cd builddir
  # DESTDIR in the .pro files is $PWD/../bin, so executables land in hopsan-$pkgver/bin/
  qmake ../HopsanNG.pro -r -spec linux-g++ CONFIG+=release
  make -j"$(nproc)"
}

package() {
  local _srcdir="${srcdir}/hopsan-${pkgver}"
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
