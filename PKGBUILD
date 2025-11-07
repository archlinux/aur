# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgbase='amd-debug-tools'
_vcssuffix="-git"
pkgbase="${_pkgbase}${_vcssuffix}"
_pkgname="${_pkgbase}"
pkgname="${pkgbase}"
epoch=0
pkgver=0.2.9+2.r555.20251101.ad6e2fc
pkgrel=2
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
  'python>=3.7'
  #'python-distro'
  'python-packaging'
  'python-pandas'
  'python-pyudev'
  'python-tabulate'
)
optdepends=(
  "fwupd>=2:          For device firmware checks ('amd-s2idle')."
  "python-common:     For optional model checks ('amd-s2idle')."
  "glib2:             For device firmware checks ('amd-s2idle')."
  "python-gobject:    For device firmware checks ('amd-s2idle')."
  "python-cysystemd:  To access the kernel log via the systemd journal (fallback is 'dmesg') ('amd-s2idle')."
  "python-systemd:    To access the kernel log via the systemd journal (fallback is 'dmesg') ('amd-s2idle') | Needed to run 'amd-bios'."
  "python-matplotlib: For 'site-packages/amd_debug/sleep_report.py', used by 'amd-s2idle'"
  "python-seaborn:    For 'site-packages/amd_debug/sleep_report.py', used by 'amd-s2idle'."
  "util-linux:        To access the kernel log via 'dmesg' ('amd-s2idle')."
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools>=59.8.0'
  'python-setuptools-scm>=8'
  'python-setuptools-git-versioning>=2.0'
  'python-setuptools-git-versioning<3'
  'python-wheel'
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

build() {
  cd "${srcdir}/${_pkgbase}"

  printf '%s\n' " --> building ..."
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgbase}"

  printf '%s\n' " --> installing ..."
  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl
  local bin
  for _bin in psr; do
    install -Dvm755 "${_bin}.py" "${pkgdir}/usr/bin/amd-${_bin}"
  done

  ln -svr "${pkgdir}/usr/bin/amd-bios"   "${pkgdir}/usr/bin/amd_bios-logging"
  ln -svr "${pkgdir}/usr/bin/amd-psr"    "${pkgdir}/usr/bin/amd_psr-identification"
  ln -svr "${pkgdir}/usr/bin/amd-pstate" "${pkgdir}/usr/bin/amd_pstate-analysis"
  ln -svr "${pkgdir}/usr/bin/amd-s2idle" "${pkgdir}/usr/bin/amd_s2idle-analysis"

  ## Install documentation
  for _docfile in git.log website.url README.md; do
    install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}" "${srcdir}/${_pkgbase}/${_docfile}"
  done

  ## Install license information
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "license-info.txt"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}"/* "${pkgdir}/usr/share/doc/${_pkgbase}"/
}
