# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Antheas Kapenekakis (https://aur.archlinux.org/account/antheas)

_pkgbase=hhd
_vcssuffix="-git"
pkgbase="${_pkgbase}${_vcssuffix}"
pkgname=(
  "${pkgbase}"
  "${_pkgbase}-systemd${_vcssuffix}"
  "${_pkgbase}-license${_vcssuffix}"
  "${_pkgbase}-doc${_vcssuffix}"
)
pkgver=1.1.4+16.r531.20240201.c980f91
pkgrel=3
pkgdesc='Handheld Daemon. A tool for managing the quirks of handheld devices. Latest git checkout.'
arch=(
  'x86_64'
)
url='https://github.com/hhd-dev/hhd'
license=('MIT')

makedepends=(
  'git'
  'python-'{'build','installer','setuptools','wheel'}
)
source=(
  "${_pkgbase}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)


prepare() {
  cd "${srcdir}/${_pkgbase}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgbase}"

  _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
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

  python -m build --wheel --no-isolation
}

package_hhd-git() {
  depends=(
    "${_pkgbase}-license${_vcssuffix}=${pkgver}"
    'python'
    'python-evdev'
    'python-rich'
    'python-yaml'
  )
  optdepends=(
    "${_pkgbase}-doc: For documentation."
    "${_pkgbase}-ui: A (browser based) graphical user interface for ${_pkgbase}."
    "${_pkgbase}-user: allows running hhd as a user service."
    "${_pkgbase}-systemd: For automatic startup at system boot."
  )
  provides=(
    "${_pkgbase}=${pkgver}"
  )
  conflicts=(
    "${_pkgbase}"
  )

  cd "${srcdir}/${_pkgbase}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_hhd-systemd-git() {
  pkgdesc="Systemd service file for '${_pkgbase}'. Latest git checkout."
  arch=('any')
  depends=(
    "${_pkgbase}"
    "${_pkgbase}-license${_vcssuffix}=${pkgver}"
    "python-setuptools"
  )
  optdepends=(
    "systemd: To make use of this systemd service."
  )
  provides=(
    "${_pkgbase}-systemd=${pkgver}"
  )
  conflicts=(
    "${_pkgbase}-systemd"
  )

  cd "${srcdir}/${_pkgbase}"

  # Install minimally necessary rules for running as a system service
  install -Dvm644 usr/lib/udev/rules.d/83-hhd.rules "${pkgdir}/usr/lib/udev/rules.d/83-hhd.rules"
  install -Dvm644 usr/lib/systemd/system/hhd@.service "${pkgdir}/usr/lib/systemd/system/hhd@.service"

  install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_hhd-doc-git() {
  pkgdesc="Documentation for '${_pkgbase}'."
  arch=('any')
  depends=(
    "${_pkgbase}-license${_vcssuffix}=${pkgver}"
  )
  optdepends=(
    "${_pkgbase}: The software this Documentation is for."
  )
  provides=(
    "${_pkgbase}-doc=${pkgver}"
  )
  conflicts=(
    "${_pkgbase}-doc"
  )

  cd "${srcdir}/${_pkgbase}"

  install -dvm755 "${pkgdir}/usr/share/doc/${_pkgbase}"
  cp -rv docs "${pkgdir}/usr/share/doc/${_pkgbase}"/
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}" git.log readme.md

  install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_hhd-license-git() {
  pkgdesc="Common license file for '${pkgbase}' and '${_pkgbase}-systemd${_vcssuffix}'."
  arch=('any')
  depends=()
  optdepends=(
    "${pkgbase}=${pkgver}: The software this license file is for."
    "${_pkgbase}-systemd${_vcssuffix}=${pkgver}: The code this license file is for."
  )
  provides=()
  conflicts=()

  cd "${srcdir}/${_pkgbase}"

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgbase}" LICENSE
  install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
