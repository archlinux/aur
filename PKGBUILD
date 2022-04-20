# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Maintainer: sukanka <su975853527[AT]gmail.com>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgbase=matlab
pkgname=('matlab' 'python-matlabengine')
pkgrel=3
# No need to modify the pkgver here, it will be determined by the script
# in the offline installer.
pkgver=9.12.0.1903524
pkgdesc='A high-level language for numerical computation and visualization'
arch=('x86_64')
url='http://www.mathworks.com'
license=(custom)
makedepends=('findutils' 'gendesk' 'icoutils' 'python')
# Some of the dependencies probably are not needed.
# If you play around with them and find which one can be removed,
# please contact the maintainers.
# For a list of possible dependencies, see here:
# https://hub.docker.com/r/mathworks/matlab-deps/dockerfile.
depends=(
  'alsa-lib'
  'atk'
  'ca-certificates'
  'cairo'
  'fontconfig'
  'gdk-pixbuf2'
  'glib2'
  'gst-plugins-base'
  'gstreamer'
  'gtk3'
  'krb5'
  'libcap'
  'libcups'
  'libdbus'
  'libdrm'
  'libgcrypt'
  'libselinux'
  'libsm'
  'libsndfile'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxcrypt-compat'
  'libxcursor'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxft'
  'libxi'
  'libxmu'
  'libxrandr'
  'libxrender'
  'libxslt'
  'libxss'
  'libxt'
  'libxtst'
  'libxxf86vm'
  'lsb-release'
  'make'
  'mesa'
  'net-tools'
  'nspr'
  'nss'
  'pam'
  'pango'
  'procps-ng'
  'sudo'
  'unzip'
  'util-linux-libs'
  'wget'
  'x11vnc'
  'xorg-server-xvfb'
  'zlib')
# We should check even these ones.
# GCC: https://www.mathworks.com/support/requirements/supported-compilers.html
depends+=(
  'gconf'
  'glu'
  'libunwind'
  'libxp'
  'libxpm'
  'portaudio'
  'qt5-svg'
  'qt5-webkit'
  'qt5-websockets'
  'qt5-x11extras'
  'xerces-c')
provides=('matlab-bin' 'matlab' 'python-matlabengine')
source=(
  'local://matlab.tar'
  'local://matlab.fik'
  'local://matlab.lic'
)
md5sums=(SKIP SKIP SKIP)

# Set this to `true` to do a partial install, otherwise install all products.
partialinstall=false
# Example list of products for a partial install. Check the README for details.
products=(
  "MATLAB"
  "Simulink"
)

instdir="usr/lib/${pkgbase}"

pkgver() {
  cat "${srcdir}/${pkgbase}/VersionInfo.xml" | grep "<version>" | sed "s|\s*<version>\(.*\)</version>\s*|\1|g"
}

prepare() {
  # Extract file installation key.
  release=$(cat "${srcdir}/${pkgbase}/VersionInfo.xml" | grep "<release>" | sed "s|\s*<release>\(.*\)</release>\s*|\1|g")

  msg2 "Release from tarball: ${release}"

  _fik=$(grep -o '[0-9-]*' "${srcdir}/${pkgbase}.fik")

  msg2 "Modifying installer settings..."

  _set="${srcdir}/${pkgbase}/installer_input.txt"
  sed -i "s|^# destinationFolder=|destinationFolder=${srcdir}/build|" "${_set}"
  sed -i "s|^# fileInstallationKey=|fileInstallationKey=${_fik}|"     "${_set}"
  sed -i "s|^# agreeToLicense=|agreeToLicense=yes|"                   "${_set}"
  sed -i "s|^# improveMATLAB=yes|improveMATLAB=no|"                   "${_set}"
  sed -i "s|^# licensePath=|licensePath=${srcdir}/matlab.lic|"        "${_set}"

  # Install specified products if partialinstall is set to 'true'.
  if [ "${partialinstall}" = 'true' ]; then
    for _prod in "${products[@]}"; do
      sed -i 's|^#\(product.'"${_prod}"'\)|\1|' "${_set}"
    done
  fi

  msg2 "Generating desktop file..."
  # Add a fix for Intel GPUs with mesa 20, see:
  # https://wiki.archlinux.org/index.php/MATLAB#OpenGL_acceleration
  # https://wiki.archlinux.org/index.php/Intel_graphics#Old_OpenGL_Driver_(i965)
  gendesk -f -n \
    --pkgname "${pkgbase}" \
    --pkgdesc "${pkgdesc}" \
    --name "MATLAB" \
    --categories "Development;Education;Science;Mathematics;IDE" \
    --mimetypes "application/x-matlab-data;text/x-matlab" \
    --icon "${pkgbase}" \
    --exec 'sh -c '\''if [ "${MATLAB_INTEL_OVERRIDE}" = "yes" ] ; then exec env MESA_LOADER_DRIVER_OVERRIDE=i965 GTK_PATH=/usr/lib/gtk-2.0 matlab -desktop ; else exec env GTK_PATH=/usr/lib/gtk-2.0 matlab -desktop ; fi'\'

}

