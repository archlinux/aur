# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgbase='amd-debug-tools'
_vcssuffix="-git"
pkgbase="${_pkgbase}${_vcssuffix}"
_pkgname="${_pkgbase}"
pkgname="${pkgbase}"
epoch=0
pkgver=0.1.0+3.r314.20250425.5bad9d8
pkgrel=1
pkgdesc="Debug tools for AMD zen systems."
arch=(
  'any'
)
url="https://git.kernel.org/pub/scm/linux/kernel/git/superm1/amd-debug-tools"
license=(
  'MIT'
)
depends=(
  'acpica'
  'dbus-python'
  'python>=3'
  'python-distro'
  'python-packaging'
  'python-pandas'
  'python-pyudev'
  'python-tabulate'
)
optdepends=(
  "fwupd>=2:         For device firmware checks ('amd_s2idle')."
  "python-common:    For optional model checks ('amd_s2idle')."
  "glib2:            For device firmware checks ('amd_s2idle')."
  "python-gobject:   For device firmware checks ('amd_s2idle')."
  "python-cysystemd: To access the kernel log via the systemd journal (fallback is 'dmesg') ('amd_s2idle')."
  "python-systemd:   To access the kernel log via the systemd journal (fallback is 'dmesg') ('amd_s2idle') | Needed to run 'amd_bios'."
  "util-linux:       To access the kernel log via 'dmesg' ('amd_s2idle')."
)
makedepends=(
  'git'
  'python>=3'
)
checkdepends=()
source=(
  "${_pkgbase}::git+${url}.git"
)
provides=(
  "${_pkgname}=${pkgver}"
  "amd-bios-logging-control-script=${pkgver}"
  "amd-psr-identification-script=${pkgver}"
  "amd-pstate-analysis-script=${pkgver}"
  "amd-s2idle-analysis-script=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "amd-bios-logging-control-script"
  "amd-psr-identification-script"
  "amd-pstate-analysis-script"
  "amd-s2idle-analysis-script"
  "amdgpu-test-scripts-common"
)
replaces=(
  "amd-psr-identification-script<=r286"
  "amd-s2idle-analysis-script<=r286"
  "amdgpu-test-scripts-common<=r286"
)
if [ -n "${_vcssuffix}" ]; then
  provides+=("amdgpu-test-scripts-common")
  conflicts+=("amdgpu-test-scripts-common")
fi

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

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

package() {
  cd "${srcdir}/${_pkgbase}"

  ## Install python libraries
  local _pysitepkgdir="$(python -c "import site; print(site.getsitepackages()[0])")"
  install -dvm775 "${pkgdir}/${_pysitepkgdir}"
  cp -rv amd_debug "${pkgdir}/${_pysitepkgdir}"/

  ## Install executables
  local _amdbin _bin
  for _amdbin in amd_bios amd_pstate amd_s2idle; do
    install -Dvm755 "${_amdbin}.py" "${pkgdir}/usr/bin/${_amdbin}"
  done
  for _bin in psr; do
    install -Dvm755 "${_bin}.py" "${pkgdir}/usr/bin/amd_${_bin}"
  done
  ## Create symlinks to be compatible with the content of the `replaces`/ 'provides` array(s)
  ln -svr "${pkgdir}/usr/bin/amd_bios"   "${pkgdir}/usr/bin/amd_bios-logging"
  ln -svr "${pkgdir}/usr/bin/amd_psr"    "${pkgdir}/usr/bin/amd_psr-identification"
  ln -svr "${pkgdir}/usr/bin/amd_pstate" "${pkgdir}/usr/bin/amd_pstate-analysis"
  ln -svr "${pkgdir}/usr/bin/amd_s2idle" "${pkgdir}/usr/bin/amd_s2idle-analysis"

  ## Install documentation
  for _docfile in git.log website.url README.md; do
    install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}" "${srcdir}/${_pkgbase}/${_docfile}"
  done

  ## Install license information
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "license-info.txt"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}"/* "${pkgdir}/usr/share/doc/${_pkgbase}"/
}
