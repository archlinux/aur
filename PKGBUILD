# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pyname=chameleon_ultra_cli
_pkgname=chameleonultracli
pkgname="${_pkgname}-git"
pkgver=2.0.0.r377.20260617.1f99ddd4
pkgrel=1
pkgdesc="Command line interface for the Chameleon Ultra RFID cloning and emulation device."
arch=(
  'i686'
  'x86_64'
)
url="https://github.com/RfidResearchGroup/ChameleonUltra"
license=('GPL-3.0-or-later')
provides=(
  "${_pkgname}=${pkgver}"
  "python-${_pyname}=${pkgver}"
  "python-${_pyname}-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "python-${_pyname}"
)
depends=(
  'glibc'
  'liblzma.so'                # xz
  'libcrypto.so'              # openssl
  'python>=3.9'
  'python-colorama>=0.4.6'
  'python-cryptography'
  'python-prompt_toolkit>=3.0.39'
  'python-pyserial>=3.5'
)
makedepends=(
  'git'
  'cmake'
  'python'
  'openssl'
  'xz'
)
optdepends=(
  'python-matplotlib: For graphing backend.'
  "python-pyqt5:      For alternative graphing backend; use together with 'python-pyqtgraph'."
  "python-pyqtgraph:  For alternative graphing backend; use together with 'python-pyqt5'."
  'python-tqdm'
)
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}/software"
  git log . > git.log

  local _CFLAGSADDITIONS="-Wno-unused-result -Wno-unused-variable -Wno-unused-const-variable"
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  ## This downloads some stuff -- so do it in 'prepare()'.
  cmake -S src -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -Wno-dev
}

pkgver() {
  cd "${srcdir}/${_pkgname}/software"

  _ver="$(grep -E '^version[[:space:]]*=' pyproject.toml | awk -F= '{print $2}' | tr -d [[:space:]]\"\')"
  _lastcommit="$(git rev-list HEAD -- . | head -n1)"
  _rev="$(git rev-list --count HEAD -- .)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad" .)"
  _hash="$(git rev-parse --short "${_lastcommit}")"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}/software"

  #make -C build
  cmake --build build
}

package() {
  cd "${srcdir}/${_pkgname}/software"

  local _sitepackagedir="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -dvm755 "${pkgdir}/${_sitepackagedir}/${_pyname}"
  install -Dvm644 -t "${pkgdir}/${_sitepackagedir}/${_pyname}" script/*.py
  chmod 755 "${pkgdir}/${_sitepackagedir}/${_pyname}"/chameleon_cli_main.py

  # Actually, the output of cmake build is in 'script/bin'.
  cp -rv script/bin "${pkgdir}/${_sitepackagedir}/${_pyname}"/

  install -dvm755 "${pkgdir}/usr/bin"
  ln -sv "${_sitepackagedir}/${_pyname}"/chameleon_cli_main.py "${pkgdir}/usr/bin/chameleonultracli"

  install -D -m644 -v -t "${pkgdir}/usr/share/doc/${_pkgname}"     README.md git.log
  install -D -m644 -v -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/${_pkgname}/LICENSE"
}