build() {
  msg2 "Running original installer..."
  # Using the installer with the -inputFile parameter will automatically
  # cause the installation to be non-interactive
  "${srcdir}/${pkgbase}/install" -inputFile "${srcdir}/${pkgbase}/installer_input.txt"

  msg2 "Building Python API..."

  cd "${srcdir}/build/extern/engines/python"

  msg2 "Checking supported vs existing MATLAB versions..."
  _matminor="$(find "${srcdir}/build/extern/engines/python" \
    -name 'matlabengineforpython3*.so' |
    sort |
    sed 's|.*matlabengineforpython3_\([0-9]\+\)\.so|\1|g' |
    tail -1)"
  _pytminor="$(python -c 'import sys; print(sys.version_info.minor)')"

  msg2 "Spoofing Python version compatibility if not applicable..."
  if [[ "${_pytminor}" != "${_matminor}" ]]; then
    _matcustom="${srcdir}/sitecustomize.py"
    touch "${_matcustom}"
    echo 'import sys'                               >> "${_matcustom}"
    echo "sys.version_info = (3, ${_matminor}, 0)"  >> "${_matcustom}"
  fi

  PYTHONPATH="${srcdir}" python setup.py build

  msg2 "Removing build licenses..."
  rm -rf "${srcdir}/build/licenses/*"
}


package_python-matlabengine() {
  depends+=("python" "matlab")

  msg2 "Installing license..."
  install -D -m644 "${srcdir}/${pkgbase}/license_agreement.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  msg2 "Packaging Python API..."
  cd "${srcdir}/build/extern/engines/python"
  PYTHONPATH="${srcdir}" python setup.py install --root="${pkgdir}" --optimize 1 --skip-build

  msg2 "Spoofing trick to fool MATLAB into believing current Python version is supported..."
  _matminor="$(find "${srcdir}/build/extern/engines/python" \
    -name 'matlabengineforpython3*.so' |
    sort |
    sed 's|.*matlabengineforpython3_\([0-9]\+\)\.so|\1|g' |
    tail -1)"
  _prefix="$(python -c 'import sys; print(sys.prefix)')"
  _pytminor="$(python -c 'import sys; print(sys.version_info.minor)')"

  msg2 "Changing around locations if spoofing is needed..."
  if [[ "${_pytminor}" != "${_matminor}" ]]; then
    mv "${pkgdir}/${_prefix}/lib/python3".{"${_matminor}","${_pytminor}"}
    _egginfo="$(ls "${pkgdir}/${_prefix}/lib/python3.${_pytminor}/site-packages/"*"-py3.${_matminor}.egg-info")"
    mv "${_egginfo}" "${_egginfo%py3."${_matminor}".egg-info}py3.${_pytminor}.egg-info"
    sed -i "s|sys.version_info|(3, $_matminor, 0)|" \
      "${pkgdir}/${_prefix}/lib/python3.${_pytminor}/site-packages/matlab/engine/__init__.py"
  fi

  msg2 "Fixing erroneous references in the _arch.txt files..."
  errstr=$(realpath "${srcdir}/build/extern/engines/python/")
  trustr="/${instdir}/extern/engines/python/"
  for _dir in \
    "${srcdir}/build/extern/engines/python/build/lib/matlab/engine" \
    "${pkgdir}/${_prefix}/lib/python3.${_pytminor}/site-packages/matlab/engine" \
    ; do
    sed -i "s|${errstr}|${trustr}|" "${_dir}/_arch.txt"
  done
}

