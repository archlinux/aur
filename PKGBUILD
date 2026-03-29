# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Jesse R Codling <jclds139@gmail.com>
# Contributor: Ariel Lieberman <rellieberman at gmail dot com>
# Contributer: Michael R. Shannon <mrshannon.aerospace@gmail.com>

: "${MAKEPKG_MATLAB_PREFIX:=/opt}"
: "${MAKEPKG_MATLAB_ROOT:=${MAKEPKG_MATLAB_PREFIX}/MATLAB}"

_name="matlab"
_suffix="-support"
pkgbase="${_name}${_suffix}"
pkgname=(
  "${_name}${_suffix}"
  "${_name}-gcc${_suffix}"
  "${_name}-gcc-fortran${_suffix}"
)
pkgver=R2025b+25.2.9.9999999
_release="${pkgver%+*}"
_version="${pkgver##*+}"
pkgrel=1
epoch=1
pkgdesc="A high-level language for numerical computation and visualization"
arch=(
  'any' # 'glnxa64'
)
url="https://www.mathworks.com/products/matlab.html"
license=(
  '0BSD'
)
makedepends=(
  'gendesk'
  'gnutls3.8.9'
)

pkgver() {
  local -A _versions=(
    ["${_release::5}a"]="${_release:3:2}.1"
    ["${_release::5}b"]="${_release:3:2}.2"
  )

  printf '%s+%s.9.9999999' "${_release}" "${_versions[${_release}]}"
}

build() {
  cd "${srcdir}"
  gendesk -f -n \
    --pkgname "${_name}" \
    --pkgdesc "${pkgdesc}" \
    --name "MATLAB" \
    --comment 'Programming and numeric computing platform' \
    --exec "${_name} -desktop -useStartupFolderPref" \
    --icon "${MAKEPKG_MATLAB_ROOT}/${_release}/bin/glnxa64/cef_resources/matlab_icon.png" \
    --categories 'Development;Education;Science;Mathematics;IDE' \
    --mimetypes 'application/x-matlab-data;text/x-matlab'
}

package_matlab-support() {
  depends=(
    "${_name}-meta>=${_release}"
    'gnutls3.8.9'
  )
  optdepends=(
    "${_name}-meta-all: all runtime dependencies"
    "${_name}-jre-meta: JRE runtime dependency"
    "${_name}-gcc${_suffix}: GCC runtime dependency"
    "${_name}-gcc-fortran${_suffix}: GCC Fortran runtime dependency"
  )
  provides+=(
    "${_name}=${pkgver}"
    "${_name}-release=${_release}"
    "${_name}-version=${_version}"
    "${_name}-${_release,,}=${_version}"

    "java-${_name}=${pkgver}"
    "java-${_name}-release=${_release}"
    "java-${_name}-version=${_version}"
    "java-${_name}-${_release,,}=${_version}"
  )
  conflicts+=(
    "${_name}"
    "${_name}-${_release,,}"

    "java-${_name}"
    "java-${_name}-${_release,,}"
  )

  cd "${srcdir}"
  echo "  -> Installing MATLAB root directory..."
  # install -vdm755 "${pkgdir}/${MAKEPKG_MATLAB_ROOT}/${_release}"
  install -vdm755 "${pkgdir}/${MAKEPKG_MATLAB_ROOT}"
  install -vdm777 "${pkgdir}/${MAKEPKG_MATLAB_ROOT}/${_release}"

  echo "  -> Downgrading GnuTLS version..."
  install -vdm777 "${pkgdir}/${MAKEPKG_MATLAB_ROOT}/${_release}/bin/glnxa64"
  find "/usr/lib/gnutls3.8.9" -maxdepth 1 -type f,l -name 'lib*.so*' -exec \
    ln -vsf {} "${pkgdir}/${MAKEPKG_MATLAB_ROOT}/${_release}/bin/glnxa64/" \;

  echo "  -> Installing desktop file..."
  install -vDm644 "${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"

  echo "  -> Installing license..."
  install -vd "${pkgdir}/usr/share/licenses/${_name}"
  ln -vsf "${MAKEPKG_MATLAB_ROOT}/${_release}/license_agreement.txt" \
    "${pkgdir}/usr/share/licenses/${_name}/LICENSE.txt"

  echo "  -> Installing symlinks..."
  install -vd "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  for bin in matlab matlab_jenv; do
    ln -vsf "${MAKEPKG_MATLAB_ROOT}/${_release}/bin/${bin}" "${bin}"
    ln -vsf "${MAKEPKG_MATLAB_ROOT}/${_release}/bin/${bin}" "${bin}-${_release}"
  done
  # owned by miktex, ...
  for bin in mex mexext; do
    ln -vsf "${MAKEPKG_MATLAB_ROOT}/${_release}/bin/${bin}" "${_name}-${bin}"
    ln -vsf "${MAKEPKG_MATLAB_ROOT}/${_release}/bin/${bin}" "${_name}-${bin}-${_release}"
  done
  for bin in MathWorksCrashReporter MathWorksLicenseDeactivation \
             MathWorksProductAuthorizer MathWorksProductUninstaller; do
    ln -vsf "${MAKEPKG_MATLAB_ROOT}/${_release}/bin/glnxa64/${bin}" "${bin}"
    ln -vsf "${MAKEPKG_MATLAB_ROOT}/${_release}/bin/glnxa64/${bin}" "${bin}-${_release}"
  done
}

package_matlab-gcc-support() {
  depends=(
    "${pkgbase}>=${epoch}:${pkgver}-${pkgrel}"
    "${_name}-gcc-meta>=${_release}"
  )
  provides=(
    "${_name}-gcc=${pkgver}"
    "${_name}-gcc-release=${_release}"
    "${_name}-gcc-version=${_version}"
    "${_name}-${_release,,}-gcc=${_version}"
  )
  conflicts=(
    "${_name}-gcc"
    "${_name}-${_release,,}-gcc"
  )
}

package_matlab-gcc-fortran-support() {
  depends=(
    "${pkgbase}>=${epoch}:${pkgver}-${pkgrel}"
    "${_name}-gcc-fortran-meta>=${_release}"
  )
  provides=(
    "${_name}-gcc-fortran=${pkgver}"
    "${_name}-gcc-fortran-release=${_release}"
    "${_name}-gcc-fortran-version=${_version}"
    "${_name}-${_release,,}-gcc-fortran=${_version}"
  )
  conflicts=(
    "${_name}-${_release,,}-gcc"
  )
}
