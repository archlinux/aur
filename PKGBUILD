# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Maintainer: sukanka <su975853527[AT]gmail.com>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgbase=matlab
pkgname=(matlab)
pkgrel=1
pkgver=9.13.0.2049777
pkgdesc='A high-level language for numerical computation and visualization'
arch=(x86_64)
url='https://www.mathworks.com'
license=(custom)
depends=(matlab-meta)
makedepends=('findutils' 'gendesk' 'icoutils' 'python')
provides=('matlab-bin' 'matlab')
source=(
  'local://matlab.tar'
  'local://matlab.fik'
  'local://matlab.lic'
)
b2sums=(SKIP SKIP SKIP)

# Example list of products for a partial install. Check the README for details.
# Leave empty for a full installation.
_products=(
  "MATLAB"
  "Simulink"
)
_release=''
_instdir="usr/lib/matlab"

pkgver() {
  _release=$(cat "${srcdir}/${pkgbase}/VersionInfo.xml" | grep "<release>" | sed "s|\s*<release>\(.*\)</release>\s*|\1|g")
  cat "${srcdir}/${pkgbase}/VersionInfo.xml" | sed --quiet 's|\s*<version>\(.*\)</version>\s*|\1|p'
}

prepare() {
  msg2 "Release from tarball: ${_release}"

  msg2 "Modifying installer settings..."
  _fik=$(grep -o '[0-9-]*' "${srcdir}/matlab.fik")
  _set="${srcdir}/${pkgbase}/installer_input.txt"
  sed -i "s|^# destinationFolder=|destinationFolder=${srcdir}/build|" "${_set}"
  sed -i "s|^# fileInstallationKey=|fileInstallationKey=${_fik}|"     "${_set}"
  sed -i "s|^# agreeToLicense=|agreeToLicense=yes|"                   "${_set}"
  sed -i "s|^# outputFile=|outputFile=${srcdir}/../install.log|"      "${_set}"
  sed -i "s|improveMATLAB=yes|improveMATLAB=no|"                      "${_set}"
  sed -i "s|^# licensePath=|licensePath=${srcdir}/matlab.lic|"        "${_set}"

  # Install specified products if _products is non-empty.
  if [ "${#_products[@]}" -gt '0' ]; then
    for _prod in "${_products[@]}"; do
      sed -i 's|^#\(product.'"${_prod}"'\)$|\1|' "${_set}"
    done
  fi

  msg2 "Generating desktop file..."
  gendesk -f -n \
    --pkgname "${pkgbase}" \
    --pkgdesc "${pkgdesc}" \
    --name "MATLAB ${_release}" \
    --genericname "MATLAB" \
    --comment 'Programming and numeric computing platform' \
    --categories "Development;Education;Science;Mathematics;IDE" \
    --mimetypes "application/x-matlab-data;text/x-matlab" \
    --icon "${pkgbase}" \
    --exec 'matlab'
}

build() {
  msg2 "Running original installer..."
  # -inputFile makes the installation non-interactive.
  "${srcdir}/${pkgbase}/install" -inputFile "${srcdir}/${pkgbase}/installer_input.txt"
}

package_matlab() {
  msg2 "Moving files from build area to package area to save space..."
  install -dm755 "${pkgdir}/usr/lib/"
  mv "${srcdir}/build" "${pkgdir}/${_instdir}"

  msg2 "Installing license..."
  install -Dm644 "${srcdir}/${pkgbase}/license_agreement.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  msg2 "Symlinking executables..."
  install -dm755 "${pkgdir}/usr/bin/"
  for _executable in deploytool matlab mbuild activate_matlab.sh; do
    ln -s "/${_instdir}/bin/${_executable}" "${pkgdir}/usr/bin/${_executable}"
  done
  # This would otherwise conflict with mixtex.
  ln -s "/${_instdir}/bin/mex" "${pkgdir}/usr/bin/mex-${pkgbase}"
  # This would otherwise conflict with Mathematica.
  ln -s "/${_instdir}/bin/mcc" "${pkgdir}/usr/bin/mcc-${pkgbase}"
  # Allow external software to find the MATLAB linter binary.
  ln -s "/${_instdir}/bin/glnxa64/mlint" "${pkgdir}/usr/bin/mlint"

  msg2 "Installing desktop files..."
  install -Dm644 "${srcdir}/${pkgbase}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgbase}.desktop"
  install -Dm644 "${srcdir}/${pkgbase}/bin/glnxa64/cef_resources/matlab_icon.png" \
    "$pkgdir/usr/share/pixmaps/$pkgbase.png"

  msg2 "Linking mex options to ancient libraries..."
  sysdir="bin/glnxa64/mexopts"
  mkdir -p "${pkgdir}/${_instdir}/backup/${sysdir}"
  cp "${pkgdir}/${_instdir}/${sysdir}/gcc_glnxa64.xml" \
    "${pkgdir}/${_instdir}/backup/${sysdir}/"
  sed -i "s/gcc/${gccexc}/g" "${pkgdir}/${_instdir}/${sysdir}/gcc_glnxa64.xml"
  cp "${pkgdir}/${_instdir}/${sysdir}/g++_glnxa64.xml" \
    "${pkgdir}/${_instdir}/backup/${sysdir}/"
  sed -i "s/g++/${gppexc}/g" "${pkgdir}/${_instdir}/${sysdir}/g++_glnxa64.xml"
  cp "${pkgdir}/${_instdir}/${sysdir}/gfortran.xml" \
    "${pkgdir}/${_instdir}/backup/${sysdir}/"
  sed -i "s/gfortran/${gfortranexc}/g" "${pkgdir}/${_instdir}/${sysdir}/gfortran.xml"
  cp "${pkgdir}/${_instdir}/${sysdir}/gfortran6.xml" \
    "${pkgdir}/${_instdir}/backup/${sysdir}/"
  sed -i "s/gfortran/${gfortranexc}/g" "${pkgdir}/${_instdir}/${sysdir}/gfortran6.xml"

  msg2 "Removing unused library files..."
  # <MATLABROOT>/sys/os/glnxa64/README.libstdc++
  sysdir="sys/os/glnxa64"
  install -dm755 "${pkgdir}/${_instdir}/backup/${sysdir}"
  mv "${pkgdir}/${_instdir}/${sysdir}/"{libstdc++.so.*,libgcc_s.so.*,libgfortran.so.*,libquadmath.so.*} \
    "${pkgdir}/${_instdir}/backup/${sysdir}/"
  mv "${pkgdir}/${_instdir}"/bin/glnxa64/libfreetype.so.* \
    "${pkgdir}/${_instdir}"/backup/bin/glnxa64/
}