package_matlab() {
  # Compilers should be optional dependencies.
  msg2 "Determining compiler versions..."
  if [ "$(vercmp ${pkgver} "9.10" )" -ge "0" ]; then
    optdepends+=('gcc9: For MEX support'
                 'gcc8-fortran: For MEX support')
    gccexc="gcc-9"
    gppexc="g++-9"
    gfortranlib="gcc8-fortran"
    gfortranexc="gfortran-8"
  elif [ "$(vercmp ${pkgver} "9.9" )" -ge "0" ]; then
    optdepends+=('gcc8: For MEX support'
                 'gcc8-fortran: For MEX support')
    gccexc="gcc-8"
    gppexc="g++-8"
    gfortranlib="gcc8-fortran"
    gfortranexc="gfortran-8"
  elif [ "$(vercmp ${pkgver} "9.4" )" -ge "0" ]; then
    optdepends+=('gcc6: For MEX support'
                 'gcc6-fortran: For MEX support')
    gccexc="gcc-6"
    gppexc="g++-6"
    gfortranlib="gcc6-fortran"
    gfortranexc="gfortran-6"
  elif [ "$(vercmp ${pkgver} "9.1" )" -ge "0" ]; then
    optdepends+=('gcc49: For MEX support')
    gccexc="gcc-49"
    gppexc="g++-49"
    gfortranlib="gcc49"
    gfortranexc="gfortran-49"
  elif [ "$(vercmp ${pkgver} "8.2" )" -ge "0" ]; then
    optdepends+=('gcc47: For MEX support')
    gccexc="gcc-47"
    gppexc="g++-47"
    gfortranlib="gcc47"
    gfortranexc="gfortran-47"
  else
    msg2 "You need to install the GCC for MEX support yourself."
    msg2 "Visit here to determine your needed GCC version."
    msg2 "https://www.mathworks.com/support/requirements/previous-releases.html"
    msg2 "Create your own GCC package with name \"gcc-matlab\", and link these excutables to /usr/bin:"
    msg2 "gcc-matlab g++-matlab gfortran-matlab"
    gccexc="gcc-matlab"
    gppexc="g++-matlab"
    gfortranlib="gcc-matlab"
    gfortranexc="gfortran-matlab"
  fi

  msg2 "Moving files from build area..."
  install -dm755 "${pkgdir}/usr/lib/"
  mv "${srcdir}/build" "${pkgdir}/${instdir}"

  msg2 "Installing license..."
  install -D -m644 "${srcdir}/${pkgbase}/license_agreement.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  msg2 "Symlinking executables..."
  install -d -m755 "${pkgdir}/usr/bin/"
  for _executable in deploytool matlab mbuild activate_matlab.sh; do
    ln -s "/${instdir}/bin/${_executable}" "${pkgdir}/usr/bin/${_executable}"
  done
  # This would otherwise conflict with mixtex.
  ln -s "/${instdir}/bin/mex" "${pkgdir}/usr/bin/mex-${pkgbase}"
  # This would otherwise conflict with Mathematica.
  ln -s "/${instdir}/bin/mcc" "${pkgdir}/usr/bin/mcc-${pkgbase}"
  # Allow external software to find the MATLAB linter binary.
  ln -s "/${instdir}/bin/glnxa64/mlint" "${pkgdir}/usr/bin/mlint"

  msg2 "Installing desktop files..."
  install -D -m644 "${srcdir}/${pkgbase}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgbase}.desktop"
  install -Dm644 "${srcdir}/${pkgbase}/bin/glnxa64/cef_resources/matlab_icon.png" "$pkgdir/usr/share/pixmaps/$pkgbase.png"

  msg2 "Linking mex options to ancient libraries..."
  sysdir="bin/glnxa64/mexopts"
  mkdir -p "${pkgdir}/${instdir}/backup/${sysdir}"
  cp "${pkgdir}/${instdir}/${sysdir}/gcc_glnxa64.xml" \
    "${pkgdir}/${instdir}/backup/${sysdir}/"
  sed -i "s/gcc/${gccexc}/g" "${pkgdir}/${instdir}/${sysdir}/gcc_glnxa64.xml"
  cp "${pkgdir}/${instdir}/${sysdir}/g++_glnxa64.xml" \
    "${pkgdir}/${instdir}/backup/${sysdir}/"
  sed -i "s/g++/${gppexc}/g" "${pkgdir}/${instdir}/${sysdir}/g++_glnxa64.xml"
  cp "${pkgdir}/${instdir}/${sysdir}/gfortran.xml" \
    "${pkgdir}/${instdir}/backup/${sysdir}/"
  sed -i "s/gfortran/${gfortranexc}/g" "${pkgdir}/${instdir}/${sysdir}/gfortran.xml"
  cp "${pkgdir}/${instdir}/${sysdir}/gfortran6.xml" \
    "${pkgdir}/${instdir}/backup/${sysdir}/"
  sed -i "s/gfortran/${gfortranexc}/g" "${pkgdir}/${instdir}/${sysdir}/gfortran6.xml"

  msg2 "Removing unused library files..."
  # <MATLABROOT>/sys/os/glnxa64/README.libstdc++
  sysdir="sys/os/glnxa64"
  install -d -m755 "${pkgdir}/${instdir}/backup/${sysdir}"
  mv "${pkgdir}/${instdir}/${sysdir}/"{libstdc++.so.*,libgcc_s.so.*,libgfortran.so.*,libquadmath.so.*} \
    "${pkgdir}/${instdir}/backup/${sysdir}/"
  mv ${pkgdir}/${instdir}/bin/glnxa64/libfreetype.so.* \ # See the README, "Off-line installer", step 3
    "${pkgdir}/${instdir}/backup/bin/glnxa64/"
}
