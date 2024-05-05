# Maintainer: dreieck

_pkgname='tingle'
pkgname="${_pkgname}-git"
epoch=0
pkgver=r394.20240401.1ca0b83
pkgrel=3
pkgdesc="Patcher for Android system ROMs that allows to inject features without needing to recompile the OS or install Xposed."
arch=(
  'i686'
  'x86_64'
)
license=('GPL-3.0-or-later')
url='https://github.com/ale5000-git/tingle'
depends=(
  'java-runtime'
  'python>=3'
  # 'python-pycompatlayer>=0.0.10' # Ise bundled with the package.
  'unzip'
  'zip'
)
makedepends=(
  'git'
)
optdepends=(
  'adb:   To patch a file from a connected device.'
  "p7zip: Can alternatively be used over 'zip' and 'unzip'."
)
replaces=()
conflicts=(
  "${_pkgname}"
)
provides=(
  "${_pkgname}"
)
install="${_pkgname}.install"
source=(
  "${_pkgname}::git+${url}.git"
  'tingle-usage-on-arch.md'
  "${install}"
)
sha256sums=(
  'SKIP'                                                              # Main git source
  '28cb940047dc5570971afbed0dbc1195d396d111d49fddfd1478d90c923328e2'  # tingle-usage-on-arch.md
  '91434889a51673e6fa9801adf19d94d5e9021e45138db8b644049abe9bd6dab5'  # $install
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Could not determine git commit count."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install software.
  install -dvm755 "${pkgdir}/opt/${_pkgname}"
  install -dvm755 "${pkgdir}/var/${_pkgname}"
  install -dvm777 "${pkgdir}/var/${_pkgname}/input"
  install -dvm777 "${pkgdir}/var/${_pkgname}/output"
  cp -rv * "${pkgdir}/opt/${_pkgname}"/
  rm -r "${pkgdir}/opt/${_pkgname}/licenses"    # Only a license for some Windows tool
  rm -r "${pkgdir}/opt/${_pkgname}/requirements"  # Does not contain useful information. Listed requirement 'PyCompatLayer' is already part of this package.
  rm -r "${pkgdir}/opt/${_pkgname}/tools/win"   # Only a Windows tool
  rm -r "${pkgdir}/opt/${_pkgname}/tools/win64" # Only a Windows tool
  rm -r "${pkgdir}/opt/${_pkgname}/LICENSE.md"  # Installed into /usr/share/licenses/${pkgname}/
  rm -r "${pkgdir}/opt/${_pkgname}/README.md"   # Installed into /usr/share/doc/${_pkgname}/
  mv -v "${pkgdir}/opt/${_pkgname}/input"/*   "${pkgdir}/var/${_pkgname}/input"/
  mv -v "${pkgdir}/opt/${_pkgname}/output"/*  "${pkgdir}/var/${_pkgname}/output"/
  rmdir "${pkgdir}/opt/${_pkgname}/input"     "${pkgdir}/opt/${_pkgname}/output"
  ln -sv "/var/${_pkgname}/input"             "${pkgdir}/opt/${_pkgname}"/
  ln -sv "/var/${_pkgname}/output"            "${pkgdir}/opt/${_pkgname}"/

  # Install executable into /usr/bin/
  install -dvm755 "${pkgdir}/usr/bin"
  ln -sv "/opt/${_pkgname}/main.py" "${pkgdir}/usr/bin"/${_pkgname}

  # Install documentation.
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${srcdir}/git.log" "${srcdir}/tingle-usage-on-arch.md" 'README.md'

  # Install license.
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE.md"
}
