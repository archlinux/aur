# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgbase='amdgpu-test-scripts'
_vcssuffix="-git"
pkgbase="${_pkgbase}${_vcssuffix}"
pkgname=(
  "amdgpu-test-scripts-common${_vcssuffix}"
  "amd-s2idle-analysis-script${_vcssuffix}"
  "amd-psr-identification-script${_vcssuffix}"
)
epoch=0
pkgver=r173.20240122.ae205b2
pkgrel=2
pkgdesc="Test scripts for open source AMD graphics driver."
arch=(
  'any'
)
url="https://gitlab.freedesktop.org/drm/amd"
license=(
  'MIT'
)
makedepends=(
  'git'
)
checkdepends=()
source=(
  "${_pkgbase}::git+${url}.git"
)
sha256sums=(
  'SKIP'                                                              # upstream git source
)

prepare() {
  cd "${srcdir}/${_pkgbase}"

  git log > git.log
  printf '%s\n' "${url}" > website.url
  printf '%s\n' "The only license information that could be found is '# SPDX-License-Identifier: MIT' at the top of the scripts." > license-info.txt
}

pkgver() {
  cd "${srcdir}/${_pkgbase}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Could not determine commit count."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

_package_amdgpu-test-scripts-common() {
  pkgdesc="Common files (README, License) for 'amd-s2idle-analysis-script' and 'amd-psr-identification-script'."
  url="https://gitlab.freedesktop.org/drm/amd/-/blob/master/scripts/amd_s2idle.py"
  depends=()
  optdepends=(
    "amd-s2idle-analysis-script: The software this common files are for."
    "amd-psr-identification-script: The software this common files are for."
  )
  provides=()
  conflicts=()
  replaces=()
  if [ -n "${_vcssuffix}" ]; then
    provides+=("amdgpu-test-scripts-common")
    conflicts+=("amdgpu-test-scripts-common")
  fi

  for _docfile in git.log license-info.txt website.url README.md; do
    install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}" "${srcdir}/${_pkgbase}/${_docfile}"
  done

  install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -svr "${pkgdir}/usr/share/doc/${_pkgbase}/license-info.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license-info.txt"
}

_package_amd-s2idle-analysis-script() {
  pkgdesc="S0i3/s2idle analysis script ('s2idle.py') for AMD systems."
  url="https://gitlab.freedesktop.org/drm/amd/-/blob/master/scripts/amd_s2idle.py"
  depends=(
    "amdgpu-test-scripts-common${_vcssuffix}=${pkgver}"
    'acpica'
    'dbus-python'
    'python>=3'
    'python-distro'
    'python-packaging'
    'python-pyudev'
  )
  provides=()
  conflicts=()
  replaces=()
  if [ -n "${_vcssuffix}" ]; then
    provides+=("amd-s2idle-analysis-script")
    conflicts+=("amd-s2idle-analysis-script")
  fi

  install -Dvm755 "${srcdir}/${_pkgbase}/scripts/amd_s2idle.py" "${pkgdir}/usr/bin/amd_s2idle-analysis"

  install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -svr "${pkgdir}/usr/share/doc/${_pkgbase}/license-info.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license-info.txt"
}

_package_amd-psr-identification-script() {
  pkgdesc="PSR identification script ('psr.py') for AMD systems."
  url="https://gitlab.freedesktop.org/drm/amd/-/blob/master/scripts/psr.py"
  depends=(
    "amdgpu-test-scripts-common${_vcssuffix}=${pkgver}"
    'python>=3'
    'python-pyudev'
  )
  provides=()
  conflicts=()
  replaces=()
  if [ -n "${_vcssuffix}" ]; then
    provides+=("amd-psr-identification-script")
    conflicts+=("amd-psr-identification-script")
  fi

  install -Dvm755 "${srcdir}/${_pkgbase}/scripts/psr.py" "${pkgdir}/usr/bin/amd_psr-identification"

  install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -svr "${pkgdir}/usr/share/doc/${_pkgbase}/license-info.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license-info.txt"
}


for _pkg in "${pkgname[@]}"; do
  eval "package_${_pkg} () {
    _package_${_pkg%${_vcssuffix}}
  }"
done
